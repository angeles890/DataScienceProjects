﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewEngines;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace jQueryAjaxCRUDinASPNET
{
    public class Helper
    {

        public static string RenderRazerViewToString(Controller controller, string viewName, object model = null) 
        {
            controller.ViewData.Model = model;
            using (var sw = new StringWriter())
            {
                IViewEngine viewEngine = controller.HttpContext.RequestServices.GetService(typeof(ICompositeViewEngine)) as ICompositeViewEngine;
                ViewEngineResult viewResult = viewEngine.FindView(controller.ControllerContext, viewName, false);

                ViewContext viewContext = new ViewContext(
                    controller.ControllerContext, 
                    viewResult.View, 
                    controller.ViewData, 
                    controller.TempData, 
                    sw, 
                    new Microsoft.AspNetCore.Mvc.ViewFeatures.HtmlHelperOptions()
                );

                viewResult.View.RenderAsync(viewContext);
                return sw.GetStringBuilder().ToString();
            }
        }

        //Custom Attribute to prevent direct access to a view
        [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
        public class NoDirectAccessAttribute : ActionFilterAttribute 
        {
            public override void OnActionExecuting(ActionExecutingContext filterContext)
            {

               if(filterContext.HttpContext.Request.GetTypedHeaders().Referer == null || filterContext.HttpContext.Request.GetTypedHeaders().Host.ToString() != filterContext.HttpContext.Request.GetTypedHeaders().Referer.Host.ToString())
               {
                    filterContext.HttpContext.Response.Redirect("/"); 
               }
            }
        }
    }
}
