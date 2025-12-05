## **Student Question – UI Specification**

### **1. Purpose**

This screen allows students to view a question, submit an answer, and review any hints or instructions in a clear and distraction-free layout. And it should be responsive so that can be accessed from Mobile.

------

### **2. Layout Structure**

- **Header**

  - Title: *“Question”*
  - Back button on the left (icon: arrow-left)

- **Main Content Area**

  - **Question Title** – Bold, medium size
  - **Question Description** – Paragraph text
  - **Attached Media (Optional)**
    - Image, audio, or PDF preview
  - **Hints/Instructions (Optional)**
    - Collapsible section (`Show Hint` → expands)

- **Answer Input Section**

  - Textarea / MCQ / File upload (depending on question type)
  - Character limit indicator (for text)
  - For MCQ: show radio buttons
  - For file upload: show upload button + file preview

- **Footer**

  - **Submit Answer Button** (primary)
  - **Save Draft Button** (secondary)

  ### **3. UX Behaviour**

  - Autosave every 10 seconds for text answers
  - Validation on submit:
    - Required fields highlighted
    - Error message shown inline
  - Auto-scroll to first validation error

  ------

  ### **4. Visual Style**

  - Primary color: `#2563EB`
  - Secondary color: `#64748B`
  - Background: `#F9FAFB`
  - Card background: white, corner radius 12px
  - Button radius: 8px
  - Font: Inter / system default

------

### 