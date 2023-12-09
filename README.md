# Setting a Schedule for Script Updates

This guide will walk you through the process of setting up a schedule to run a script at 12:00 AM (midnight) and 12:00 PM (noon) on a Windows computer using Task Scheduler. This schedule will ensure that your script runs automatically at these specified times.

## Prerequisites

Before you begin, make sure you have the following:

- The PowerShell script that you want to schedule.
- Administrative privileges on your Windows computer.

## Instructions

1. **Open Task Scheduler:**

   - Press `Win + R` to open the Run dialog.
   - Type `taskschd.msc` and press Enter. This will open Windows Task Scheduler.

2. **Create a Basic Task:**

   - In the right-hand pane of Task Scheduler, click on "Create Basic Task..."

3. **Name and Describe the Task:**

   - Provide a name and, optionally, a description for your task. Click "Next."

4. **Choose a Trigger:**

   - Select "Daily" as the trigger and click "Next."

5. **Set the Trigger Details:**

   - Choose the start date for your schedule.
   - Set the start time to 12:00 AM (midnight).
   - Select "Recur every" and set it to "1 days."
   - Click "Next."

6. **Action: Start a Program:**

   - Choose "Start a Program" as the action type and click "Next."

7. **Program/Script and Add Arguments:**

   - In the "Program/script" field, browse and select the PowerShell executable. Typically located at `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe`.
   - In the "Add arguments (optional)" field, provide the full path to your PowerShell script, enclosed in double quotes. For example: `"C:\Path\To\YourScript.ps1"`.
   - Click "Next."

8. **Review the Task Summary:**

   - Review the task summary to ensure it matches your settings.
   - Click "Finish" to create the task.

9. **Create a Second Task for 12:00 PM:**

   - Repeat the above steps, but this time set the start time to 12:00 PM (noon) for your second task. Ensure you provide a unique name for this task.

10. **Verify Your Scheduled Tasks:**

    - In Task Scheduler, you should now see two scheduled tasks—one for 12:00 AM and one for 12:00 PM.

11. **Done:**

    - Your script will now run automatically at 12:00 AM and 12:00 PM based on your schedule.

## Conclusion

You have successfully set up a schedule to run your PowerShell script at 12:00 AM and 12:00 PM on your Windows computer using Task Scheduler. This will help you automate your script updates and tasks.
