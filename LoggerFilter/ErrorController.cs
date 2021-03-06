using Pulzonic.Multipartial;
using System.Web.Mvc;
using VAPARS.Models.BusinessLayers;

namespace VAPARS.Controllers
{
    [RequireHttps]
    [ValidRequestException]
    public class ErrorController : Controller
    {
        // GET: Error
        public ActionResult Error()
        {
            return View("Error500", "~/Views/Shared/_ErrorLayout.cshtml");
        }

        public ActionResult InvalidCPAC()
        {
            return View("InvalidCPAC", "~/Views/Shared/_ErrorLayout.cshtml");
        }

        public ActionResult Error500()
        {
            return View("Error500", "~/Views/Shared/_ErrorLayout.cshtml");
        }

        [AjaxOnly]
        public ActionResult AjaxError()
        {
            var model = new AjaxErrorResults { AjaxError = Models.BusinessLayers.AjaxError.Default };
            var res = new MultipartialResult(this);
            res.AddView("_AjaxRequestError", "ajaxRequestInjectionError", model);
            return res;
        }

        [AjaxOnly]
        public ActionResult FailedMessage(string message)
        {
            var model = new AjaxErrorResults
            {
                AjaxError = Models.BusinessLayers.AjaxError.Failed,
                Message = message
            };
            var res = new MultipartialResult(this);
            res.AddView("_FailedRequest", "ajaxRequestInjectionError", model);
            return res;
        }

        public ActionResult Unauthorized()
        {
            // throw new Exception();
            return View("Unauthorized", "~/Views/Shared/_ErrorLayout.cshtml");
        }

        public ActionResult AccessDenied()
        {
            return View("ErrorPermission", "~/Views/Shared/_ErrorLayout.cshtml");
        }

        [AjaxOnly]
        public ActionResult AjaxErrorAccessDenied()
        {
            var model = new AjaxErrorResults { AjaxError = Models.BusinessLayers.AjaxError.AccessDenied };
            var res = new MultipartialResult(this);
            res.AddView("_AjaxRequestError", "ajaxRequestInjectionError", model);
            return res;
        }
    }
}
© 2021 GitHub, Inc.
