import pynvml

try:
    pynvml.nvmlInit()
    print("Driver version:", pynvml.nvmlSystemGetDriverVersion())
    
    deviceCount = pynvml.nvmlDeviceGetCount()
    for i in range(deviceCount):
        handle = pynvml.nvmlDeviceGetHandleByIndex(i)
        print("Device", i, ":", pynvml.nvmlDeviceGetName(handle))
        
except pynvml.NVMLError as error:
    print(f"NVML error: {error}")
    
finally:
    pynvml.nvmlShutdown()
