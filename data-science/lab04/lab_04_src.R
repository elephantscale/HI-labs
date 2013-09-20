mygrep <- function(word, file_name) {
    text_file = file(file_name, "rt")
    line_count = 0
    repeat {
        line = readLines(text_file,1)
        if ( length(line) == 0 ) {
            break
        }
        line_count = line_count + 1
        matches = grep(word, line)
        if ( length(matches) > 0 ) {
            print(paste(line_count,":",line))
        }
    }
}
