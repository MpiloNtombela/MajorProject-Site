<%@ control language="C#" autoeventwireup="true" codebehind="UcMDocReader.ascx.cs" inherits="RegistrationSystem.UserControls.UcMDocReader" %>

<asp:Panel runat="server" BorderStyle="None" ID="MDocCont" CssClass="container-fluid px-0 shadow-sm position-relative">
    <asp:HiddenField ID="Url" runat="server" />
    <asp:HiddenField ID="Name" runat="server" />
    <asp:HiddenField ID="Base64" runat="server" />
    <div class="navbar navbar-light bg-light">
        <div class="container-lg justify-content-start justify-content-sm-between">
            <div class="navbar-brand me-2">
                <img
                    runat="server"
                    src="~/Content/Static/MLogo.svg"
                    height="20"
                    alt=""
                    loading="lazy"
                    style="margin-top: -.25rem;" />
                <span class="d-none d-sm-inline">MDoc</span>
            </div>
            <div runat="server" id="DocTitle"
                data-mdb-toggle="tooltip"
                title=""
                data-mdb-placement="bottom"
                class="d-inline-block navbar-text fw-bold text-truncate"
                style="max-width: 200px">
                MDoc PDF Reader
            </div>
            <div class="d-none d-sm-flex align-items-center" style="gap: .5rem">
                <button
                    runat="server" id="AspectRatio"
                    data-mdb-toggle="tooltip"
                    title="zoom in/out"
                    type="button" class="btn btn-outline-secondary Mtext btn-floating mt-1">
                    <span class="material-icons-outlined">exposure</span>
                </button>
                <button
                    runat="server" id="PrevPage" type="button"
                    data-mdb-toggle="tooltip"
                    title="prev page"
                    class="btn Mbg btn-floating shadow-0">
                    <span class="material-icons-round" style="line-height: 1.35">keyboard_arrow_left</span>
                </button>
                <span class="text-dark d-inline-block mx-2 fw-bold"><span runat="server" id="NumPage"></span>/ <span runat="server" id="NumDocPages"></span></span>
                <button runat="server" id="NextPage" type="button"
                    data-mdb-toggle="tooltip"
                    title="next page"
                    class="btn brn-sm Mbg btn-floating shadow-0">
                    <span class="material-icons-round" style="line-height: 1.35">keyboard_arrow_right</span>
                </button>
            </div>
        </div>
    </div>
    <div id="Loader" runat="server" class="progress mt-0">
        <div class="indeterminate bg-secondary"></div>
    </div>
    <div runat="server" id="MDocBody" class="d-felx mx-0 justify-content-center mb-3 px-3 mdoc-reader">
        <div class="d-flex justify-content-center mt-3 px-0">
            <canvas class="shadow" runat="server" id="Viewport" style="max-width: 100%"></canvas>
        </div>
    </div>
    <div class="position-absolute bottom-0 start-50 translate-middle mw-100" style="min-width: 300px" runat="server" id="ErrorMsg"></div>

    <div class="mdoc-options rounded-3 translate-middle d-block d-sm-none">
        <div class="btn-group shadow-0" role="group" aria-label="MDoc buttons">
            <button id="AspectRatioSm" runat="server" type="button" class="btn btn-outline-primary border-0 text-light py-0 px-2 px-sm-3">
                <span class="material-icons-round" style="line-height: 1.25">exposure</span>
            </button>
            <button id="PrevPageSm" runat="server" type="button" class="btn btn-outline-primary border-0 text-light py-0 px-2 px-sm-3">
                <span class="material-icons-round" style="line-height: 1.25">keyboard_arrow_left</span>
            </button>
            <span class="p-3 text-light no-wrap"><span runat="server" id="NumPageSm"></span>/ <span runat="server" id="NumDocPagesSm"></span></span>
            <button id="NextPageSm" runat="server" type="button" class="btn btn-outline-primary border-0 text-light py-0 px-2 px-sm-3">
                <span class="material-icons-round" style="line-height: 1.25">keyboard_arrow_right</span>
            </button>
        </div>
    </div>
</asp:Panel>
<script>
    (() => {
        let urlField = document.getElementById("<%= Url.ClientID %>");
        let base64Field = document.getElementById("<%= Base64.ClientID %>");
        let url = urlField.value;
        let base64Data = base64Field.value;
        let titleField = document.getElementById("<%= Name.ClientID %>");
        let docTitle = document.getElementById("<%= DocTitle.ClientID %>");

        let prevPageBtn = document.getElementById("<%= PrevPage.ClientID %>");
        let nextPageBtn = document.getElementById("<%= NextPage.ClientID %>");
        let prevPageBtnSm = document.getElementById("<%= PrevPageSm.ClientID %>");
        let nextPageBtnSm = document.getElementById("<%= NextPageSm.ClientID %>");
        let aspRatioBtn = document.getElementById("<%= AspectRatio.ClientID %>");
        let aspRatioBtnSm = document.getElementById("<%= AspectRatioSm.ClientID %>");

        let loader = document.getElementById("<%= Loader.ClientID%>");

        let pdfDoc = null;
        let pageNum = 1;
        let pageIsRendering = false;
        let pageNumIsPending = null;
        let pdfScale = 1;

        const canvas = document.getElementById("<%= Viewport.ClientID %>");
        const errorElem = document.getElementById("<%= ErrorMsg.ClientID %>");
        const ctx = canvas.getContext("2d");

        const renderPage = num => {
            pageIsRendering = true;
            loader.style.display = "block";
            pdfDoc.getPage(num).then(page => {
                var scale = pdfScale; // render with global pdfScale variable
                const viewport = page.getViewport({ scale });
                canvas.style.display = "block";
                canvas.height = viewport.height;
                canvas.width = viewport.width;

                const renderCtx = {
                    canvasContext: ctx,
                    viewport
                };
                page.render(renderCtx).promise.then(() => {
                    pageIsRendering = false;
                    loader.style.display = "none";
                    if (pageNumIsPending != null) {
                        renderPage(pageNumIsPending);
                        pageNumIsPending = null;
                    }
                }).catch((err) => {
                    pageIsRendering = false;
                    loader.style.display = "none";
                    docTitle.innerText = "MDoc PDF Reader Page Error";
                    docTitle.setAttribute("data-mdb-original-title", "MDoc PDF Reader Page Error");
                    const errorEl = `
                        <div class="note note-danger lead" style="word-break: break-word">
                            Error occured trying to display page ${num}!
                        </div>
                        `;
                    errorElem.style.display = "block";
                    errorElem.innerHTML = errorEl;
                });

                document.getElementById("<%= NumPage.ClientID %>").innerText = pageNum;
                document.getElementById("<%= NumPageSm.ClientID %>").innerText = pageNum;
            });

        };

        const queredPages = num => {
            if (pageIsRendering) {
                pageNumIsPending = num;
            } else {
                renderPage(num);
            }
        };

        // func runs when prev btn clicked
        const prevPage = () => {
            if (pageNum <= 1) {
                return;
            }
            pageNum--;
            queredPages(pageNum);
        };
        // func runs when nxt btn clicked
        const nextPage = () => {
            if (pageNum >= pdfDoc.numPages) {
                return;
            }
            pageNum++;
            queredPages(pageNum);
        };

        const aspRatio = () => {
            if (pageIsRendering) {
                return;
            }
            if (pdfScale < 1) {
                pdfScale = pdfScale + 0.25;
                renderPage(pageNum);
            } else {
                pdfScale = 0.25;
                renderPage(pageNum);
            }
        };

        let tries = 2;

        let getDoc = (docData) => pdfjsLib.getDocument(docData ? docData : "/Content/Static/PlaceholderFile.pdf").promise.then(mdoc => {
            pdfDoc = mdoc;
            document.getElementById("<%= NumDocPages.ClientID %>").innerText = pdfDoc.numPages;
            document.getElementById("<%= NumDocPagesSm.ClientID %>").innerText = pdfDoc.numPages;
            docTitle.innerText = titleField.value;
            docTitle.setAttribute("data-mdb-original-title", titleField.value);
            pageNum = 1;
            renderPage(pageNum);
            if (docData) {
                errorElem.style.display = "none";
            }
        }).catch(err => {
            loader.style.display = "none";
            docTitle.innerText = "MDoc PDF Reader Error";
            docTitle.setAttribute("data-mdb-original-title", "MDoc PDF Reader Error");
            let errorEl = `
            <div class="note note-danger lead" style="word-break: break-word">
                ${err.message}
            </div>
            `;
            if (docData && tries >= 0) {
                getDoc();
                tries--;
            } else {
                canvas.style.display = "none";
            }
            errorElem.style.display = "block";
            errorElem.innerHTML = errorEl;

        });
        console.log(base64Data);
        getDoc(base64Data ? { data: base64Data } : url);

        prevPageBtn.addEventListener('click', prevPage);
        nextPageBtn.addEventListener('click', nextPage);
        prevPageBtnSm.addEventListener('click', prevPage);
        nextPageBtnSm.addEventListener('click', nextPage);
        aspRatioBtn.addEventListener('click', aspRatio);
        aspRatioBtnSm.addEventListener('click', aspRatio);

        // change pdf dynamically
        base64Field.addEventListener("change", (e) => {
            getDoc(e.target.value);
        });
        urlField.addEventListener("change", (e) => {
            getDoc(e.target.value);
        });
    })()
</script>
