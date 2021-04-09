<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Vob_is_pending</fullName>
        <description>Vob is pending</description>
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
        <template>unfiled$public/VOB_Pending_Email</template>
    </alerts>
    <alerts>
        <fullName>vob_is_completed</fullName>
        <description>vob is completed</description>
        <protected>false</protected>
        <recipients>
            <recipient>infiniterecovery@mirketa.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/VOB_Complete_Email</template>
    </alerts>
    <alerts>
        <fullName>vob_is_requested_when_stage_is_requested</fullName>
        <description>vob is requested</description>
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
        <template>unfiled$public/VOB_Requested_Email</template>
    </alerts>
    <fieldUpdates>
        <fullName>VOB_Stage_To_VOB_Pending</fullName>
        <field>Stage__c</field>
        <literalValue>VOB Pending</literalValue>
        <name>VOB Stage To VOB Pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>vob_stage_is_vob_pending</fullName>
        <field>Stage__c</field>
        <literalValue>VOB Pending</literalValue>
        <name>vob stage is vob pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>VOB Is Requested stage</fullName>
        <actions>
            <name>VOB_Stage_To_VOB_Pending</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>VOB__c.Stage__c</field>
            <operation>equals</operation>
            <value>VOB Requested</value>
        </criteriaItems>
        <criteriaItems>
            <field>VOB__c.Assigned_To__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When VOB is in Requested stage and Assigned to field is filled</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>VOB update initiated</fullName>
        <actions>
            <name>VOB_is_ready_to_be_update1</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>VOB__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>VOB_is_ready_to_be_update</fullName>
        <assignedToType>owner</assignedToType>
        <description>All Vob which are created over the weekends are ready to be updated.</description>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>VOB__c.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Open</status>
        <subject>VOB is ready to be update</subject>
    </tasks>
    <tasks>
        <fullName>VOB_is_ready_to_be_update1</fullName>
        <assignedToType>owner</assignedToType>
        <description>Vob is created and associated task is trigered for update vob within 7 days</description>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Open</status>
        <subject>VOB is ready to be update</subject>
    </tasks>
</Workflow>
