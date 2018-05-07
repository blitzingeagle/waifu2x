local cmd = torch.CmdLine()
cmd:text()
cmd:text("Convert Torch7 ASCII files to Binary")
cmd:text("Options:")
cmd:option("-i", "input.t7", "path to input Torch7 ASCII")
cmd:option("-o", "output.t7", "path to output Torch7 binary")

local opt = cmd:parse(arg)

local model = torch.load(opt.i, "ascii")
torch.save(opt.o, model, "binary")
