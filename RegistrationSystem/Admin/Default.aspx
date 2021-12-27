<%@ Page Title="Home" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RegistrationSystem.Admin.Default" %>

<asp:Content ContentPlaceHolderID="ExtraStyles" runat="server">
    <style>
        .home {
            background: var(--mdb-secondary);
            /*color: var(--mdb-secondary);*/
            color: #ffffff;
            border-bottom: 2px solid var(--mdb-secondary)
        }
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-6 col-md-4">
            <div class="card bg-light text-dark">
                <div class="card-body">
                    <div class="d-flex justify-content-between">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-info md-64">groups</span>
                        </div>
                        <div class="text-end">
                            <h3 id="TotalStudents" runat="server">0</h3>
                            <p class="mb-0 no-text-wrap">Total students</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="card bg-success text-light">
                <div class="card-body">
                    <div class="d-flex justify-content-between">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-white md-64">verified_user</span>
                        </div>
                        <div class="text-end">
                            <h3 id="TotalApproved" runat="server">0</h3>
                            <p class="mb-0 no-text-wrap">Approved Students</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="card bg-danger">
                <div class="card-body">
                    <div class="d-flex justify-content-between px-md-1">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-white md-64">gpp_maybe</span>
                        </div>
                        <div class="text-end">
                            <h3 class=" text-white" id="TotalUnapproved" runat="server">0</h3>
                            <p class="mb-0 text-white no-text-wrap">Unapproved students</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mt-3">
        <div class="row g-3">
            <div class="col-sm-12 col-md-5">
                <div class="card h-100">
                    <div class="card-header">
                        <h1 class="lead">Student Payments</h1>
                    </div>
                    <div class="card-body">
                        <canvas id="payments" width="70" height="30"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-7">
                <div class="card h-100">
                    <div class="card-header">
                        <h1 class="lead">Payment plans popularity</h1>
                    </div>
                    <div class="card-body">
                        <canvas id="plans" width="70" height="40"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h1 class="lead">Registered Subjects</h1>
                    </div>
                    <div class="card-body">
                        <canvas id="regSubjects" width="70" height="40"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ExtraScript">
    <%: Scripts.Render("~/bundles/analytics") %>
    <script>
        (() => {
            const ts = document.getElementById("<%= TotalStudents.ClientID %>");
            const as = document.getElementById("<%= TotalApproved.ClientID %>");
            const us = document.getElementById("<%= TotalUnapproved.ClientID %>");
            const paymentsCtx = document.getElementById('payments').getContext('2d');
            const plansCtx = document.getElementById('plans').getContext('2d');
            const subCtx = document.getElementById('regSubjects').getContext('2d');
            window.axios.get("/api/analytics")
                .then(res => {
                    chartData(paymentsCtx,
                        "doughnut",
                        Object.values(res.data.APayments),
                        Object.keys(res.data.APayments),
                        "Payments",
                        ['#36a2eb', '#ff6384']);
                    chartObjData(plansCtx, "bar", res.data.Plans, "Count", "Key", "payment plans");
                    chartObjData(subCtx, "bar", res.data.Subjects, "Count", "Key", "Subject Popularity");
                });


            function chartData(target, type, data, labels, legend, colors) {
                return new window.Chart(target,
                    {
                        type: type,
                        data: {
                            labels: labels,
                            datasets: [
                                {
                                    label: legend,
                                    data: data,
                                    backgroundColor: colors ? colors : ['#36a2eb']
                                }
                            ]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    }
                );
            }


            function chartObjData(target, type, data, yAx, xAx, legend) {
                return new window.Chart(target,
                    {
                        type: type,
                        data: {
                            datasets: [
                                {
                                    data: data,
                                    label: legend,
                                    backgroundColor: getColors(data.length)
                                }
                            ]
                        },
                        options: {
                            parsing: {
                                xAxisKey: xAx,
                                yAxisKey: yAx
                            },
                            plugins: {
                                legend: {
                                    display: false
                                }
                            }
                        }
                    });
            }

            function getColors(count) {
                return new Array(count).fill(1).map(() => `#${Math.floor(Math.random() * 16777215).toString(16)}`);
            }

            function animate(obj, initVal, lastVal, duration) {

                let startTime = null;

                const step = (currentTime) => {

                    if (!startTime) {
                        startTime = currentTime;
                    }

                    const progress = Math.min((currentTime - startTime) / duration, 1);

                    obj.innerHTML = Math.floor(progress * (lastVal - initVal) + initVal);

                    if (progress < 1) {
                        window.requestAnimationFrame(step);
                    } else {
                        window.cancelAnimationFrame(window.requestAnimationFrame(step));
                    }
                };

                //start animating
                window.requestAnimationFrame(step);
            }

            window.addEventListener("load",
                () => {
                    animate(ts, 100, <%= TotalReg %>, 500);
                    animate(as, 100, <%= ApprovedReg %>, 500);
                    animate(us, 100, (<%= UnapprovedReg %>), 500);
                });
        })();
    </script>
</asp:Content>