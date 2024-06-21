function file_name(tag, timestamp, record)
    filename = record['filename']
    if filename ~= nil then
            filename = string.match(filename, '/.*/.*/(.*)') or string.match(filename, '/.*/.*/.*/(.*)')
            record['filename'] = filename

    end
    return 2, timestamp, record
end