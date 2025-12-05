#!/usr/bin/env python3
"""
Test script for Cross-Account Bedrock Agent Memory Sharing
"""

import boto3
import json
import sys


def test_cross_account_memory():
    """Test the deployed cross-account solution"""

    lambda_client = boto3.client("lambda", region_name="us-west-2")

    test_cases = [
        "Tell me how to learn Python",
        "Help me plan a birthday party",
        "What's the best way to start a business?",
        "How do I improve my public speaking skills?",
    ]

    print("🧪 Testing Cross-Account Bedrock Agent Memory Sharing")
    print("=" * 60)

    for i, test_input in enumerate(test_cases, 1):
        print(f"\n🔍 Test {i}: {test_input}")
        print("-" * 40)

        try:
            response = lambda_client.invoke(
                FunctionName="cross-account-bedrock-supervisor-CrossAccountOrchestrator",
                Payload=json.dumps({"user_input": test_input}),
            )

            result = json.loads(response["Payload"].read())

            if result["statusCode"] == 200:
                body = json.loads(result["body"])
                print(f"✅ Success - Delegation: {body['delegation']}")
                print(f"📝 Supervisor: {body['supervisor_response'][:100]}...")
                print(f"🔧 Worker: {body['worker_response'][:100]}...")
            else:
                body = json.loads(result["body"])
                print(f"❌ Error: {body.get('error', 'Unknown error')}")

        except Exception as e:
            print(f"❌ Exception: {e}")

    print(f"\n🎉 Testing complete!")


if __name__ == "__main__":
    test_cross_account_memory()
