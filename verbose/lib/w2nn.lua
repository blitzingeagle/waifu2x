local function load_nn()
   tic = os.time()
   require 'torch'
   print(string.format("Module 'torch' prepared. (%d seconds)", os.time()-tic))

   tic = os.time()
   require 'nn'
   print(string.format("Module 'nn' prepared. (%d seconds)", os.time()-tic))
end
local function load_cunn()
   tic = os.time()
   require 'cutorch'
   print(string.format("Module 'cutorch' prepared. (%d seconds)", os.time()-tic))
   
   tic = os.time()
   require 'cunn'
   print(string.format("Module 'cunn' prepared. (%d seconds)", os.time()-tic))
end
local function load_cudnn()
   tic = os.time()
   cudnn = require('cudnn')
   print(string.format("Module 'cudnn' prepared. (%d seconds)", os.time()-tic))
end
if w2nn then
   return w2nn
else
   w2nn = {}
   local state, ret = pcall(load_cunn)
   if not state then
      error("Failed to load CUDA modules. Please check the CUDA Settings.\n---\n" .. ret)
   end
   pcall(load_cudnn)
   
   function w2nn.load_model(model_path, force_cudnn)
      local model = torch.load(model_path, "ascii")
      if force_cudnn then
	 model = cudnn.convert(model, cudnn)
      end
      model:cuda():evaluate()
      return model
   end
   
   tic = os.time()
   require 'LeakyReLU'
   print(string.format("Module 'LeakyReLU' prepared. (%d seconds)", os.time()-tic))

   tic = os.time()
   require 'ClippedWeightedHuberCriterion'
   print(string.format("Module 'ClippsedWeightHuberCriterion' prepared. (%d seconds)", os.time()-tic))

   tic = os.time()
   require 'ClippedMSECriterion'
   print(string.format("Module 'ClippedMSECriterion' prepared. (%d seconds)", os.time()-tic))

   return w2nn
end
