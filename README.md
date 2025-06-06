# StoryboardDecoder

A utility for converting .storyboard and .xib XML files into Swift model representations.

## Project Background

Originally forked from [IBDecodable/IBDecodable 0.6.1](https://github.com/IBDecodable/IBDecodable/releases/tag/0.6.1) to continue development independently due to inactivity in the source repository. The repository and framework were renamed to StoryboardDecoder.

## Parse Storyboard

From file url:
```swift
let file = try StoryboardFile(url: fileURL)
```

From string content:
```swift
let parser = InterfaceBuilderParser()
let storyboardDocument = try parser.parseStoryboard(xml: "<?xml ... ")
```

### Browse the storyboard scene

```swift
if let scenes = file.document.scenes {
  for scene in scenes {
    ..
  }
}
```

### Get the storyboard resources

```swift
if let resources = file.document.resources {
  for resource in resources {
    resource.resource // .. `NamedColor`, Ìmage
  }
}
```

## Parse Xib

From file url:
```swift
let file = try XibFile(url: fileURL)
```

From string content:
```swift
let parser = InterfaceBuilderParser()
let xibDocument = try parser.parseXib(xml: "<?xml ... ")
```
