print("Program started!")
start_time = os.time()

print("Preparing requirements...")
batch_time = os.time()

tic = os.time()
require 'pl'
local __FILE__ = (function() return string.gsub(debug.getinfo(2, 'S').source, "^@", "") end)()
package.path = path.join(path.dirname(__FILE__), "lib", "?.lua;") .. package.path
print(string.format("Module 'pl' prepared. (%d seconds)", os.time()-tic))

tic = os.time()
require 'sys'
print(string.format("Module 'sys' prepared. (%d seconds)", os.time()-tic))

tic = os.time()
require 'w2nn'
print(string.format("Module 'w2nn' prepared. (%d seconds)", os.time()-tic))

tic = os.time()
local iproc = require 'iproc'
print(string.format("Module 'iproc' prepared. (%d seconds)", os.time()-tic))

tic = os.time()
local reconstruct = require 'reconstruct'
print(string.format("Module 'reconstruct' prepared. (%d seconds)", os.time()-tic))

tic = os.time()
local image_loader = require 'image_loader'
print(string.format("Module 'image_loader' prepared. (%d seconds)", os.time()-tic))

tic = os.time()
local alpha_util = require 'alpha_util'
print(string.format("Module 'alpha_util' prepared. (%d seconds)", os.time()-tic))

print(string.format("Requirements prepared in %d seconds (%d seconds since program start).", os.time()-batch_time, os.time()-start_time))
