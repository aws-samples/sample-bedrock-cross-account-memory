# Quick Start Guide

## 1. Clone and Setup
```bash
git clone <repository-url>
cd cross-account-agentcore-memory
pip install -r requirements.txt
```

## 2. Configure Credentials
```bash
python3 setup.py
```
Follow the interactive prompts to configure credentials for both AWS accounts.

## 3. Deploy Infrastructure
```bash
chmod +x *.sh
./setup-cross-account.sh
```

## 4. Create Agents
```bash
./create-agents.sh
```

## 5. Run Demo
```bash
python3 demo-cross-account.py
```

## Expected Output
```
🚀 Cross-Account Memory Demo
========================================

📝 Test 1: Initial request
👤 User: I need help analyzing our Q4 sales performance
🤖 Supervisor: DELEGATE: Analyze Q4 sales data and identify key trends
🔄 Calling worker agent...
🔧 Worker: Based on the conversation history, here's the Q4 analysis...

📝 Test 2: Follow-up with memory
👤 User: How does this compare to Q3?
🔧 Worker: Comparing to the Q4 analysis I provided earlier, Q3 showed...

✅ Demo Complete! Memory entries: 6
```

## Troubleshooting
- **Expired tokens**: Re-run `python3 setup.py` to refresh credentials
- **Permission errors**: Check IAM roles in both accounts
- **Agent not found**: Wait 2-3 minutes after creation for agents to be ready