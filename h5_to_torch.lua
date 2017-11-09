-- read hdf5 file and save it into torch Tensor.

require 'hdf5'
local cjson = require 'cjson'

function utils.read_json(path)
    local file = io.open(path, 'r')
    local text = file:read()
    file:close()
    local info = cjson.decode(text)
    return info
end

-- read h5 file to load weights.
local h5file = hdf5.open('hdf5/inception-v3.h5', 'r')
--local h5_file = hdf5.open('hdf5/inception.h5', 'r')
--local h5_file = hdf5.open('hdf5/ttt.h5', 'r')

-- read json files to load layer names.
local json_file = utils.read_json('hdf5/inception-v3.json')
local layer_name = json_file.layer_name

for i = 1, #layer_name do
    print(h5file:read(layer_name[i]):all())
end








