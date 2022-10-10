

export interface CircleSprite {
    id: number
    size: number
    circle: CircleData
    circlePath: paper.Path
    imageId: number
    imageRaster: paper.Raster
}

export interface Star extends CircleSprite {
    planets: Planet[]

}

export interface Planet extends CircleSprite {
    offset: paper.Point
}

export interface CircleData {
    center: paper.Point,
    radius: number,
    fillColour: string,
    strokeColour: string,
    strokeWidth: number,
}