using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;

namespace RegistrationSystem
{
    public class BundleConfig
    {
        // For more information on Bundling, visit https://go.microsoft.com/fwlink/?LinkID=303951
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/WebFormsJs").Include(
                "~/Scripts/WebForms/WebForms.js",
                "~/Scripts/WebForms/WebUIValidation.js",
                "~/Scripts/WebForms/MenuStandards.js",
                "~/Scripts/WebForms/Focus.js",
                "~/Scripts/WebForms/GridView.js",
                "~/Scripts/WebForms/DetailsView.js",
                "~/Scripts/WebForms/TreeView.js",
                "~/Scripts/WebForms/WebParts.js"));

            // Order is very important for these files to work, they have explicit dependencies
            bundles.Add(new ScriptBundle("~/bundles/MsAjaxJs").Include(
                "~/Scripts/WebForms/MsAjax/MicrosoftAjax.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxApplicationServices.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxTimer.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxWebForms.js"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                "~/lib/mdb-ui-kit/mdb.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrapx").Include(
                "~/lib/materialize/js/materialize.min.js",
                "~/lib/materialize-stepper/dist/js/mstepper.min.js"));

            bundles.Add(new Bundle("~/bundles/files").Include(
                "~/lib/pdf.js/pdf.min.js",
                "~/lib/pdf.js/pdf.worker.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/axios").Include(
                "~/lib/axios/axios.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/analytics").Include(
                "~/lib/Chart.js/chart.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/html2pdf").Include(
                "~/lib/html2canvas/dist/html2canvas.min.js",
                "~/lib/dompurify/purify.min.js",
                "~/lib/jspdf/jspdf.umd.min.js"));

            // Use the Development version of Modernizr to develop with and learn from. Then, when you’re
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                "~/Scripts/modernizr-*"));
        }
    }
}