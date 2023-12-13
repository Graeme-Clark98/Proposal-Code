import json

def parse_coco_json(json_file):
    with open(json_file, "r") as f:
        json_data = json.load(f)

    return json_data["images"],json_data["annotations"]

if __name__ == "__main__":
    json_file = "_annotations.coco.json"
    images, annotations = parse_coco_json(json_file)

    for anno in annotations:
        image_id=anno["image_id"]
        image=images[image_id]
        file_name=image["file_name"]
        area=anno["area"]
        bbox=anno["bbox"]
        width=bbox[2]
        height=bbox[3]
        print(anno["id"],",",file_name,",",height,",",width,",",area)

