<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Lead_is_referred_out</fullName>
        <description>Lead is referred out</description>
        <protected>false</protected>
        <recipients>
            <recipient>infiniterecovery@mirketa.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Lead_Refer_out_email2</template>
    </alerts>
    <fieldUpdates>
        <fullName>CHNAGE_RECORD_TYPE</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Lead_Created_on_new</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>CHNAGE RECORD TYPE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Lead detail page appear</fullName>
        <actions>
            <name>CHNAGE_RECORD_TYPE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>patient page changes to detail page</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>lead refer out send email</fullName>
        <actions>
            <name>Lead_is_referred_out</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Referred Out</value>
        </criteriaItems>
        <description>lead refer out send email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
