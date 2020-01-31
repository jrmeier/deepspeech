import sys
sys.setrecursionlimit(2000)

def smart_line_split(line, block="", max_len=140):
    if len(line) > max_len:
        raw_line = line[:max_len]
        clean, extra = find_nearest_space(raw_line)

        return smart_line_split(extra + line[max_len:], block + clean, max_len)
    
    return "{}{}".format(block,line)

def find_nearest_space(line):
    """ finds the nearest space to the end to insert a line break """    
    char = None
    i = 1
    while char != " " and not i >= 50:
        char = line[len(line)-i]
        i += 1
    clean = "{}\n".format(line[:len(line)-i+1])
    extra = line[len(line)-i+2:]
    return clean, extra


def write_new_file(name, formatted_text):
    new_file_name = '/Users/jedmeier/Projects/jockonotes/transcripts/{}_formatted.txt'.format(name)
    # new_file_name = './output/{}'
    with open(new_file_name, 'w') as new_file:
        for line in formatted_text:
            new_file.write(line)


def run(name):
    """ produces a new file from the input file """
    input_file_path = "./output/{}.txt".format(name)

    with open(input_file_path, 'r') as the_file:
        text = the_file.read()
    
    formatted = smart_line_split(text, max_len=140)

    write_new_file(name, formatted)


if __name__ == "__main__":
    name = sys.argv[1]
    run(name)
