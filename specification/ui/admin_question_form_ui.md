## **Admin – Question Form UI Specification**

### **1. Purpose**

This form enables admins/teachers to create or edit questions for students with fields for content, metadata, attachments, and answer type.

------

### **2. Layout Structure**

- **Header**
  - Title: *“Create Question”* or *“Edit Question”*
  - Cancel button on the left (icon: x)
- **Form Sections**
  1. **Basic Information**
     - Question Title (text input)
     - Description (rich-text editor)
  2. **Question Type**
     - Dropdown
        Options: MCQ, Short Answer, Long Answer, File Upload
  3. **Answer Options (If MCQ)**
     - Dynamic option list
     - Add/remove option button
     - Checkbox to mark correct answer(s)
  4. **Media Attachments**
     - Upload image, audio, PDF
     - Preview thumbnails
     - Remove icon
  5. **Hints (Optional)**
     - Textarea
     - Toggle to enable/disable hint
  6. **Metadata**
     - Difficulty: Easy / Medium / Hard
     - Subject dropdown
     - Topic dropdown
     - Tags (chip input)
- **Footer**
  - **Save Button (primary)**
  - **Preview Button (secondary)**

------

### **3. UX Behaviour**

- Auto-expand MCQ choices dynamically
- Real-time field validation
- Image/PDF preview on upload
- Disable “Save” until all required fields are filled
- Preview opens a modal with student view layout

------

### **4. Visual Style**

- Form fields in vertical stack with 16px spacing
- Section headers bold, 16px
- Card-like sections with soft shadow
- Buttons: primary blue (`#2563EB`), secondary grey