from flask import Flask, request
import subprocess

app = Flask(__name__)

@app.route('/run-command', methods=['POST'])
def run_command():
    try:
        # Run the command
        result = subprocess.run(['bash', 'sync.sh'], capture_output=True, text=True)

        return {
            'status': 'success',
            'output': result.stdout.strip()
        }, 200
    except Exception as e:
        return {
            'status': 'error',
            'message': str(e)
        }, 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5005)
