/*
result.data = {
form: `<body onload='document.forms["form"].submit()'>
<form name="form" action=${config.ati_url_redirect} method="POST">
<input type="hidden" value="${token}" name="token" />
</form>
</body>`
};


externalRefrenceByHTML: (htmlData = <></>) => {
const div = document.createElement('div')
div.innerHTML = htmlData
document.body.appendChild(div)
div.firstElementChild.submit()
}

externalRefrenceByHTML: (htmlData = <></>) => {
const div = document.createElement('div')
div.innerHTML = <body onload='document.forms["form"].submit()'>
<form name="form" action=${config.ati_url_redirect} method="POST">
<input type="hidden" value="${token}" name="token" />
</form>
</body>
document.body.appendChild(div)
div.firstElementChild.submit()
}

*/

<body onload='document.forms[\"form\"].submit()'>\n                              <form name=\"form\" action=https://mipg.atipay.net/v1/redirect-to-gateway method=\"POST\">\n                                <input type=\"hidden\" value=\"b7419b94f06e406089b1403bf4b8eb1b\" name=\"token\" />\n                              </form>\n                           </body>