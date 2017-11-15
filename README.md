# SFDX App

> Minimal working example for demonstrating different character escaping on converting mdapi and source format

[![Build Status](https://travis-ci.org/amtrack/mwe-character-escaping-between-mdapi-and-source.svg?branch=master)](https://travis-ci.org/amtrack/mwe-character-escaping-between-mdapi-and-source)

## Issues

  - MDAPI escapes always escapes special characters
  - source format only escapes characters in certain xml elements
  - package.xml is indented and ordered differently

```diff
diff --git a/src/objects/Opportunity.object b/src/objects/Opportunity.object
index 4be46f5..815cede 100644
--- a/src/objects/Opportunity.object
+++ b/src/objects/Opportunity.object
@@ -3,9 +3,9 @@
     <validationRules>
         <fullName>Amount_too_small</fullName>
         <active>true</active>
-        <description>Description with some semi quotes &apos;Hi&apos;</description>
+        <description>Description with some semi quotes 'Hi'</description>
         <errorConditionFormula>Amount &lt; 100</errorConditionFormula>
         <errorDisplayField>Amount</errorDisplayField>
-        <errorMessage>Amount &apos;too small&apos;</errorMessage>
+        <errorMessage>Amount 'too small'</errorMessage>
     </validationRules>
 </CustomObject>
diff --git a/src/package.xml b/src/package.xml
index 7ea2b2b..3f4e98a 100644
--- a/src/package.xml
+++ b/src/package.xml
@@ -1,8 +1,12 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <Package xmlns="http://soap.sforce.com/2006/04/metadata">
-    <types>
-        <members>Opportunity.Amount_too_small</members>
-        <name>ValidationRule</name>
-    </types>
-    <version>41.0</version>
-</Package>
+  <types>
+    <name>CustomObject</name>
+    <members>Opportunity</members>
+  </types>
+  <types>
+    <name>ValidationRule</name>
+    <members>Opportunity.Amount_too_small</members>
+  </types>
+  <version>41.0</version>
+</Package>
\ No newline at end of file
```
