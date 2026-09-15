local status, comment = pcall(require, "Comment") -- module name is case-sensitive on Linux
if (not status) then return end

comment.setup {
}

