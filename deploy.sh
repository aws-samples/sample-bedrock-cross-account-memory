#!/bin/bash

# Cross-Account Bedrock Agent Memory Sharing Deployment Script

set -e

echo "🚀 Cross-Account Bedrock Agent Memory Sharing Deployment"
echo "======================================================="

# Check required parameters
if [ $# -ne 3 ]; then
    echo "Usage: $0 <supervisor-agent-id> <worker-agent-id> <worker-account-id>"
    echo "Example: $0 <your-supervisor-agent-id> <your-worker-agent-id> <your-worker-account-id>"
    exit 1
fi

SUPERVISOR_AGENT_ID=$1
WORKER_AGENT_ID=$2
WORKER_ACCOUNT_ID=$3

echo "📋 Configuration:"
echo "  Supervisor Agent ID: $SUPERVISOR_AGENT_ID"
echo "  Worker Agent ID: $WORKER_AGENT_ID"
echo "  Worker Account ID: $WORKER_ACCOUNT_ID"
echo ""

# Deploy supervisor account stack
echo "🔧 Deploying supervisor account infrastructure..."
aws cloudformation deploy \
    --template-file production-template.yaml \
    --stack-name cross-account-bedrock-supervisor \
    --parameter-overrides \
        SupervisorAgentId=$SUPERVISOR_AGENT_ID \
        WorkerAgentId=$WORKER_AGENT_ID \
        WorkerAccountId=$WORKER_ACCOUNT_ID \
    --capabilities CAPABILITY_IAM \
    --region us-west-2

echo "✅ Supervisor account deployment complete!"
echo ""
echo "📝 Next Steps:"
echo "1. Deploy worker account role using worker-account-setup.yaml"
echo "2. Test the Lambda function with sample payload"
echo ""
echo "🧪 Test Payload:"
echo '{"user_input": "Tell me how to learn Python"}'