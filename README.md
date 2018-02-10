# SBSCustomAnimoji

Custom animoji built using Apples private framework AvatarKit. For an example on how to use Apples Animojis that are used in iMessage, refer to [SBSAnimoji](https://github.com/simonbs/SBSAnimoji).

![](https://raw.githubusercontent.com/simonbs/SBSCustomAnimoji/master/screenshot.png)

Below you will find a brief introduction to making your own Animoji. All the code you will need is in this repository including an example 3D model made using Blender.

## Making your own Animoji

First you need to draw your 3D model using your favorite 3D creation software. I used [Blender](https://www.blender.org) to create Mr. Square. You can find my Blender file in this repository.

Next you need to add support for geometry morphers. AvatarKit use [geometry morphers](https://developer.apple.com/documentation/scenekit/scnmorpher) to morph between different expressions. When AvatarKit recognizes a facial expression, it will assign a weight between 0 and 1 to the facial expression. For example, opening your mouth as much as you can, will have a value of 1 and closing it completely will have a value of 0. By doing this for all of your facial expressions and assigning the weights to geometry morphers, the 3D model will reflect your expression.
Your 3D model should support these geometry morphers. In Blender you do this using [shape keys](https://docs.blender.org/manual/en/dev/animation/shape_keys/introduction.html). See below for a list of supported geometry morphers.

You should also add a skeleton to your 3D model. You will only need to create a single bone which AvatarKit will use to rotate your 3D model as you rotate your head.

In order to use your 3D model with AvatarKit, you need to create a SceneKit scene. First you will need to export your 3D model. I exported it to Collada (.dae). If you are using Blender, there's an extra step. When exporting to Collada using Blender, the shape keys are not available to SceneKit. You can use [ColladaMorphAdjuster](https://github.com/JonAllee/ColladaMorphAdjuster) to ensure that the shape keys are correctly exposed. However, there's an issue when using ColladaMorphAdjuster with a Collada file containing a skeleton. As mentioned in [this issue](https://github.com/JonAllee/ColladaMorphAdjuster/issues/2) in the ColladdaMorphAdjuster repository, you'll need to manually modify the exported Collada file.

Add a scene to your Xcode project.

Your scene graph should have the following nodes:

```
- puppet
  - head
  - ...other nodes you want to participate in the animation
- skeleton
  - head_JNT
```

Finally you need to make create an instance of AVTPuppet that holds your custom Animoji. I swizzle `+pathForPuppetNamed:options:` in order to do this as it allows me to load my custom Animojis the same way as Apples Animojis are loaded. Then I can use `+puppetNamed:options:` to create my instance of AVTPuppet and assign it to an AVTPuppetView.

## Supported geometry morphers

Here are all the supported geometry morphers as of iOS 11.2.5.

- BrowsD_L_0_3
- BrowsD_L_0_35
- BrowsD_L_0_6
- BrowsD_R_0_3
- BrowsD_R_0_35
- BrowsD_R_0_6
- BrowsU_C_0_6
- BrowsU_C_0_9
- BrowsU_L_0_6
- BrowsU_L_0_9
- BrowsU_R_0_6
- BrowsU_R_0_9
- Emoji
- EyeBlink_L_0_15
- EyeBlink_L_0_16
- EyeBlink_L_0_25
- EyeBlink_L_0_33
- EyeBlink_L_0_35
- EyeBlink_L_0_5
- EyeBlink_L_0_65
- EyeBlink_L_0_66
- EyeBlink_R_0_15
- EyeBlink_R_0_16
- EyeBlink_R_0_25
- EyeBlink_R_0_33
- EyeBlink_R_0_35
- EyeBlink_R_0_5
- EyeBlink_R_0_65
- EyeBlink_R_0_66
- EyeSquint_L_0_15
- EyeSquint_L_0_2
- EyeSquint_L_0_3
- EyeSquint_L_0_33
- EyeSquint_L_0_4
- EyeSquint_L_0_5
- EyeSquint_L_0_6
- EyeSquint_L_0_66
- EyeSquint_R_0_15
- EyeSquint_R_0_2
- EyeSquint_R_0_3
- EyeSquint_R_0_33
- EyeSquint_R_0_4
- EyeSquint_R_0_5
- EyeSquint_R_0_6
- EyeSquint_R_0_66
- L_ear_DYN_backward
- L_ear_DYN_downward
- L_ear_DYN_forward
- L_ear_DYN_leftward
- L_ear_DYN_rightward
- L_ear_DYN_upward
- L_hair_DYN_backward
- L_hair_DYN_downward
- L_hair_DYN_forward
- L_hair_DYN_upward
- L_wattle_DYN_backward
- L_wattle_DYN_backward__L_wattle_DYN_leftward
- L_wattle_DYN_backward__L_wattle_DYN_rightward
- L_wattle_DYN_forward
- L_wattle_DYN_leftward
- L_wattle_DYN_rightward
- L_whisker_DYN_backward
- L_whisker_DYN_downward
- L_whisker_DYN_forward
- L_whisker_DYN_leftward
- L_whisker_DYN_rightward
- L_whisker_DYN_upward
- LipsFunnel_0_3
- LipsFunnel_0_5
- LipsFunnel_0_66
- LipsPucker_0_15
- LipsPucker_0_25
- LipsPucker_0_33
- LipsPucker_0_4
- LipsPucker_0_5
- LipsPucker_0_66
- LipsTogether_0_5
- LipsTogether_0_66
- R_ear_DYN_backward
- R_ear_DYN_downward
- R_ear_DYN_forward
- R_ear_DYN_leftward
- R_ear_DYN_rightward
- R_ear_DYN_upward
- R_hair_DYN_backward
- R_hair_DYN_downward
- R_hair_DYN_forward
- R_hair_DYN_upward
- R_wattle_DYN_backward
- R_wattle_DYN_backward__R_wattle_DYN_leftward
- R_wattle_DYN_backward__R_wattle_DYN_rightward
- R_wattle_DYN_forward
- R_wattle_DYN_leftward
- R_wattle_DYN_rightward
- R_whisker_DYN_backward
- R_whisker_DYN_downward
- R_whisker_DYN_forward
- R_whisker_DYN_leftward
- R_whisker_DYN_rightward
- R_whisker_DYN_upward
- browDown_L
- browDown_L__browInnerUp
- browDown_L__eyeBlink_L
- browDown_L__eyeWide_L
- browDown_L__mouthFrown_L
- browDown_L__noseSneer_L
- browDown_R
- browDown_R__browInnerUp
- browDown_R__eyeBlink_R
- browDown_R__eyeWide_R
- browDown_R__mouthFrown_R
- browDown_R__noseSneer_R
- browInnerUp
- browInnerUp__browOuterUp_L
- browInnerUp__browOuterUp_R
- browInnerUp__eyeBlink_L
- browInnerUp__eyeBlink_R
- browInnerUp__mouthFrown_L
- browInnerUp__mouthFrown_R
- browOuterUp_L
- browOuterUp_L_0_5
- browOuterUp_L__browOuterUp_R
- browOuterUp_L__eyeBlink_L
- browOuterUp_R
- browOuterUp_R_0_5
- browOuterUp_R__eyeBlink_R
- cheekPuff
- cheekSquint_L
- cheekSquint_L__eyeBlink_L
- cheekSquint_L__eyeSquint_L
- cheekSquint_L__mouthSmile_L
- cheekSquint_R
- cheekSquint_R__eyeBlink_R
- cheekSquint_R__eyeSquint_R
- cheekSquint_R__mouthSmile_R
- comb_DYN_backward
- comb_DYN_forward
- comb_DYN_leftward
- comb_DYN_rightward
- dollop_DYN_backward
- dollop_DYN_forward
- dollop_DYN_leftward
- dollop_DYN_rightward
- eyeBlink_L
- eyeBlink_L_0_15
- eyeBlink_L_0_33
- eyeBlink_L_0_66
- eyeBlink_L__eyeSquint_L
- eyeBlink_L__noseSneer_L
- eyeBlink_R
- eyeBlink_R_0_15
- eyeBlink_R_0_33
- eyeBlink_R_0_66
- eyeBlink_R__eyeSquint_R
- eyeBlink_R__noseSneer_R
- eyeLookDown_L
- eyeLookDown_R
- eyeLookIn_L
- eyeLookIn_R
- eyeLookOut_L
- eyeLookOut_R
- eyeLookUp_L
- eyeLookUp_R
- eyeSquint_L
- eyeSquint_L_0_25
- eyeSquint_L_0_5
- eyeSquint_L__eyeWide_L
- eyeSquint_R
- eyeSquint_R_0_25
- eyeSquint_R_0_5
- eyeSquint_R__eyeWide_R
- eyeWide_L
- eyeWide_R
- jawForward
- jawLeft
- jawLeft__jawOpen
- jawLeft__mouthFrown_L
- jawOpen
- jawOpen__jawRight
- jawOpen__mouthClose__mouthFunnel
- jawOpen__mouthClose__mouthFunnel__mouthPucker
- jawOpen__mouthClose__mouthPucker
- jawOpen__mouthDimple_L
- jawOpen__mouthDimple_R
- jawOpen__mouthFrown_L
- jawOpen__mouthFrown_R
- jawOpen__mouthFunnel
- jawOpen__mouthFunnel__mouthPucker
- jawOpen__mouthLeft
- jawOpen__mouthLowerDown_L
- jawOpen__mouthLowerDown_R
- jawOpen__mouthPucker
- jawOpen__mouthRight
- jawOpen__mouthRollLower
- jawOpen__mouthSmile_L
- jawOpen__mouthSmile_R
- jawOpen__mouthStretch_L
- jawOpen__mouthStretch_R
- jawOpen__mouthUpperUp_L
- jawOpen__mouthUpperUp_R
- jawRight
- jawRight__mouthFrown_R
- mouthClose
- mouthDimple_L
- mouthDimple_L__mouthPucker
- mouthDimple_L__mouthSmile_L
- mouthDimple_R
- mouthDimple_R__mouthPucker
- mouthDimple_R__mouthSmile_R
- mouthFrown_L
- mouthFrown_L__mouthFunnel
- mouthFrown_L__mouthPucker
- mouthFrown_L__mouthStretch_L
- mouthFrown_L__noseSneer_L
- mouthFrown_R
- mouthFrown_R__mouthFunnel
- mouthFrown_R__mouthPucker
- mouthFrown_R__mouthStretch_R
- mouthFrown_R__noseSneer_R
- mouthFunnel
- mouthFunnel__mouthLeft
- mouthFunnel__mouthPucker
- mouthFunnel__mouthRight
- mouthFunnel__mouthSmile_L
- mouthFunnel__mouthSmile_R
- mouthFunnel__mouthStretch_L
- mouthFunnel__mouthStretch_R
- mouthFunnel__mouthUpperUp_L
- mouthFunnel__mouthUpperUp_R
- mouthFunnel__noseSneer_L
- mouthFunnel__noseSneer_R
- mouthLeft
- mouthLeft__mouthPucker
- mouthLeft__mouthRight
- mouthLeft__mouthSmile_L
- mouthLeft__mouthStretch_L
- mouthLowerDown_L
- mouthLowerDown_L__mouthLowerDown_R
- mouthLowerDown_L__mouthSmile_L
- mouthLowerDown_L__mouthStretch_L
- mouthLowerDown_R
- mouthLowerDown_R__mouthSmile_R
- mouthLowerDown_R__mouthStretch_R
- mouthPress_L
- mouthPress_L__mouthPress_R
- mouthPress_L__mouthSmile_L
- mouthPress_R
- mouthPress_R__mouthSmile_R
- mouthPucker
- mouthPucker_0_25
- mouthPucker_0_5
- mouthPucker__mouthRight
- mouthPucker__mouthSmile_L
- mouthPucker__mouthSmile_R
- mouthPucker__mouthStretch_L
- mouthPucker__mouthStretch_R
- mouthRight
- mouthRight__mouthSmile_R
- mouthRight__mouthStretch_R
- mouthRollLower
- mouthRollUpper
- mouthShrugLower
- mouthShrugUpper
- mouthSmile_L
- mouthSmile_L__mouthSmile_R
- mouthSmile_L__mouthStretch_L
- mouthSmile_L__mouthUpperUp_L
- mouthSmile_R
- mouthSmile_R__mouthStretch_R
- mouthSmile_R__mouthUpperUp_R
- mouthStretch_L
- mouthStretch_L__mouthStretch_R
- mouthStretch_L__mouthUpperUp_L
- mouthStretch_R
- mouthStretch_R__mouthUpperUp_R
- mouthUpperUp_L
- mouthUpperUp_L__mouthUpperUp_R
- mouthUpperUp_R
- noseSneer_L
- noseSneer_L__noseSneer_R
- noseSneer_R
- nose_DYN_downward
- nose_DYN_leftward
- nose_DYN_rightward
- nose_DYN_upward

# Notice

This project relies heavily on Apples private API and you should therefore not try to submit this code to App Store.
