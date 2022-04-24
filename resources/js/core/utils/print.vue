<script>
    export default {
        print(element_id) {
            const prtHtml = document.getElementById(element_id).innerHTML;

// Get all stylesheets HTML
            let stylesHtml = '';
            for (const node of [...document.querySelectorAll('link[rel="stylesheet"], style')]) {
                stylesHtml += node.outerHTML;
            }

// Open the print window
            const WinPrint = window.open('', '', 'left=0,top=0,width=100%,height=100%,toolbar=0,scrollbars=0,status=0');

            WinPrint.document.write(`
<!DOCTYPE html>
<html>
  <head>
    ${stylesHtml}
  </head>
  <body>
    ${prtHtml}
  </body>
</html>`);

            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
    }
</script>