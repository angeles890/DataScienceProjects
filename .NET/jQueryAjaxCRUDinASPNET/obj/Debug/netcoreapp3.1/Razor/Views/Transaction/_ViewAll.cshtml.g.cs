#pragma checksum "C:\Users\aange\Desktop\.NetCode\jQueryAjaxCRUDinASPNET\Views\Transaction\_ViewAll.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "0ba607f8476cd705ab21f9afce6447629eaa3f87"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Transaction__ViewAll), @"mvc.1.0.view", @"/Views/Transaction/_ViewAll.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\aange\Desktop\.NetCode\jQueryAjaxCRUDinASPNET\Views\_ViewImports.cshtml"
using jQueryAjaxCRUDinASPNET;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\aange\Desktop\.NetCode\jQueryAjaxCRUDinASPNET\Views\_ViewImports.cshtml"
using jQueryAjaxCRUDinASPNET.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"0ba607f8476cd705ab21f9afce6447629eaa3f87", @"/Views/Transaction/_ViewAll.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"e13c8167ac6d2e678a31d489fc045070bba9ab22", @"/Views/_ViewImports.cshtml")]
    public class Views_Transaction__ViewAll : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<IEnumerable<jQueryAjaxCRUDinASPNET.Models.TransactionModel>>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("d-inline"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "Delete", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("onsubmit", new global::Microsoft.AspNetCore.Html.HtmlString("return jQueryAjaxDelete(this);"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\r\n<table class=\"table\">\r\n    <thead>\r\n        <tr>\r\n            <th>\r\n                ");
#nullable restore
#line 7 "C:\Users\aange\Desktop\.NetCode\jQueryAjaxCRUDinASPNET\Views\Transaction\_ViewAll.cshtml"
           Write(Html.DisplayNameFor(model => model.AcountNumber));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            <th>\r\n                ");
#nullable restore
#line 10 "C:\Users\aange\Desktop\.NetCode\jQueryAjaxCRUDinASPNET\Views\Transaction\_ViewAll.cshtml"
           Write(Html.DisplayNameFor(model => model.BeneficiaryName));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            <th>\r\n                ");
#nullable restore
#line 13 "C:\Users\aange\Desktop\.NetCode\jQueryAjaxCRUDinASPNET\Views\Transaction\_ViewAll.cshtml"
           Write(Html.DisplayNameFor(model => model.Date));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            <th>\r\n                ");
#nullable restore
#line 16 "C:\Users\aange\Desktop\.NetCode\jQueryAjaxCRUDinASPNET\Views\Transaction\_ViewAll.cshtml"
           Write(Html.DisplayNameFor(model => model.Ammount));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            <th>\r\n                <a");
            BeginWriteAttribute("onclick", " onclick=\"", 562, "\"", 669, 4);
            WriteAttributeValue("", 572, "showInPop(\'", 572, 11, true);
#nullable restore
#line 19 "C:\Users\aange\Desktop\.NetCode\jQueryAjaxCRUDinASPNET\Views\Transaction\_ViewAll.cshtml"
WriteAttributeValue("", 583, Url.Action("AddOrEdit","Transaction",null,Context.Request.Scheme), 583, 66, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 649, "\',\'New", 649, 6, true);
            WriteAttributeValue(" ", 655, "Transaction\')", 656, 14, true);
            EndWriteAttribute();
            WriteLiteral(" class=\"btn btn-success text-white\"><i class=\"fas fa-random\"></i>New Transaction</a>\r\n            </th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n");
#nullable restore
#line 24 "C:\Users\aange\Desktop\.NetCode\jQueryAjaxCRUDinASPNET\Views\Transaction\_ViewAll.cshtml"
         foreach (var item in Model)
        {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <tr>\r\n                <td>\r\n                    ");
#nullable restore
#line 28 "C:\Users\aange\Desktop\.NetCode\jQueryAjaxCRUDinASPNET\Views\Transaction\_ViewAll.cshtml"
               Write(Html.DisplayFor(modelItem => item.AcountNumber));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                </td>\r\n                <td>\r\n                    ");
#nullable restore
#line 31 "C:\Users\aange\Desktop\.NetCode\jQueryAjaxCRUDinASPNET\Views\Transaction\_ViewAll.cshtml"
               Write(Html.DisplayFor(modelItem => item.BeneficiaryName));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                </td>\r\n                <td>\r\n                    ");
#nullable restore
#line 34 "C:\Users\aange\Desktop\.NetCode\jQueryAjaxCRUDinASPNET\Views\Transaction\_ViewAll.cshtml"
               Write(Html.DisplayFor(modelItem => item.Date));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                </td>\r\n                <td>\r\n                    ");
#nullable restore
#line 37 "C:\Users\aange\Desktop\.NetCode\jQueryAjaxCRUDinASPNET\Views\Transaction\_ViewAll.cshtml"
               Write(Html.DisplayFor(modelItem => item.Ammount));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                </td>\r\n                <td>\r\n                    <a");
            BeginWriteAttribute("onclick", " onclick=\"", 1378, "\"", 1515, 4);
            WriteAttributeValue("", 1388, "showInPop(\'", 1388, 11, true);
#nullable restore
#line 40 "C:\Users\aange\Desktop\.NetCode\jQueryAjaxCRUDinASPNET\Views\Transaction\_ViewAll.cshtml"
WriteAttributeValue("", 1399, Url.Action("AddOrEdit","Transaction",new { id = item.TransactionID} ,Context.Request.Scheme), 1399, 93, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 1492, "\',\'Update", 1492, 9, true);
            WriteAttributeValue(" ", 1501, "Transaction\')", 1502, 14, true);
            EndWriteAttribute();
            WriteLiteral(" class=\"btn btn-info text-white\"><i class=\"fas fa-pencil-alt\"></i>Edit</a>\r\n\r\n                    ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("form", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "0ba607f8476cd705ab21f9afce6447629eaa3f879064", async() => {
                WriteLiteral("\r\n                        <input type=\"submit\" value=\"Delete\" class=\"btn btn-danger\" />\r\n                    ");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper.Action = (string)__tagHelperAttribute_1.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_1);
            if (__Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper.RouteValues == null)
            {
                throw new InvalidOperationException(InvalidTagHelperIndexerAssignment("asp-route-id", "Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper", "RouteValues"));
            }
            BeginWriteTagHelperAttribute();
#nullable restore
#line 42 "C:\Users\aange\Desktop\.NetCode\jQueryAjaxCRUDinASPNET\Views\Transaction\_ViewAll.cshtml"
                                                                 WriteLiteral(item.TransactionID);

#line default
#line hidden
#nullable disable
            __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper.RouteValues["id"] = __tagHelperStringValueBuffer;
            __tagHelperExecutionContext.AddTagHelperAttribute("asp-route-id", __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper.RouteValues["id"], global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n                </td>\r\n            </tr>\r\n");
#nullable restore
#line 47 "C:\Users\aange\Desktop\.NetCode\jQueryAjaxCRUDinASPNET\Views\Transaction\_ViewAll.cshtml"
        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </tbody>\r\n</table>\r\n");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<IEnumerable<jQueryAjaxCRUDinASPNET.Models.TransactionModel>> Html { get; private set; }
    }
}
#pragma warning restore 1591