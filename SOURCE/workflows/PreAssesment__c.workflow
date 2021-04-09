<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>PreAssesment_is_completed</fullName>
        <description>PreAssesment is completed</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/PreAssesment_Completed_Email</template>
    </alerts>
    <alerts>
        <fullName>approval_email</fullName>
        <description>approval email</description>
        <protected>false</protected>
        <recipients>
            <recipient>infiniterecovery@mirketa.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sfdc@infiniterecovery.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/pre_assesment_approval_request</template>
    </alerts>
    <alerts>
        <fullName>approval_for_stage_change</fullName>
        <description>approval email</description>
        <protected>false</protected>
        <recipients>
            <recipient>infiniterecovery@mirketa.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sfdc@infiniterecovery.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/pre_assesment_approval_request</template>
    </alerts>
    <alerts>
        <fullName>approver_rejected_the_request</fullName>
        <description>approver rejected the request</description>
        <protected>false</protected>
        <recipients>
            <recipient>infiniterecovery@mirketa.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/approval_rejected_of_pre_assesment</template>
    </alerts>
    <fieldUpdates>
        <fullName>denied_assesment_stage</fullName>
        <description>the stage is changed to approval denied</description>
        <field>Stage__c</field>
        <literalValue>Approval Denied</literalValue>
        <name>denied assesment stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_to_approved</fullName>
        <description>the stage field updates to approved</description>
        <field>Stage__c</field>
        <literalValue>Approved</literalValue>
        <name>update to approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
</Workflow>
