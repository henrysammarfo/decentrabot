from fedml.serving import FedMLPredictor

class ExecutorBot(FedMLPredictor):
    def __init__(self):
        super().__init__()

    def predict(self, request: dict) -> dict:
        return {"summary": "Not implemented."}

if __name__ == "__main__":
    from fedml.serving import FedMLInferenceRunner
    agent = ExecutorBot()
    runner = FedMLInferenceRunner(agent)
    runner.run()
