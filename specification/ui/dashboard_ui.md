## **Dashboard – UI Specification**

### **1. Purpose**

The dashboard provides administrators a quick overview of recent activity, number of questions, student submissions, and system analytics.

------

### **2. Layout Structure**

- **Header**

  - Title: *“Dashboard”*

- **Top Metrics Row**
   Four metric cards:

  - Total Questions
  - Pending Reviews
  - Active Students
  - Submissions Today

  Card style:

  - Large number
  - Small label
  - Icon on right (optional)

- **Charts Section**

  - **Submissions Over Time** (line/bar chart)
  - **Question Types Distribution** (pie/donut chart)

- **Recent Activity Table**
   Columns:

  - Student Name
  - Question
  - Submitted At
  - Status
  - Action (View)

- **Right Sidebar (Optional)**

  - Announcements
  - Quick links
  - Recent questions

------

### **3. UX Behaviour**

- Charts load with animation
- Table sortable by date and name
- Pagination for activity table
- Clicking a metric card filters the activity list
- Responsive layout:
  - Cards → full width on mobile
  - Charts stack vertically

------

### **4. Visual Style**

- Primary color: `#2563EB`
- Background: `#F1F5F9`
- Cards: white, rounded corners (16px), soft shadow
- Icons: outline style
- Spacing: 24px between sections
- Font: Inter