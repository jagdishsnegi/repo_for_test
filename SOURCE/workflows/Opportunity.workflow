<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Approval_ALert</fullName>
        <description>Approval ALert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Readmission_Approved</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_is_Admitted</fullName>
        <description>Opp stage is Admitted</description>
        <protected>false</protected>
        <recipients>
            <recipient>infiniterecovery@mirketa.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Patient_is_Ready_for_Admission</template>
    </alerts>
    <alerts>
        <fullName>Rejection_Alert</fullName>
        <description>Rejection Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Readmission_Rejected</template>
    </alerts>
    <alerts>
        <fullName>refer_out_on_Opportunity</fullName>
        <description>refer out on Opportunity</description>
        <protected>false</protected>
        <recipients>
            <recipient>infiniterecovery@mirketa.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Has_been_Referred_Out</template>
    </alerts>
    <rules>
        <fullName>Opp stage is admitted</fullName>
        <actions>
            <name>Opp_stage_is_Admitted</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Pending Admission</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
