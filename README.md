# fietas_mobprog

A new Flutter project.
GitHub Repository Link: https://github.com/dwighttech/fietas_mobprog.git

1. What challenges did you encounter while installing or configuring Flutter?
Setting up Flutter took more steps than I expected because so many separate tools have to connect properly before you can even run a simple app. At first, I had my Flutter SDK folder sitting inside my Downloads folder, which caused path warnings and felt very disorganized. Installing the extra Android SDK tools and the C++ desktop workload in Visual Studio also took a lot of patience and disk space. Honestly, getting the environment ready felt harder than creating the actual starter project.

2. Did you encounter any errors when running flutter doctor?
Yes, running flutter doctor showed several warnings and errors on my first check. It flagged that the Flutter and Dart binaries were not in my system PATH because the SDK was still in my Downloads folder. It also showed missing Android command line tools, unaccepted Android licenses, and a missing C++ desktop workload for Visual Studio. Seeing those red X marks at first was a little frustrating, though the diagnostic messages were clear about what was missing.

3. How did you resolve installation, dependency, SDK, or device-related issues?
I fixed the issues one by one by following the exact suggestions from flutter doctor. First, I moved the Flutter folder directly to my C drive, removed the old Downloads path, and added the new C:\flutter\bin path to my Windows Environment Variables. Next, I opened Android Studio to install the Android SDK Command Line Tools and ran the license acceptance command in the VS Code terminal. Finally, I modified my Visual Studio Community installation to include the C++ desktop development workload and added the provider package inside my project using the terminal.

4. What did you learn about configuring a Flutter development environment?
I learned that Flutter relies heavily on clean folder paths and properly linked system environment variables. Keeping SDK files inside temporary folders like Downloads only creates headaches later on. I also realized how helpful the flutter doctor command is because it acts like a checklist that tells you exactly which tool is broken instead of leaving you to guess why an app refuses to build.

5. What practices will you follow to make future Flutter development easier?
In the future, I will always keep my SDKs and development folders organized in clean root directories right from the start. I also plan to run flutter doctor whenever I update my tools or switch devices so I can catch missing dependencies early. Finally, I will make sure to initialize Git and update my README file as I work rather than waiting until the very end of a lab activity.