using System;
using System.Web.UI;

namespace Maheshamv3
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 1️⃣ Total Active Rooms
                int totalRooms = Convert.ToInt32(
                    Utility._GetDataTable("SELECT COUNT(ID) AS Total FROM facility WHERE Active = 1").Rows[0][0]
                );
                _LiteralTotalRooms.Text = totalRooms.ToString();

                // 2️⃣ Vacant Rooms (No Active Main Tenant)
                int vacantRooms = Convert.ToInt32(
                    Utility._GetDataTable(@"SELECT COUNT(ID) AS Vacant FROM facility WHERE NOT ID IN (SELECT facility FROM Tenant WHERE Active = 1 AND TenantType = 'Main Tenant')").Rows[0][0]
                );
                _Literalvacant.Text = vacantRooms.ToString();

                // 3️⃣ Occupied Rooms = Total - Vacant
                int occupiedRooms = totalRooms - vacantRooms;
                _Literaloccupied.Text = occupiedRooms.ToString();

                // 4️⃣ Get Previous Month and Year
                int prevMonth = DateTime.Now.AddMonths(-1).Month;
                int prevYear = DateTime.Now.AddMonths(-1).Year;

                // 5️⃣ Rent Done Count (Previous Month)
                string doneQuery = $@"SELECT COUNT(*) AS Done FROM Rent WHERE PaidAmount > 0 AND rMonthNo = {prevMonth} AND rYear = {prevYear}";
                _LiteralDone.Text = Convert.ToString(
                 Utility._GetDataTable(doneQuery).Rows[0][0]
                );

                // 6️⃣ Rent Pending Count (Previous Month)
                string pendingQuery = $@"SELECT COUNT(*) AS Pending FROM Rent WHERE ISNULL(PaidAmount, 0) = 0  AND rMonthNo = {prevMonth} AND rYear = {prevYear}";
                _LiteralPending.Text = Convert.ToString(
                 Utility._GetDataTable(pendingQuery).Rows[0][0]
                );
            }
        }
    }
}
