using Microsoft.SharePoint.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomerDetailsWeb.Pages
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TokenHelper.TrustAllCertificates();
            var contextToken = TokenHelper.GetContextTokenFromRequest(Page.Request);
            var hostWeb = Page.Request["SPHostUrl"];
            using (var clientContext = TokenHelper.GetClientContextWithContextToken(hostWeb, contextToken, Request.Url.Authority))
            {
                List customersList = clientContext.Web.Lists.GetByTitle("Customers");
                CamlQuery query = new CamlQuery();
                Microsoft.SharePoint.Client.ListItemCollection items = customersList.GetItems(query);
                clientContext.Load(items);
                clientContext.ExecuteQuery();
                DataTable customerDataTable = new DataTable();
                customerDataTable.Columns.Add("CustomerID");
                customerDataTable.Columns.Add("CustomerName");
                customerDataTable.Columns.Add("City");
                customerDataTable.Columns.Add("Country");
                customerDataTable.Columns.Add("Photo");
                foreach (Microsoft.SharePoint.Client.ListItem item in items)
                {
                    DataRow newRow = customerDataTable.NewRow();
                    newRow[0] = item.FieldValues["Title"].ToString();
                    newRow[1] = item.FieldValues["CustomerName"].ToString();
                    newRow[2] = item.FieldValues["City"].ToString();
                    newRow[3] = item.FieldValues["Country"].ToString();
                    newRow[4] = ((Microsoft.SharePoint.Client.FieldUrlValue)(item["Photo"])).Url.ToString();
                    customerDataTable.Rows.Add(newRow);
                }
                DataList1.DataSource = customerDataTable;
                DataList1.DataBind();
            }
        }
    }
}