#!/bin/bash
# run this script with source or . when terraform runs in local
# no need to run this script if terraform runs in Azure Pipelines
# ARM_CLIENT_SECRET (service principal password) cannot be retrieved after creation but can be reset, see https://stackoverflow.com/a/62971780/4458566

echo "Setting environment variables for Terraform"
export ARM_SUBSCRIPTION_ID="5071732c-4dd9-4ada-98a7-4e6599fde956"
export ARM_CLIENT_ID="bf554695-f684-4571-8cbc-125f154c7e8e"
export ARM_CLIENT_SECRET="ObpjgFWs.rbWQ2GQ8t2oIMDcddxDG7HyyV"
export ARM_TENANT_ID="eb326955-4b8b-416f-a799-6a22255997c6"
export ARM_ACCESS_KEY="PHjjMYGNHfh5bAUgCEjrJmeYuvefxZXcy7Ocn550sgQJgzddC3NgxHKpI+VtqriitTmgNwUET4RM+ASt6Z4wyA=="  # see https://docs.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage
echo "Done"