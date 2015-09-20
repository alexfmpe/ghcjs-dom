{-# LANGUAGE CPP #-}
#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
{-# LANGUAGE JavaScriptFFI, ForeignFunctionInterface, ConstraintKinds, FlexibleInstances #-}
#else
{-# LANGUAGE ConstraintKinds #-}
#endif
module GHCJS.DOM.Types (
#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
  -- * Object
    maybeJSNullOrUndefined, Nullable(..), nullableToMaybe, maybeToNullable, propagateGError, GType(..)
  , GObject(..), IsGObject, toGObject, castToGObject, gTypeGObject, unsafeCastGObject, isA, objectToString
  , js_eq

  -- * DOMString
  , DOMString(..), ToDOMString(..), FromDOMString(..), IsDOMString, ToJSString(..), FromJSString(..)
  , toJSString, fromJSString, toMaybeJSString, fromMaybeJSString

  -- * Callbacks
  , AudioBufferCallback(..)
  , DatabaseCallback(..)
  , MediaQueryListListener(..)
  , MediaStreamTrackSourcesCallback(..)
  , NavigatorUserMediaErrorCallback(..)
  , NavigatorUserMediaSuccessCallback(..)
  , NotificationPermissionCallback(..)
  , PositionCallback(..)
  , PositionErrorCallback(..)
  , RequestAnimationFrameCallback(..)
  , RTCPeerConnectionErrorCallback(..)
  , RTCSessionDescriptionCallback(..)
  , RTCStatsCallback(..)
  , SQLStatementCallback(..)
  , SQLStatementErrorCallback(..)
  , SQLTransactionCallback(..)
  , SQLTransactionErrorCallback(..)
  , StorageErrorCallback(..)
  , StorageQuotaCallback(..)
  , StorageUsageCallback(..)
  , StringCallback(..)
  , VoidCallback(..)

  -- * Dictionaries
  , Dictionary(Dictionary), unDictionary, IsDictionary, toDictionary
  , BlobPropertyBag(BlobPropertyBag), unBlobPropertyBag, IsBlobPropertyBag, toBlobPropertyBag

  -- * Mutation Callback
  , MutationCallback(MutationCallback), unMutationCallback, IsMutationCallback, toMutationCallback

  -- * Promise
  , Promise(Promise), unPromise, IsPromise, toPromise, castToPromise, gTypePromise

  -- * Date
  , Date(Date), unDate, IsDate, toDate, castToDate, gTypeDate

  -- * Arrays
  , Array(Array), unArray, IsArray, toArray, castToArray, gTypeArray
  , ObjectArray(ObjectArray), unObjectArray, IsObjectArray, toObjectArray
  , ArrayBuffer(ArrayBuffer), unArrayBuffer, IsArrayBuffer, toArrayBuffer, castToArrayBuffer, gTypeArrayBuffer
  , ArrayBufferView(ArrayBufferView), unArrayBufferView, IsArrayBufferView, toArrayBufferView
  , Float32Array(Float32Array), unFloat32Array, IsFloat32Array, toFloat32Array, castToFloat32Array, gTypeFloat32Array
  , Float64Array(Float64Array), unFloat64Array, IsFloat64Array, toFloat64Array, castToFloat64Array, gTypeFloat64Array
  , Uint8Array(Uint8Array), unUint8Array, IsUint8Array, toUint8Array, castToUint8Array, gTypeUint8Array
  , Uint8ClampedArray(Uint8ClampedArray), unUint8ClampedArray, IsUint8ClampedArray, toUint8ClampedArray, castToUint8ClampedArray, gTypeUint8ClampedArray
  , Uint16Array(Uint16Array), unUint16Array, IsUint16Array, toUint16Array, castToUint16Array, gTypeUint16Array
  , Uint32Array(Uint32Array), unUint32Array, IsUint32Array, toUint32Array, castToUint32Array, gTypeUint32Array
  , Int8Array(Int8Array), unInt8Array, IsInt8Array, toInt8Array, castToInt8Array, gTypeInt8Array
  , Int16Array(Int16Array), unInt16Array, IsInt16Array, toInt16Array, castToInt16Array, gTypeInt16Array
  , Int32Array(Int32Array), unInt32Array, IsInt32Array, toInt32Array, castToInt32Array, gTypeInt32Array

  -- * Geolocation
  , SerializedScriptValue(SerializedScriptValue), unSerializedScriptValue, IsSerializedScriptValue, toSerializedScriptValue
  , PositionOptions(PositionOptions), unPositionOptions, IsPositionOptions, toPositionOptions
  , Acceleration(Acceleration), unAcceleration, IsAcceleration, toAcceleration
  , RotationRate(RotationRate), unRotationRate, IsRotationRate, toRotationRate

  -- * Crypto
  , Algorithm(Algorithm), unAlgorithm, IsAlgorithm, toAlgorithm
  , CryptoOperationData(CryptoOperationData), unCryptoOperationData, IsCryptoOperationData, toCryptoOperationData

  -- * CanvasStyle (fill & stroke style)
  , CanvasStyle(CanvasStyle), unCanvasStyle, IsCanvasStyle, toCanvasStyle

  , DOMException(DOMException), unDOMException, IsDOMException, toDOMException

  -- * WebGL typedefs
  , GLenum(..), GLboolean(..), GLbitfield(..), GLbyte(..), GLshort(..), GLint(..), GLsizei(..)
  , GLintptr(..), GLsizeiptr(..), GLubyte(..), GLushort(..), GLuint(..), GLfloat(..), GLclampf(..)
  , GLint64, GLuint64

  -- * Interface types from IDL files

-- AUTO GENERATION STARTS HERE
  , ANGLEInstancedArrays(ANGLEInstancedArrays), unANGLEInstancedArrays, castToANGLEInstancedArrays, gTypeANGLEInstancedArrays
  , AbstractView(AbstractView), unAbstractView, castToAbstractView, gTypeAbstractView
  , AbstractWorker(AbstractWorker), unAbstractWorker, castToAbstractWorker, gTypeAbstractWorker
  , AllAudioCapabilities(AllAudioCapabilities), unAllAudioCapabilities, castToAllAudioCapabilities, gTypeAllAudioCapabilities
  , AllVideoCapabilities(AllVideoCapabilities), unAllVideoCapabilities, castToAllVideoCapabilities, gTypeAllVideoCapabilities
  , AnalyserNode(AnalyserNode), unAnalyserNode, castToAnalyserNode, gTypeAnalyserNode
  , AnimationEvent(AnimationEvent), unAnimationEvent, castToAnimationEvent, gTypeAnimationEvent
  , ApplicationCache(ApplicationCache), unApplicationCache, castToApplicationCache, gTypeApplicationCache
  , Attr(Attr), unAttr, castToAttr, gTypeAttr
  , AudioBuffer(AudioBuffer), unAudioBuffer, castToAudioBuffer, gTypeAudioBuffer
  , AudioBufferSourceNode(AudioBufferSourceNode), unAudioBufferSourceNode, castToAudioBufferSourceNode, gTypeAudioBufferSourceNode
  , AudioContext(AudioContext), unAudioContext, IsAudioContext, toAudioContext, castToAudioContext, gTypeAudioContext
  , AudioDestinationNode(AudioDestinationNode), unAudioDestinationNode, castToAudioDestinationNode, gTypeAudioDestinationNode
  , AudioListener(AudioListener), unAudioListener, castToAudioListener, gTypeAudioListener
  , AudioNode(AudioNode), unAudioNode, IsAudioNode, toAudioNode, castToAudioNode, gTypeAudioNode
  , AudioParam(AudioParam), unAudioParam, castToAudioParam, gTypeAudioParam
  , AudioProcessingEvent(AudioProcessingEvent), unAudioProcessingEvent, castToAudioProcessingEvent, gTypeAudioProcessingEvent
  , AudioStreamTrack(AudioStreamTrack), unAudioStreamTrack, castToAudioStreamTrack, gTypeAudioStreamTrack
  , AudioTrack(AudioTrack), unAudioTrack, castToAudioTrack, gTypeAudioTrack
  , AudioTrackList(AudioTrackList), unAudioTrackList, castToAudioTrackList, gTypeAudioTrackList
  , AutocompleteErrorEvent(AutocompleteErrorEvent), unAutocompleteErrorEvent, castToAutocompleteErrorEvent, gTypeAutocompleteErrorEvent
  , BarProp(BarProp), unBarProp, castToBarProp, gTypeBarProp
  , BatteryManager(BatteryManager), unBatteryManager, castToBatteryManager, gTypeBatteryManager
  , BeforeLoadEvent(BeforeLoadEvent), unBeforeLoadEvent, castToBeforeLoadEvent, gTypeBeforeLoadEvent
  , BeforeUnloadEvent(BeforeUnloadEvent), unBeforeUnloadEvent, castToBeforeUnloadEvent, gTypeBeforeUnloadEvent
  , BiquadFilterNode(BiquadFilterNode), unBiquadFilterNode, castToBiquadFilterNode, gTypeBiquadFilterNode
  , Blob(Blob), unBlob, IsBlob, toBlob, castToBlob, gTypeBlob
  , CDATASection(CDATASection), unCDATASection, castToCDATASection, gTypeCDATASection
  , CSS(CSS), unCSS, castToCSS, gTypeCSS
  , CSSCharsetRule(CSSCharsetRule), unCSSCharsetRule, castToCSSCharsetRule, gTypeCSSCharsetRule
  , CSSFontFaceLoadEvent(CSSFontFaceLoadEvent), unCSSFontFaceLoadEvent, castToCSSFontFaceLoadEvent, gTypeCSSFontFaceLoadEvent
  , CSSFontFaceRule(CSSFontFaceRule), unCSSFontFaceRule, castToCSSFontFaceRule, gTypeCSSFontFaceRule
  , CSSImportRule(CSSImportRule), unCSSImportRule, castToCSSImportRule, gTypeCSSImportRule
  , CSSKeyframeRule(CSSKeyframeRule), unCSSKeyframeRule, castToCSSKeyframeRule, gTypeCSSKeyframeRule
  , CSSKeyframesRule(CSSKeyframesRule), unCSSKeyframesRule, castToCSSKeyframesRule, gTypeCSSKeyframesRule
  , CSSMediaRule(CSSMediaRule), unCSSMediaRule, castToCSSMediaRule, gTypeCSSMediaRule
  , CSSPageRule(CSSPageRule), unCSSPageRule, castToCSSPageRule, gTypeCSSPageRule
  , CSSPrimitiveValue(CSSPrimitiveValue), unCSSPrimitiveValue, castToCSSPrimitiveValue, gTypeCSSPrimitiveValue
  , CSSRule(CSSRule), unCSSRule, IsCSSRule, toCSSRule, castToCSSRule, gTypeCSSRule
  , CSSRuleList(CSSRuleList), unCSSRuleList, castToCSSRuleList, gTypeCSSRuleList
  , CSSStyleDeclaration(CSSStyleDeclaration), unCSSStyleDeclaration, castToCSSStyleDeclaration, gTypeCSSStyleDeclaration
  , CSSStyleRule(CSSStyleRule), unCSSStyleRule, castToCSSStyleRule, gTypeCSSStyleRule
  , CSSStyleSheet(CSSStyleSheet), unCSSStyleSheet, castToCSSStyleSheet, gTypeCSSStyleSheet
  , CSSSupportsRule(CSSSupportsRule), unCSSSupportsRule, castToCSSSupportsRule, gTypeCSSSupportsRule
  , CSSUnknownRule(CSSUnknownRule), unCSSUnknownRule, castToCSSUnknownRule, gTypeCSSUnknownRule
  , CSSValue(CSSValue), unCSSValue, IsCSSValue, toCSSValue, castToCSSValue, gTypeCSSValue
  , CSSValueList(CSSValueList), unCSSValueList, IsCSSValueList, toCSSValueList, castToCSSValueList, gTypeCSSValueList
  , CanvasGradient(CanvasGradient), unCanvasGradient, castToCanvasGradient, gTypeCanvasGradient
  , CanvasPattern(CanvasPattern), unCanvasPattern, castToCanvasPattern, gTypeCanvasPattern
  , CanvasProxy(CanvasProxy), unCanvasProxy, castToCanvasProxy, gTypeCanvasProxy
  , CanvasRenderingContext(CanvasRenderingContext), unCanvasRenderingContext, IsCanvasRenderingContext, toCanvasRenderingContext, castToCanvasRenderingContext, gTypeCanvasRenderingContext
  , CanvasRenderingContext2D(CanvasRenderingContext2D), unCanvasRenderingContext2D, castToCanvasRenderingContext2D, gTypeCanvasRenderingContext2D
  , CapabilityRange(CapabilityRange), unCapabilityRange, castToCapabilityRange, gTypeCapabilityRange
  , ChannelMergerNode(ChannelMergerNode), unChannelMergerNode, castToChannelMergerNode, gTypeChannelMergerNode
  , ChannelSplitterNode(ChannelSplitterNode), unChannelSplitterNode, castToChannelSplitterNode, gTypeChannelSplitterNode
  , CharacterData(CharacterData), unCharacterData, IsCharacterData, toCharacterData, castToCharacterData, gTypeCharacterData
  , ChildNode(ChildNode), unChildNode, castToChildNode, gTypeChildNode
  , ClientRect(ClientRect), unClientRect, castToClientRect, gTypeClientRect
  , ClientRectList(ClientRectList), unClientRectList, castToClientRectList, gTypeClientRectList
  , CloseEvent(CloseEvent), unCloseEvent, castToCloseEvent, gTypeCloseEvent
  , CommandLineAPIHost(CommandLineAPIHost), unCommandLineAPIHost, castToCommandLineAPIHost, gTypeCommandLineAPIHost
  , Comment(Comment), unComment, castToComment, gTypeComment
  , CompositionEvent(CompositionEvent), unCompositionEvent, castToCompositionEvent, gTypeCompositionEvent
  , ConvolverNode(ConvolverNode), unConvolverNode, castToConvolverNode, gTypeConvolverNode
  , Coordinates(Coordinates), unCoordinates, castToCoordinates, gTypeCoordinates
  , Counter(Counter), unCounter, castToCounter, gTypeCounter
  , Crypto(Crypto), unCrypto, castToCrypto, gTypeCrypto
  , CryptoKey(CryptoKey), unCryptoKey, castToCryptoKey, gTypeCryptoKey
  , CryptoKeyPair(CryptoKeyPair), unCryptoKeyPair, castToCryptoKeyPair, gTypeCryptoKeyPair
  , CustomEvent(CustomEvent), unCustomEvent, castToCustomEvent, gTypeCustomEvent
  , DOMError(DOMError), unDOMError, IsDOMError, toDOMError, castToDOMError, gTypeDOMError
  , DOMImplementation(DOMImplementation), unDOMImplementation, castToDOMImplementation, gTypeDOMImplementation
  , DOMNamedFlowCollection(DOMNamedFlowCollection), unDOMNamedFlowCollection, castToDOMNamedFlowCollection, gTypeDOMNamedFlowCollection
  , DOMParser(DOMParser), unDOMParser, castToDOMParser, gTypeDOMParser
  , DOMSettableTokenList(DOMSettableTokenList), unDOMSettableTokenList, castToDOMSettableTokenList, gTypeDOMSettableTokenList
  , DOMStringList(DOMStringList), unDOMStringList, castToDOMStringList, gTypeDOMStringList
  , DOMStringMap(DOMStringMap), unDOMStringMap, castToDOMStringMap, gTypeDOMStringMap
  , DOMTokenList(DOMTokenList), unDOMTokenList, IsDOMTokenList, toDOMTokenList, castToDOMTokenList, gTypeDOMTokenList
  , DataCue(DataCue), unDataCue, castToDataCue, gTypeDataCue
  , DataTransfer(DataTransfer), unDataTransfer, castToDataTransfer, gTypeDataTransfer
  , DataTransferItem(DataTransferItem), unDataTransferItem, castToDataTransferItem, gTypeDataTransferItem
  , DataTransferItemList(DataTransferItemList), unDataTransferItemList, castToDataTransferItemList, gTypeDataTransferItemList
  , Database(Database), unDatabase, castToDatabase, gTypeDatabase
  , DedicatedWorkerGlobalScope(DedicatedWorkerGlobalScope), unDedicatedWorkerGlobalScope, castToDedicatedWorkerGlobalScope, gTypeDedicatedWorkerGlobalScope
  , DelayNode(DelayNode), unDelayNode, castToDelayNode, gTypeDelayNode
  , DeviceMotionEvent(DeviceMotionEvent), unDeviceMotionEvent, castToDeviceMotionEvent, gTypeDeviceMotionEvent
  , DeviceOrientationEvent(DeviceOrientationEvent), unDeviceOrientationEvent, castToDeviceOrientationEvent, gTypeDeviceOrientationEvent
  , DeviceProximityEvent(DeviceProximityEvent), unDeviceProximityEvent, castToDeviceProximityEvent, gTypeDeviceProximityEvent
  , Document(Document), unDocument, IsDocument, toDocument, castToDocument, gTypeDocument
  , DocumentFragment(DocumentFragment), unDocumentFragment, castToDocumentFragment, gTypeDocumentFragment
  , DocumentType(DocumentType), unDocumentType, castToDocumentType, gTypeDocumentType
  , DynamicsCompressorNode(DynamicsCompressorNode), unDynamicsCompressorNode, castToDynamicsCompressorNode, gTypeDynamicsCompressorNode
  , EXTBlendMinMax(EXTBlendMinMax), unEXTBlendMinMax, castToEXTBlendMinMax, gTypeEXTBlendMinMax
  , EXTFragDepth(EXTFragDepth), unEXTFragDepth, castToEXTFragDepth, gTypeEXTFragDepth
  , EXTShaderTextureLOD(EXTShaderTextureLOD), unEXTShaderTextureLOD, castToEXTShaderTextureLOD, gTypeEXTShaderTextureLOD
  , EXTTextureFilterAnisotropic(EXTTextureFilterAnisotropic), unEXTTextureFilterAnisotropic, castToEXTTextureFilterAnisotropic, gTypeEXTTextureFilterAnisotropic
  , EXTsRGB(EXTsRGB), unEXTsRGB, castToEXTsRGB, gTypeEXTsRGB
  , Element(Element), unElement, IsElement, toElement, castToElement, gTypeElement
  , Entity(Entity), unEntity, castToEntity, gTypeEntity
  , EntityReference(EntityReference), unEntityReference, castToEntityReference, gTypeEntityReference
  , ErrorEvent(ErrorEvent), unErrorEvent, castToErrorEvent, gTypeErrorEvent
  , Event(Event), unEvent, IsEvent, toEvent, castToEvent, gTypeEvent
  , EventListener(EventListener), unEventListener, castToEventListener, gTypeEventListener
  , EventSource(EventSource), unEventSource, castToEventSource, gTypeEventSource
  , EventTarget(EventTarget), unEventTarget, IsEventTarget, toEventTarget, castToEventTarget, gTypeEventTarget
  , File(File), unFile, castToFile, gTypeFile
  , FileError(FileError), unFileError, castToFileError, gTypeFileError
  , FileList(FileList), unFileList, castToFileList, gTypeFileList
  , FileReader(FileReader), unFileReader, castToFileReader, gTypeFileReader
  , FileReaderSync(FileReaderSync), unFileReaderSync, castToFileReaderSync, gTypeFileReaderSync
  , FocusEvent(FocusEvent), unFocusEvent, castToFocusEvent, gTypeFocusEvent
  , FontLoader(FontLoader), unFontLoader, castToFontLoader, gTypeFontLoader
  , FormData(FormData), unFormData, castToFormData, gTypeFormData
  , GainNode(GainNode), unGainNode, castToGainNode, gTypeGainNode
  , Gamepad(Gamepad), unGamepad, castToGamepad, gTypeGamepad
  , GamepadButton(GamepadButton), unGamepadButton, castToGamepadButton, gTypeGamepadButton
  , GamepadEvent(GamepadEvent), unGamepadEvent, castToGamepadEvent, gTypeGamepadEvent
  , Geolocation(Geolocation), unGeolocation, castToGeolocation, gTypeGeolocation
  , Geoposition(Geoposition), unGeoposition, castToGeoposition, gTypeGeoposition
  , HTMLAllCollection(HTMLAllCollection), unHTMLAllCollection, castToHTMLAllCollection, gTypeHTMLAllCollection
  , HTMLAnchorElement(HTMLAnchorElement), unHTMLAnchorElement, castToHTMLAnchorElement, gTypeHTMLAnchorElement
  , HTMLAppletElement(HTMLAppletElement), unHTMLAppletElement, castToHTMLAppletElement, gTypeHTMLAppletElement
  , HTMLAreaElement(HTMLAreaElement), unHTMLAreaElement, castToHTMLAreaElement, gTypeHTMLAreaElement
  , HTMLAudioElement(HTMLAudioElement), unHTMLAudioElement, castToHTMLAudioElement, gTypeHTMLAudioElement
  , HTMLBRElement(HTMLBRElement), unHTMLBRElement, castToHTMLBRElement, gTypeHTMLBRElement
  , HTMLBaseElement(HTMLBaseElement), unHTMLBaseElement, castToHTMLBaseElement, gTypeHTMLBaseElement
  , HTMLBaseFontElement(HTMLBaseFontElement), unHTMLBaseFontElement, castToHTMLBaseFontElement, gTypeHTMLBaseFontElement
  , HTMLBodyElement(HTMLBodyElement), unHTMLBodyElement, castToHTMLBodyElement, gTypeHTMLBodyElement
  , HTMLButtonElement(HTMLButtonElement), unHTMLButtonElement, castToHTMLButtonElement, gTypeHTMLButtonElement
  , HTMLCanvasElement(HTMLCanvasElement), unHTMLCanvasElement, castToHTMLCanvasElement, gTypeHTMLCanvasElement
  , HTMLCollection(HTMLCollection), unHTMLCollection, IsHTMLCollection, toHTMLCollection, castToHTMLCollection, gTypeHTMLCollection
  , HTMLDListElement(HTMLDListElement), unHTMLDListElement, castToHTMLDListElement, gTypeHTMLDListElement
  , HTMLDataListElement(HTMLDataListElement), unHTMLDataListElement, castToHTMLDataListElement, gTypeHTMLDataListElement
  , HTMLDetailsElement(HTMLDetailsElement), unHTMLDetailsElement, castToHTMLDetailsElement, gTypeHTMLDetailsElement
  , HTMLDirectoryElement(HTMLDirectoryElement), unHTMLDirectoryElement, castToHTMLDirectoryElement, gTypeHTMLDirectoryElement
  , HTMLDivElement(HTMLDivElement), unHTMLDivElement, castToHTMLDivElement, gTypeHTMLDivElement
  , HTMLDocument(HTMLDocument), unHTMLDocument, castToHTMLDocument, gTypeHTMLDocument
  , HTMLElement(HTMLElement), unHTMLElement, IsHTMLElement, toHTMLElement, castToHTMLElement, gTypeHTMLElement
  , HTMLEmbedElement(HTMLEmbedElement), unHTMLEmbedElement, castToHTMLEmbedElement, gTypeHTMLEmbedElement
  , HTMLFieldSetElement(HTMLFieldSetElement), unHTMLFieldSetElement, castToHTMLFieldSetElement, gTypeHTMLFieldSetElement
  , HTMLFontElement(HTMLFontElement), unHTMLFontElement, castToHTMLFontElement, gTypeHTMLFontElement
  , HTMLFormControlsCollection(HTMLFormControlsCollection), unHTMLFormControlsCollection, castToHTMLFormControlsCollection, gTypeHTMLFormControlsCollection
  , HTMLFormElement(HTMLFormElement), unHTMLFormElement, castToHTMLFormElement, gTypeHTMLFormElement
  , HTMLFrameElement(HTMLFrameElement), unHTMLFrameElement, castToHTMLFrameElement, gTypeHTMLFrameElement
  , HTMLFrameSetElement(HTMLFrameSetElement), unHTMLFrameSetElement, castToHTMLFrameSetElement, gTypeHTMLFrameSetElement
  , HTMLHRElement(HTMLHRElement), unHTMLHRElement, castToHTMLHRElement, gTypeHTMLHRElement
  , HTMLHeadElement(HTMLHeadElement), unHTMLHeadElement, castToHTMLHeadElement, gTypeHTMLHeadElement
  , HTMLHeadingElement(HTMLHeadingElement), unHTMLHeadingElement, castToHTMLHeadingElement, gTypeHTMLHeadingElement
  , HTMLHtmlElement(HTMLHtmlElement), unHTMLHtmlElement, castToHTMLHtmlElement, gTypeHTMLHtmlElement
  , HTMLIFrameElement(HTMLIFrameElement), unHTMLIFrameElement, castToHTMLIFrameElement, gTypeHTMLIFrameElement
  , HTMLImageElement(HTMLImageElement), unHTMLImageElement, castToHTMLImageElement, gTypeHTMLImageElement
  , HTMLInputElement(HTMLInputElement), unHTMLInputElement, castToHTMLInputElement, gTypeHTMLInputElement
  , HTMLKeygenElement(HTMLKeygenElement), unHTMLKeygenElement, castToHTMLKeygenElement, gTypeHTMLKeygenElement
  , HTMLLIElement(HTMLLIElement), unHTMLLIElement, castToHTMLLIElement, gTypeHTMLLIElement
  , HTMLLabelElement(HTMLLabelElement), unHTMLLabelElement, castToHTMLLabelElement, gTypeHTMLLabelElement
  , HTMLLegendElement(HTMLLegendElement), unHTMLLegendElement, castToHTMLLegendElement, gTypeHTMLLegendElement
  , HTMLLinkElement(HTMLLinkElement), unHTMLLinkElement, castToHTMLLinkElement, gTypeHTMLLinkElement
  , HTMLMapElement(HTMLMapElement), unHTMLMapElement, castToHTMLMapElement, gTypeHTMLMapElement
  , HTMLMarqueeElement(HTMLMarqueeElement), unHTMLMarqueeElement, castToHTMLMarqueeElement, gTypeHTMLMarqueeElement
  , HTMLMediaElement(HTMLMediaElement), unHTMLMediaElement, IsHTMLMediaElement, toHTMLMediaElement, castToHTMLMediaElement, gTypeHTMLMediaElement
  , HTMLMenuElement(HTMLMenuElement), unHTMLMenuElement, castToHTMLMenuElement, gTypeHTMLMenuElement
  , HTMLMetaElement(HTMLMetaElement), unHTMLMetaElement, castToHTMLMetaElement, gTypeHTMLMetaElement
  , HTMLMeterElement(HTMLMeterElement), unHTMLMeterElement, castToHTMLMeterElement, gTypeHTMLMeterElement
  , HTMLModElement(HTMLModElement), unHTMLModElement, castToHTMLModElement, gTypeHTMLModElement
  , HTMLOListElement(HTMLOListElement), unHTMLOListElement, castToHTMLOListElement, gTypeHTMLOListElement
  , HTMLObjectElement(HTMLObjectElement), unHTMLObjectElement, castToHTMLObjectElement, gTypeHTMLObjectElement
  , HTMLOptGroupElement(HTMLOptGroupElement), unHTMLOptGroupElement, castToHTMLOptGroupElement, gTypeHTMLOptGroupElement
  , HTMLOptionElement(HTMLOptionElement), unHTMLOptionElement, castToHTMLOptionElement, gTypeHTMLOptionElement
  , HTMLOptionsCollection(HTMLOptionsCollection), unHTMLOptionsCollection, castToHTMLOptionsCollection, gTypeHTMLOptionsCollection
  , HTMLOutputElement(HTMLOutputElement), unHTMLOutputElement, castToHTMLOutputElement, gTypeHTMLOutputElement
  , HTMLParagraphElement(HTMLParagraphElement), unHTMLParagraphElement, castToHTMLParagraphElement, gTypeHTMLParagraphElement
  , HTMLParamElement(HTMLParamElement), unHTMLParamElement, castToHTMLParamElement, gTypeHTMLParamElement
  , HTMLPreElement(HTMLPreElement), unHTMLPreElement, castToHTMLPreElement, gTypeHTMLPreElement
  , HTMLProgressElement(HTMLProgressElement), unHTMLProgressElement, castToHTMLProgressElement, gTypeHTMLProgressElement
  , HTMLQuoteElement(HTMLQuoteElement), unHTMLQuoteElement, castToHTMLQuoteElement, gTypeHTMLQuoteElement
  , HTMLScriptElement(HTMLScriptElement), unHTMLScriptElement, castToHTMLScriptElement, gTypeHTMLScriptElement
  , HTMLSelectElement(HTMLSelectElement), unHTMLSelectElement, castToHTMLSelectElement, gTypeHTMLSelectElement
  , HTMLSourceElement(HTMLSourceElement), unHTMLSourceElement, castToHTMLSourceElement, gTypeHTMLSourceElement
  , HTMLSpanElement(HTMLSpanElement), unHTMLSpanElement, castToHTMLSpanElement, gTypeHTMLSpanElement
  , HTMLStyleElement(HTMLStyleElement), unHTMLStyleElement, castToHTMLStyleElement, gTypeHTMLStyleElement
  , HTMLTableCaptionElement(HTMLTableCaptionElement), unHTMLTableCaptionElement, castToHTMLTableCaptionElement, gTypeHTMLTableCaptionElement
  , HTMLTableCellElement(HTMLTableCellElement), unHTMLTableCellElement, castToHTMLTableCellElement, gTypeHTMLTableCellElement
  , HTMLTableColElement(HTMLTableColElement), unHTMLTableColElement, castToHTMLTableColElement, gTypeHTMLTableColElement
  , HTMLTableElement(HTMLTableElement), unHTMLTableElement, castToHTMLTableElement, gTypeHTMLTableElement
  , HTMLTableRowElement(HTMLTableRowElement), unHTMLTableRowElement, castToHTMLTableRowElement, gTypeHTMLTableRowElement
  , HTMLTableSectionElement(HTMLTableSectionElement), unHTMLTableSectionElement, castToHTMLTableSectionElement, gTypeHTMLTableSectionElement
  , HTMLTemplateElement(HTMLTemplateElement), unHTMLTemplateElement, castToHTMLTemplateElement, gTypeHTMLTemplateElement
  , HTMLTextAreaElement(HTMLTextAreaElement), unHTMLTextAreaElement, castToHTMLTextAreaElement, gTypeHTMLTextAreaElement
  , HTMLTitleElement(HTMLTitleElement), unHTMLTitleElement, castToHTMLTitleElement, gTypeHTMLTitleElement
  , HTMLTrackElement(HTMLTrackElement), unHTMLTrackElement, castToHTMLTrackElement, gTypeHTMLTrackElement
  , HTMLUListElement(HTMLUListElement), unHTMLUListElement, castToHTMLUListElement, gTypeHTMLUListElement
  , HTMLUnknownElement(HTMLUnknownElement), unHTMLUnknownElement, castToHTMLUnknownElement, gTypeHTMLUnknownElement
  , HTMLVideoElement(HTMLVideoElement), unHTMLVideoElement, castToHTMLVideoElement, gTypeHTMLVideoElement
  , HashChangeEvent(HashChangeEvent), unHashChangeEvent, castToHashChangeEvent, gTypeHashChangeEvent
  , History(History), unHistory, castToHistory, gTypeHistory
  , IDBAny(IDBAny), unIDBAny, castToIDBAny, gTypeIDBAny
  , IDBCursor(IDBCursor), unIDBCursor, IsIDBCursor, toIDBCursor, castToIDBCursor, gTypeIDBCursor
  , IDBCursorWithValue(IDBCursorWithValue), unIDBCursorWithValue, castToIDBCursorWithValue, gTypeIDBCursorWithValue
  , IDBDatabase(IDBDatabase), unIDBDatabase, castToIDBDatabase, gTypeIDBDatabase
  , IDBFactory(IDBFactory), unIDBFactory, castToIDBFactory, gTypeIDBFactory
  , IDBIndex(IDBIndex), unIDBIndex, castToIDBIndex, gTypeIDBIndex
  , IDBKeyRange(IDBKeyRange), unIDBKeyRange, castToIDBKeyRange, gTypeIDBKeyRange
  , IDBObjectStore(IDBObjectStore), unIDBObjectStore, castToIDBObjectStore, gTypeIDBObjectStore
  , IDBOpenDBRequest(IDBOpenDBRequest), unIDBOpenDBRequest, castToIDBOpenDBRequest, gTypeIDBOpenDBRequest
  , IDBRequest(IDBRequest), unIDBRequest, IsIDBRequest, toIDBRequest, castToIDBRequest, gTypeIDBRequest
  , IDBTransaction(IDBTransaction), unIDBTransaction, castToIDBTransaction, gTypeIDBTransaction
  , IDBVersionChangeEvent(IDBVersionChangeEvent), unIDBVersionChangeEvent, castToIDBVersionChangeEvent, gTypeIDBVersionChangeEvent
  , ImageData(ImageData), unImageData, castToImageData, gTypeImageData
  , InspectorFrontendHost(InspectorFrontendHost), unInspectorFrontendHost, castToInspectorFrontendHost, gTypeInspectorFrontendHost
  , InternalSettings(InternalSettings), unInternalSettings, castToInternalSettings, gTypeInternalSettings
  , Internals(Internals), unInternals, castToInternals, gTypeInternals
  , KeyboardEvent(KeyboardEvent), unKeyboardEvent, castToKeyboardEvent, gTypeKeyboardEvent
  , Location(Location), unLocation, castToLocation, gTypeLocation
  , MallocStatistics(MallocStatistics), unMallocStatistics, castToMallocStatistics, gTypeMallocStatistics
  , MediaController(MediaController), unMediaController, castToMediaController, gTypeMediaController
  , MediaControlsHost(MediaControlsHost), unMediaControlsHost, castToMediaControlsHost, gTypeMediaControlsHost
  , MediaElementAudioSourceNode(MediaElementAudioSourceNode), unMediaElementAudioSourceNode, castToMediaElementAudioSourceNode, gTypeMediaElementAudioSourceNode
  , MediaError(MediaError), unMediaError, castToMediaError, gTypeMediaError
  , MediaKeyError(MediaKeyError), unMediaKeyError, castToMediaKeyError, gTypeMediaKeyError
  , MediaKeyEvent(MediaKeyEvent), unMediaKeyEvent, castToMediaKeyEvent, gTypeMediaKeyEvent
  , MediaKeyMessageEvent(MediaKeyMessageEvent), unMediaKeyMessageEvent, castToMediaKeyMessageEvent, gTypeMediaKeyMessageEvent
  , MediaKeyNeededEvent(MediaKeyNeededEvent), unMediaKeyNeededEvent, castToMediaKeyNeededEvent, gTypeMediaKeyNeededEvent
  , MediaKeySession(MediaKeySession), unMediaKeySession, castToMediaKeySession, gTypeMediaKeySession
  , MediaKeys(MediaKeys), unMediaKeys, castToMediaKeys, gTypeMediaKeys
  , MediaList(MediaList), unMediaList, castToMediaList, gTypeMediaList
  , MediaQueryList(MediaQueryList), unMediaQueryList, castToMediaQueryList, gTypeMediaQueryList
  , MediaSource(MediaSource), unMediaSource, castToMediaSource, gTypeMediaSource
  , MediaSourceStates(MediaSourceStates), unMediaSourceStates, castToMediaSourceStates, gTypeMediaSourceStates
  , MediaStream(MediaStream), unMediaStream, castToMediaStream, gTypeMediaStream
  , MediaStreamAudioDestinationNode(MediaStreamAudioDestinationNode), unMediaStreamAudioDestinationNode, castToMediaStreamAudioDestinationNode, gTypeMediaStreamAudioDestinationNode
  , MediaStreamAudioSourceNode(MediaStreamAudioSourceNode), unMediaStreamAudioSourceNode, castToMediaStreamAudioSourceNode, gTypeMediaStreamAudioSourceNode
  , MediaStreamCapabilities(MediaStreamCapabilities), unMediaStreamCapabilities, IsMediaStreamCapabilities, toMediaStreamCapabilities, castToMediaStreamCapabilities, gTypeMediaStreamCapabilities
  , MediaStreamEvent(MediaStreamEvent), unMediaStreamEvent, castToMediaStreamEvent, gTypeMediaStreamEvent
  , MediaStreamTrack(MediaStreamTrack), unMediaStreamTrack, IsMediaStreamTrack, toMediaStreamTrack, castToMediaStreamTrack, gTypeMediaStreamTrack
  , MediaStreamTrackEvent(MediaStreamTrackEvent), unMediaStreamTrackEvent, castToMediaStreamTrackEvent, gTypeMediaStreamTrackEvent
  , MediaTrackConstraint(MediaTrackConstraint), unMediaTrackConstraint, castToMediaTrackConstraint, gTypeMediaTrackConstraint
  , MediaTrackConstraintSet(MediaTrackConstraintSet), unMediaTrackConstraintSet, castToMediaTrackConstraintSet, gTypeMediaTrackConstraintSet
  , MediaTrackConstraints(MediaTrackConstraints), unMediaTrackConstraints, castToMediaTrackConstraints, gTypeMediaTrackConstraints
  , MemoryInfo(MemoryInfo), unMemoryInfo, castToMemoryInfo, gTypeMemoryInfo
  , MessageChannel(MessageChannel), unMessageChannel, castToMessageChannel, gTypeMessageChannel
  , MessageEvent(MessageEvent), unMessageEvent, castToMessageEvent, gTypeMessageEvent
  , MessagePort(MessagePort), unMessagePort, castToMessagePort, gTypeMessagePort
  , MimeType(MimeType), unMimeType, castToMimeType, gTypeMimeType
  , MimeTypeArray(MimeTypeArray), unMimeTypeArray, castToMimeTypeArray, gTypeMimeTypeArray
  , MouseEvent(MouseEvent), unMouseEvent, IsMouseEvent, toMouseEvent, castToMouseEvent, gTypeMouseEvent
  , MutationEvent(MutationEvent), unMutationEvent, castToMutationEvent, gTypeMutationEvent
  , MutationObserver(MutationObserver), unMutationObserver, castToMutationObserver, gTypeMutationObserver
  , MutationRecord(MutationRecord), unMutationRecord, castToMutationRecord, gTypeMutationRecord
  , NamedNodeMap(NamedNodeMap), unNamedNodeMap, castToNamedNodeMap, gTypeNamedNodeMap
  , Navigator(Navigator), unNavigator, castToNavigator, gTypeNavigator
  , NavigatorUserMediaError(NavigatorUserMediaError), unNavigatorUserMediaError, castToNavigatorUserMediaError, gTypeNavigatorUserMediaError
  , Node(Node), unNode, IsNode, toNode, castToNode, gTypeNode
  , NodeFilter(NodeFilter), unNodeFilter, castToNodeFilter, gTypeNodeFilter
  , NodeIterator(NodeIterator), unNodeIterator, castToNodeIterator, gTypeNodeIterator
  , NodeList(NodeList), unNodeList, IsNodeList, toNodeList, castToNodeList, gTypeNodeList
  , Notification(Notification), unNotification, castToNotification, gTypeNotification
  , NotificationCenter(NotificationCenter), unNotificationCenter, castToNotificationCenter, gTypeNotificationCenter
  , OESElementIndexUint(OESElementIndexUint), unOESElementIndexUint, castToOESElementIndexUint, gTypeOESElementIndexUint
  , OESStandardDerivatives(OESStandardDerivatives), unOESStandardDerivatives, castToOESStandardDerivatives, gTypeOESStandardDerivatives
  , OESTextureFloat(OESTextureFloat), unOESTextureFloat, castToOESTextureFloat, gTypeOESTextureFloat
  , OESTextureFloatLinear(OESTextureFloatLinear), unOESTextureFloatLinear, castToOESTextureFloatLinear, gTypeOESTextureFloatLinear
  , OESTextureHalfFloat(OESTextureHalfFloat), unOESTextureHalfFloat, castToOESTextureHalfFloat, gTypeOESTextureHalfFloat
  , OESTextureHalfFloatLinear(OESTextureHalfFloatLinear), unOESTextureHalfFloatLinear, castToOESTextureHalfFloatLinear, gTypeOESTextureHalfFloatLinear
  , OESVertexArrayObject(OESVertexArrayObject), unOESVertexArrayObject, castToOESVertexArrayObject, gTypeOESVertexArrayObject
  , OfflineAudioCompletionEvent(OfflineAudioCompletionEvent), unOfflineAudioCompletionEvent, castToOfflineAudioCompletionEvent, gTypeOfflineAudioCompletionEvent
  , OfflineAudioContext(OfflineAudioContext), unOfflineAudioContext, castToOfflineAudioContext, gTypeOfflineAudioContext
  , OscillatorNode(OscillatorNode), unOscillatorNode, castToOscillatorNode, gTypeOscillatorNode
  , OverflowEvent(OverflowEvent), unOverflowEvent, castToOverflowEvent, gTypeOverflowEvent
  , PageTransitionEvent(PageTransitionEvent), unPageTransitionEvent, castToPageTransitionEvent, gTypePageTransitionEvent
  , PannerNode(PannerNode), unPannerNode, castToPannerNode, gTypePannerNode
  , Path2D(Path2D), unPath2D, castToPath2D, gTypePath2D
  , Performance(Performance), unPerformance, castToPerformance, gTypePerformance
  , PerformanceEntry(PerformanceEntry), unPerformanceEntry, IsPerformanceEntry, toPerformanceEntry, castToPerformanceEntry, gTypePerformanceEntry
  , PerformanceEntryList(PerformanceEntryList), unPerformanceEntryList, castToPerformanceEntryList, gTypePerformanceEntryList
  , PerformanceMark(PerformanceMark), unPerformanceMark, castToPerformanceMark, gTypePerformanceMark
  , PerformanceMeasure(PerformanceMeasure), unPerformanceMeasure, castToPerformanceMeasure, gTypePerformanceMeasure
  , PerformanceNavigation(PerformanceNavigation), unPerformanceNavigation, castToPerformanceNavigation, gTypePerformanceNavigation
  , PerformanceResourceTiming(PerformanceResourceTiming), unPerformanceResourceTiming, castToPerformanceResourceTiming, gTypePerformanceResourceTiming
  , PerformanceTiming(PerformanceTiming), unPerformanceTiming, castToPerformanceTiming, gTypePerformanceTiming
  , PeriodicWave(PeriodicWave), unPeriodicWave, castToPeriodicWave, gTypePeriodicWave
  , Plugin(Plugin), unPlugin, castToPlugin, gTypePlugin
  , PluginArray(PluginArray), unPluginArray, castToPluginArray, gTypePluginArray
  , PopStateEvent(PopStateEvent), unPopStateEvent, castToPopStateEvent, gTypePopStateEvent
  , PositionError(PositionError), unPositionError, castToPositionError, gTypePositionError
  , ProcessingInstruction(ProcessingInstruction), unProcessingInstruction, castToProcessingInstruction, gTypeProcessingInstruction
  , ProgressEvent(ProgressEvent), unProgressEvent, IsProgressEvent, toProgressEvent, castToProgressEvent, gTypeProgressEvent
  , QuickTimePluginReplacement(QuickTimePluginReplacement), unQuickTimePluginReplacement, castToQuickTimePluginReplacement, gTypeQuickTimePluginReplacement
  , RGBColor(RGBColor), unRGBColor, castToRGBColor, gTypeRGBColor
  , RTCConfiguration(RTCConfiguration), unRTCConfiguration, castToRTCConfiguration, gTypeRTCConfiguration
  , RTCDTMFSender(RTCDTMFSender), unRTCDTMFSender, castToRTCDTMFSender, gTypeRTCDTMFSender
  , RTCDTMFToneChangeEvent(RTCDTMFToneChangeEvent), unRTCDTMFToneChangeEvent, castToRTCDTMFToneChangeEvent, gTypeRTCDTMFToneChangeEvent
  , RTCDataChannel(RTCDataChannel), unRTCDataChannel, castToRTCDataChannel, gTypeRTCDataChannel
  , RTCDataChannelEvent(RTCDataChannelEvent), unRTCDataChannelEvent, castToRTCDataChannelEvent, gTypeRTCDataChannelEvent
  , RTCIceCandidate(RTCIceCandidate), unRTCIceCandidate, castToRTCIceCandidate, gTypeRTCIceCandidate
  , RTCIceCandidateEvent(RTCIceCandidateEvent), unRTCIceCandidateEvent, castToRTCIceCandidateEvent, gTypeRTCIceCandidateEvent
  , RTCIceServer(RTCIceServer), unRTCIceServer, castToRTCIceServer, gTypeRTCIceServer
  , RTCPeerConnection(RTCPeerConnection), unRTCPeerConnection, castToRTCPeerConnection, gTypeRTCPeerConnection
  , RTCSessionDescription(RTCSessionDescription), unRTCSessionDescription, castToRTCSessionDescription, gTypeRTCSessionDescription
  , RTCStatsReport(RTCStatsReport), unRTCStatsReport, castToRTCStatsReport, gTypeRTCStatsReport
  , RTCStatsResponse(RTCStatsResponse), unRTCStatsResponse, castToRTCStatsResponse, gTypeRTCStatsResponse
  , RadioNodeList(RadioNodeList), unRadioNodeList, castToRadioNodeList, gTypeRadioNodeList
  , Range(Range), unRange, castToRange, gTypeRange
  , ReadableStream(ReadableStream), unReadableStream, castToReadableStream, gTypeReadableStream
  , Rect(Rect), unRect, castToRect, gTypeRect
  , SQLError(SQLError), unSQLError, castToSQLError, gTypeSQLError
  , SQLResultSet(SQLResultSet), unSQLResultSet, castToSQLResultSet, gTypeSQLResultSet
  , SQLResultSetRowList(SQLResultSetRowList), unSQLResultSetRowList, castToSQLResultSetRowList, gTypeSQLResultSetRowList
  , SQLTransaction(SQLTransaction), unSQLTransaction, castToSQLTransaction, gTypeSQLTransaction
  , SVGAElement(SVGAElement), unSVGAElement, castToSVGAElement, gTypeSVGAElement
  , SVGAltGlyphDefElement(SVGAltGlyphDefElement), unSVGAltGlyphDefElement, castToSVGAltGlyphDefElement, gTypeSVGAltGlyphDefElement
  , SVGAltGlyphElement(SVGAltGlyphElement), unSVGAltGlyphElement, castToSVGAltGlyphElement, gTypeSVGAltGlyphElement
  , SVGAltGlyphItemElement(SVGAltGlyphItemElement), unSVGAltGlyphItemElement, castToSVGAltGlyphItemElement, gTypeSVGAltGlyphItemElement
  , SVGAngle(SVGAngle), unSVGAngle, castToSVGAngle, gTypeSVGAngle
  , SVGAnimateColorElement(SVGAnimateColorElement), unSVGAnimateColorElement, castToSVGAnimateColorElement, gTypeSVGAnimateColorElement
  , SVGAnimateElement(SVGAnimateElement), unSVGAnimateElement, castToSVGAnimateElement, gTypeSVGAnimateElement
  , SVGAnimateMotionElement(SVGAnimateMotionElement), unSVGAnimateMotionElement, castToSVGAnimateMotionElement, gTypeSVGAnimateMotionElement
  , SVGAnimateTransformElement(SVGAnimateTransformElement), unSVGAnimateTransformElement, castToSVGAnimateTransformElement, gTypeSVGAnimateTransformElement
  , SVGAnimatedAngle(SVGAnimatedAngle), unSVGAnimatedAngle, castToSVGAnimatedAngle, gTypeSVGAnimatedAngle
  , SVGAnimatedBoolean(SVGAnimatedBoolean), unSVGAnimatedBoolean, castToSVGAnimatedBoolean, gTypeSVGAnimatedBoolean
  , SVGAnimatedEnumeration(SVGAnimatedEnumeration), unSVGAnimatedEnumeration, castToSVGAnimatedEnumeration, gTypeSVGAnimatedEnumeration
  , SVGAnimatedInteger(SVGAnimatedInteger), unSVGAnimatedInteger, castToSVGAnimatedInteger, gTypeSVGAnimatedInteger
  , SVGAnimatedLength(SVGAnimatedLength), unSVGAnimatedLength, castToSVGAnimatedLength, gTypeSVGAnimatedLength
  , SVGAnimatedLengthList(SVGAnimatedLengthList), unSVGAnimatedLengthList, castToSVGAnimatedLengthList, gTypeSVGAnimatedLengthList
  , SVGAnimatedNumber(SVGAnimatedNumber), unSVGAnimatedNumber, castToSVGAnimatedNumber, gTypeSVGAnimatedNumber
  , SVGAnimatedNumberList(SVGAnimatedNumberList), unSVGAnimatedNumberList, castToSVGAnimatedNumberList, gTypeSVGAnimatedNumberList
  , SVGAnimatedPreserveAspectRatio(SVGAnimatedPreserveAspectRatio), unSVGAnimatedPreserveAspectRatio, castToSVGAnimatedPreserveAspectRatio, gTypeSVGAnimatedPreserveAspectRatio
  , SVGAnimatedRect(SVGAnimatedRect), unSVGAnimatedRect, castToSVGAnimatedRect, gTypeSVGAnimatedRect
  , SVGAnimatedString(SVGAnimatedString), unSVGAnimatedString, castToSVGAnimatedString, gTypeSVGAnimatedString
  , SVGAnimatedTransformList(SVGAnimatedTransformList), unSVGAnimatedTransformList, castToSVGAnimatedTransformList, gTypeSVGAnimatedTransformList
  , SVGAnimationElement(SVGAnimationElement), unSVGAnimationElement, IsSVGAnimationElement, toSVGAnimationElement, castToSVGAnimationElement, gTypeSVGAnimationElement
  , SVGCircleElement(SVGCircleElement), unSVGCircleElement, castToSVGCircleElement, gTypeSVGCircleElement
  , SVGClipPathElement(SVGClipPathElement), unSVGClipPathElement, castToSVGClipPathElement, gTypeSVGClipPathElement
  , SVGColor(SVGColor), unSVGColor, IsSVGColor, toSVGColor, castToSVGColor, gTypeSVGColor
  , SVGComponentTransferFunctionElement(SVGComponentTransferFunctionElement), unSVGComponentTransferFunctionElement, IsSVGComponentTransferFunctionElement, toSVGComponentTransferFunctionElement, castToSVGComponentTransferFunctionElement, gTypeSVGComponentTransferFunctionElement
  , SVGCursorElement(SVGCursorElement), unSVGCursorElement, castToSVGCursorElement, gTypeSVGCursorElement
  , SVGDefsElement(SVGDefsElement), unSVGDefsElement, castToSVGDefsElement, gTypeSVGDefsElement
  , SVGDescElement(SVGDescElement), unSVGDescElement, castToSVGDescElement, gTypeSVGDescElement
  , SVGDocument(SVGDocument), unSVGDocument, castToSVGDocument, gTypeSVGDocument
  , SVGElement(SVGElement), unSVGElement, IsSVGElement, toSVGElement, castToSVGElement, gTypeSVGElement
  , SVGEllipseElement(SVGEllipseElement), unSVGEllipseElement, castToSVGEllipseElement, gTypeSVGEllipseElement
  , SVGExternalResourcesRequired(SVGExternalResourcesRequired), unSVGExternalResourcesRequired, castToSVGExternalResourcesRequired, gTypeSVGExternalResourcesRequired
  , SVGFEBlendElement(SVGFEBlendElement), unSVGFEBlendElement, castToSVGFEBlendElement, gTypeSVGFEBlendElement
  , SVGFEColorMatrixElement(SVGFEColorMatrixElement), unSVGFEColorMatrixElement, castToSVGFEColorMatrixElement, gTypeSVGFEColorMatrixElement
  , SVGFEComponentTransferElement(SVGFEComponentTransferElement), unSVGFEComponentTransferElement, castToSVGFEComponentTransferElement, gTypeSVGFEComponentTransferElement
  , SVGFECompositeElement(SVGFECompositeElement), unSVGFECompositeElement, castToSVGFECompositeElement, gTypeSVGFECompositeElement
  , SVGFEConvolveMatrixElement(SVGFEConvolveMatrixElement), unSVGFEConvolveMatrixElement, castToSVGFEConvolveMatrixElement, gTypeSVGFEConvolveMatrixElement
  , SVGFEDiffuseLightingElement(SVGFEDiffuseLightingElement), unSVGFEDiffuseLightingElement, castToSVGFEDiffuseLightingElement, gTypeSVGFEDiffuseLightingElement
  , SVGFEDisplacementMapElement(SVGFEDisplacementMapElement), unSVGFEDisplacementMapElement, castToSVGFEDisplacementMapElement, gTypeSVGFEDisplacementMapElement
  , SVGFEDistantLightElement(SVGFEDistantLightElement), unSVGFEDistantLightElement, castToSVGFEDistantLightElement, gTypeSVGFEDistantLightElement
  , SVGFEDropShadowElement(SVGFEDropShadowElement), unSVGFEDropShadowElement, castToSVGFEDropShadowElement, gTypeSVGFEDropShadowElement
  , SVGFEFloodElement(SVGFEFloodElement), unSVGFEFloodElement, castToSVGFEFloodElement, gTypeSVGFEFloodElement
  , SVGFEFuncAElement(SVGFEFuncAElement), unSVGFEFuncAElement, castToSVGFEFuncAElement, gTypeSVGFEFuncAElement
  , SVGFEFuncBElement(SVGFEFuncBElement), unSVGFEFuncBElement, castToSVGFEFuncBElement, gTypeSVGFEFuncBElement
  , SVGFEFuncGElement(SVGFEFuncGElement), unSVGFEFuncGElement, castToSVGFEFuncGElement, gTypeSVGFEFuncGElement
  , SVGFEFuncRElement(SVGFEFuncRElement), unSVGFEFuncRElement, castToSVGFEFuncRElement, gTypeSVGFEFuncRElement
  , SVGFEGaussianBlurElement(SVGFEGaussianBlurElement), unSVGFEGaussianBlurElement, castToSVGFEGaussianBlurElement, gTypeSVGFEGaussianBlurElement
  , SVGFEImageElement(SVGFEImageElement), unSVGFEImageElement, castToSVGFEImageElement, gTypeSVGFEImageElement
  , SVGFEMergeElement(SVGFEMergeElement), unSVGFEMergeElement, castToSVGFEMergeElement, gTypeSVGFEMergeElement
  , SVGFEMergeNodeElement(SVGFEMergeNodeElement), unSVGFEMergeNodeElement, castToSVGFEMergeNodeElement, gTypeSVGFEMergeNodeElement
  , SVGFEMorphologyElement(SVGFEMorphologyElement), unSVGFEMorphologyElement, castToSVGFEMorphologyElement, gTypeSVGFEMorphologyElement
  , SVGFEOffsetElement(SVGFEOffsetElement), unSVGFEOffsetElement, castToSVGFEOffsetElement, gTypeSVGFEOffsetElement
  , SVGFEPointLightElement(SVGFEPointLightElement), unSVGFEPointLightElement, castToSVGFEPointLightElement, gTypeSVGFEPointLightElement
  , SVGFESpecularLightingElement(SVGFESpecularLightingElement), unSVGFESpecularLightingElement, castToSVGFESpecularLightingElement, gTypeSVGFESpecularLightingElement
  , SVGFESpotLightElement(SVGFESpotLightElement), unSVGFESpotLightElement, castToSVGFESpotLightElement, gTypeSVGFESpotLightElement
  , SVGFETileElement(SVGFETileElement), unSVGFETileElement, castToSVGFETileElement, gTypeSVGFETileElement
  , SVGFETurbulenceElement(SVGFETurbulenceElement), unSVGFETurbulenceElement, castToSVGFETurbulenceElement, gTypeSVGFETurbulenceElement
  , SVGFilterElement(SVGFilterElement), unSVGFilterElement, castToSVGFilterElement, gTypeSVGFilterElement
  , SVGFilterPrimitiveStandardAttributes(SVGFilterPrimitiveStandardAttributes), unSVGFilterPrimitiveStandardAttributes, castToSVGFilterPrimitiveStandardAttributes, gTypeSVGFilterPrimitiveStandardAttributes
  , SVGFitToViewBox(SVGFitToViewBox), unSVGFitToViewBox, castToSVGFitToViewBox, gTypeSVGFitToViewBox
  , SVGFontElement(SVGFontElement), unSVGFontElement, castToSVGFontElement, gTypeSVGFontElement
  , SVGFontFaceElement(SVGFontFaceElement), unSVGFontFaceElement, castToSVGFontFaceElement, gTypeSVGFontFaceElement
  , SVGFontFaceFormatElement(SVGFontFaceFormatElement), unSVGFontFaceFormatElement, castToSVGFontFaceFormatElement, gTypeSVGFontFaceFormatElement
  , SVGFontFaceNameElement(SVGFontFaceNameElement), unSVGFontFaceNameElement, castToSVGFontFaceNameElement, gTypeSVGFontFaceNameElement
  , SVGFontFaceSrcElement(SVGFontFaceSrcElement), unSVGFontFaceSrcElement, castToSVGFontFaceSrcElement, gTypeSVGFontFaceSrcElement
  , SVGFontFaceUriElement(SVGFontFaceUriElement), unSVGFontFaceUriElement, castToSVGFontFaceUriElement, gTypeSVGFontFaceUriElement
  , SVGForeignObjectElement(SVGForeignObjectElement), unSVGForeignObjectElement, castToSVGForeignObjectElement, gTypeSVGForeignObjectElement
  , SVGGElement(SVGGElement), unSVGGElement, castToSVGGElement, gTypeSVGGElement
  , SVGGlyphElement(SVGGlyphElement), unSVGGlyphElement, castToSVGGlyphElement, gTypeSVGGlyphElement
  , SVGGlyphRefElement(SVGGlyphRefElement), unSVGGlyphRefElement, castToSVGGlyphRefElement, gTypeSVGGlyphRefElement
  , SVGGradientElement(SVGGradientElement), unSVGGradientElement, IsSVGGradientElement, toSVGGradientElement, castToSVGGradientElement, gTypeSVGGradientElement
  , SVGGraphicsElement(SVGGraphicsElement), unSVGGraphicsElement, IsSVGGraphicsElement, toSVGGraphicsElement, castToSVGGraphicsElement, gTypeSVGGraphicsElement
  , SVGHKernElement(SVGHKernElement), unSVGHKernElement, castToSVGHKernElement, gTypeSVGHKernElement
  , SVGImageElement(SVGImageElement), unSVGImageElement, castToSVGImageElement, gTypeSVGImageElement
  , SVGLength(SVGLength), unSVGLength, castToSVGLength, gTypeSVGLength
  , SVGLengthList(SVGLengthList), unSVGLengthList, castToSVGLengthList, gTypeSVGLengthList
  , SVGLineElement(SVGLineElement), unSVGLineElement, castToSVGLineElement, gTypeSVGLineElement
  , SVGLinearGradientElement(SVGLinearGradientElement), unSVGLinearGradientElement, castToSVGLinearGradientElement, gTypeSVGLinearGradientElement
  , SVGMPathElement(SVGMPathElement), unSVGMPathElement, castToSVGMPathElement, gTypeSVGMPathElement
  , SVGMarkerElement(SVGMarkerElement), unSVGMarkerElement, castToSVGMarkerElement, gTypeSVGMarkerElement
  , SVGMaskElement(SVGMaskElement), unSVGMaskElement, castToSVGMaskElement, gTypeSVGMaskElement
  , SVGMatrix(SVGMatrix), unSVGMatrix, castToSVGMatrix, gTypeSVGMatrix
  , SVGMetadataElement(SVGMetadataElement), unSVGMetadataElement, castToSVGMetadataElement, gTypeSVGMetadataElement
  , SVGMissingGlyphElement(SVGMissingGlyphElement), unSVGMissingGlyphElement, castToSVGMissingGlyphElement, gTypeSVGMissingGlyphElement
  , SVGNumber(SVGNumber), unSVGNumber, castToSVGNumber, gTypeSVGNumber
  , SVGNumberList(SVGNumberList), unSVGNumberList, castToSVGNumberList, gTypeSVGNumberList
  , SVGPaint(SVGPaint), unSVGPaint, castToSVGPaint, gTypeSVGPaint
  , SVGPathElement(SVGPathElement), unSVGPathElement, castToSVGPathElement, gTypeSVGPathElement
  , SVGPathSeg(SVGPathSeg), unSVGPathSeg, IsSVGPathSeg, toSVGPathSeg, castToSVGPathSeg, gTypeSVGPathSeg
  , SVGPathSegArcAbs(SVGPathSegArcAbs), unSVGPathSegArcAbs, castToSVGPathSegArcAbs, gTypeSVGPathSegArcAbs
  , SVGPathSegArcRel(SVGPathSegArcRel), unSVGPathSegArcRel, castToSVGPathSegArcRel, gTypeSVGPathSegArcRel
  , SVGPathSegClosePath(SVGPathSegClosePath), unSVGPathSegClosePath, castToSVGPathSegClosePath, gTypeSVGPathSegClosePath
  , SVGPathSegCurvetoCubicAbs(SVGPathSegCurvetoCubicAbs), unSVGPathSegCurvetoCubicAbs, castToSVGPathSegCurvetoCubicAbs, gTypeSVGPathSegCurvetoCubicAbs
  , SVGPathSegCurvetoCubicRel(SVGPathSegCurvetoCubicRel), unSVGPathSegCurvetoCubicRel, castToSVGPathSegCurvetoCubicRel, gTypeSVGPathSegCurvetoCubicRel
  , SVGPathSegCurvetoCubicSmoothAbs(SVGPathSegCurvetoCubicSmoothAbs), unSVGPathSegCurvetoCubicSmoothAbs, castToSVGPathSegCurvetoCubicSmoothAbs, gTypeSVGPathSegCurvetoCubicSmoothAbs
  , SVGPathSegCurvetoCubicSmoothRel(SVGPathSegCurvetoCubicSmoothRel), unSVGPathSegCurvetoCubicSmoothRel, castToSVGPathSegCurvetoCubicSmoothRel, gTypeSVGPathSegCurvetoCubicSmoothRel
  , SVGPathSegCurvetoQuadraticAbs(SVGPathSegCurvetoQuadraticAbs), unSVGPathSegCurvetoQuadraticAbs, castToSVGPathSegCurvetoQuadraticAbs, gTypeSVGPathSegCurvetoQuadraticAbs
  , SVGPathSegCurvetoQuadraticRel(SVGPathSegCurvetoQuadraticRel), unSVGPathSegCurvetoQuadraticRel, castToSVGPathSegCurvetoQuadraticRel, gTypeSVGPathSegCurvetoQuadraticRel
  , SVGPathSegCurvetoQuadraticSmoothAbs(SVGPathSegCurvetoQuadraticSmoothAbs), unSVGPathSegCurvetoQuadraticSmoothAbs, castToSVGPathSegCurvetoQuadraticSmoothAbs, gTypeSVGPathSegCurvetoQuadraticSmoothAbs
  , SVGPathSegCurvetoQuadraticSmoothRel(SVGPathSegCurvetoQuadraticSmoothRel), unSVGPathSegCurvetoQuadraticSmoothRel, castToSVGPathSegCurvetoQuadraticSmoothRel, gTypeSVGPathSegCurvetoQuadraticSmoothRel
  , SVGPathSegLinetoAbs(SVGPathSegLinetoAbs), unSVGPathSegLinetoAbs, castToSVGPathSegLinetoAbs, gTypeSVGPathSegLinetoAbs
  , SVGPathSegLinetoHorizontalAbs(SVGPathSegLinetoHorizontalAbs), unSVGPathSegLinetoHorizontalAbs, castToSVGPathSegLinetoHorizontalAbs, gTypeSVGPathSegLinetoHorizontalAbs
  , SVGPathSegLinetoHorizontalRel(SVGPathSegLinetoHorizontalRel), unSVGPathSegLinetoHorizontalRel, castToSVGPathSegLinetoHorizontalRel, gTypeSVGPathSegLinetoHorizontalRel
  , SVGPathSegLinetoRel(SVGPathSegLinetoRel), unSVGPathSegLinetoRel, castToSVGPathSegLinetoRel, gTypeSVGPathSegLinetoRel
  , SVGPathSegLinetoVerticalAbs(SVGPathSegLinetoVerticalAbs), unSVGPathSegLinetoVerticalAbs, castToSVGPathSegLinetoVerticalAbs, gTypeSVGPathSegLinetoVerticalAbs
  , SVGPathSegLinetoVerticalRel(SVGPathSegLinetoVerticalRel), unSVGPathSegLinetoVerticalRel, castToSVGPathSegLinetoVerticalRel, gTypeSVGPathSegLinetoVerticalRel
  , SVGPathSegList(SVGPathSegList), unSVGPathSegList, castToSVGPathSegList, gTypeSVGPathSegList
  , SVGPathSegMovetoAbs(SVGPathSegMovetoAbs), unSVGPathSegMovetoAbs, castToSVGPathSegMovetoAbs, gTypeSVGPathSegMovetoAbs
  , SVGPathSegMovetoRel(SVGPathSegMovetoRel), unSVGPathSegMovetoRel, castToSVGPathSegMovetoRel, gTypeSVGPathSegMovetoRel
  , SVGPatternElement(SVGPatternElement), unSVGPatternElement, castToSVGPatternElement, gTypeSVGPatternElement
  , SVGPoint(SVGPoint), unSVGPoint, castToSVGPoint, gTypeSVGPoint
  , SVGPointList(SVGPointList), unSVGPointList, castToSVGPointList, gTypeSVGPointList
  , SVGPolygonElement(SVGPolygonElement), unSVGPolygonElement, castToSVGPolygonElement, gTypeSVGPolygonElement
  , SVGPolylineElement(SVGPolylineElement), unSVGPolylineElement, castToSVGPolylineElement, gTypeSVGPolylineElement
  , SVGPreserveAspectRatio(SVGPreserveAspectRatio), unSVGPreserveAspectRatio, castToSVGPreserveAspectRatio, gTypeSVGPreserveAspectRatio
  , SVGRadialGradientElement(SVGRadialGradientElement), unSVGRadialGradientElement, castToSVGRadialGradientElement, gTypeSVGRadialGradientElement
  , SVGRect(SVGRect), unSVGRect, castToSVGRect, gTypeSVGRect
  , SVGRectElement(SVGRectElement), unSVGRectElement, castToSVGRectElement, gTypeSVGRectElement
  , SVGRenderingIntent(SVGRenderingIntent), unSVGRenderingIntent, castToSVGRenderingIntent, gTypeSVGRenderingIntent
  , SVGSVGElement(SVGSVGElement), unSVGSVGElement, castToSVGSVGElement, gTypeSVGSVGElement
  , SVGScriptElement(SVGScriptElement), unSVGScriptElement, castToSVGScriptElement, gTypeSVGScriptElement
  , SVGSetElement(SVGSetElement), unSVGSetElement, castToSVGSetElement, gTypeSVGSetElement
  , SVGStopElement(SVGStopElement), unSVGStopElement, castToSVGStopElement, gTypeSVGStopElement
  , SVGStringList(SVGStringList), unSVGStringList, castToSVGStringList, gTypeSVGStringList
  , SVGStyleElement(SVGStyleElement), unSVGStyleElement, castToSVGStyleElement, gTypeSVGStyleElement
  , SVGSwitchElement(SVGSwitchElement), unSVGSwitchElement, castToSVGSwitchElement, gTypeSVGSwitchElement
  , SVGSymbolElement(SVGSymbolElement), unSVGSymbolElement, castToSVGSymbolElement, gTypeSVGSymbolElement
  , SVGTRefElement(SVGTRefElement), unSVGTRefElement, castToSVGTRefElement, gTypeSVGTRefElement
  , SVGTSpanElement(SVGTSpanElement), unSVGTSpanElement, castToSVGTSpanElement, gTypeSVGTSpanElement
  , SVGTests(SVGTests), unSVGTests, castToSVGTests, gTypeSVGTests
  , SVGTextContentElement(SVGTextContentElement), unSVGTextContentElement, IsSVGTextContentElement, toSVGTextContentElement, castToSVGTextContentElement, gTypeSVGTextContentElement
  , SVGTextElement(SVGTextElement), unSVGTextElement, castToSVGTextElement, gTypeSVGTextElement
  , SVGTextPathElement(SVGTextPathElement), unSVGTextPathElement, castToSVGTextPathElement, gTypeSVGTextPathElement
  , SVGTextPositioningElement(SVGTextPositioningElement), unSVGTextPositioningElement, IsSVGTextPositioningElement, toSVGTextPositioningElement, castToSVGTextPositioningElement, gTypeSVGTextPositioningElement
  , SVGTitleElement(SVGTitleElement), unSVGTitleElement, castToSVGTitleElement, gTypeSVGTitleElement
  , SVGTransform(SVGTransform), unSVGTransform, castToSVGTransform, gTypeSVGTransform
  , SVGTransformList(SVGTransformList), unSVGTransformList, castToSVGTransformList, gTypeSVGTransformList
  , SVGURIReference(SVGURIReference), unSVGURIReference, castToSVGURIReference, gTypeSVGURIReference
  , SVGUnitTypes(SVGUnitTypes), unSVGUnitTypes, castToSVGUnitTypes, gTypeSVGUnitTypes
  , SVGUseElement(SVGUseElement), unSVGUseElement, castToSVGUseElement, gTypeSVGUseElement
  , SVGVKernElement(SVGVKernElement), unSVGVKernElement, castToSVGVKernElement, gTypeSVGVKernElement
  , SVGViewElement(SVGViewElement), unSVGViewElement, castToSVGViewElement, gTypeSVGViewElement
  , SVGViewSpec(SVGViewSpec), unSVGViewSpec, castToSVGViewSpec, gTypeSVGViewSpec
  , SVGZoomAndPan(SVGZoomAndPan), unSVGZoomAndPan, castToSVGZoomAndPan, gTypeSVGZoomAndPan
  , SVGZoomEvent(SVGZoomEvent), unSVGZoomEvent, castToSVGZoomEvent, gTypeSVGZoomEvent
  , Screen(Screen), unScreen, castToScreen, gTypeScreen
  , ScriptProcessorNode(ScriptProcessorNode), unScriptProcessorNode, castToScriptProcessorNode, gTypeScriptProcessorNode
  , ScriptProfile(ScriptProfile), unScriptProfile, castToScriptProfile, gTypeScriptProfile
  , ScriptProfileNode(ScriptProfileNode), unScriptProfileNode, castToScriptProfileNode, gTypeScriptProfileNode
  , SecurityPolicy(SecurityPolicy), unSecurityPolicy, castToSecurityPolicy, gTypeSecurityPolicy
  , SecurityPolicyViolationEvent(SecurityPolicyViolationEvent), unSecurityPolicyViolationEvent, castToSecurityPolicyViolationEvent, gTypeSecurityPolicyViolationEvent
  , Selection(Selection), unSelection, castToSelection, gTypeSelection
  , SourceBuffer(SourceBuffer), unSourceBuffer, castToSourceBuffer, gTypeSourceBuffer
  , SourceBufferList(SourceBufferList), unSourceBufferList, castToSourceBufferList, gTypeSourceBufferList
  , SourceInfo(SourceInfo), unSourceInfo, castToSourceInfo, gTypeSourceInfo
  , SpeechSynthesis(SpeechSynthesis), unSpeechSynthesis, castToSpeechSynthesis, gTypeSpeechSynthesis
  , SpeechSynthesisEvent(SpeechSynthesisEvent), unSpeechSynthesisEvent, castToSpeechSynthesisEvent, gTypeSpeechSynthesisEvent
  , SpeechSynthesisUtterance(SpeechSynthesisUtterance), unSpeechSynthesisUtterance, castToSpeechSynthesisUtterance, gTypeSpeechSynthesisUtterance
  , SpeechSynthesisVoice(SpeechSynthesisVoice), unSpeechSynthesisVoice, castToSpeechSynthesisVoice, gTypeSpeechSynthesisVoice
  , Storage(Storage), unStorage, castToStorage, gTypeStorage
  , StorageEvent(StorageEvent), unStorageEvent, castToStorageEvent, gTypeStorageEvent
  , StorageInfo(StorageInfo), unStorageInfo, castToStorageInfo, gTypeStorageInfo
  , StorageQuota(StorageQuota), unStorageQuota, castToStorageQuota, gTypeStorageQuota
  , StyleMedia(StyleMedia), unStyleMedia, castToStyleMedia, gTypeStyleMedia
  , StyleSheet(StyleSheet), unStyleSheet, IsStyleSheet, toStyleSheet, castToStyleSheet, gTypeStyleSheet
  , StyleSheetList(StyleSheetList), unStyleSheetList, castToStyleSheetList, gTypeStyleSheetList
  , SubtleCrypto(SubtleCrypto), unSubtleCrypto, castToSubtleCrypto, gTypeSubtleCrypto
  , Text(Text), unText, IsText, toText, castToText, gTypeText
  , TextEvent(TextEvent), unTextEvent, castToTextEvent, gTypeTextEvent
  , TextMetrics(TextMetrics), unTextMetrics, castToTextMetrics, gTypeTextMetrics
  , TextTrack(TextTrack), unTextTrack, castToTextTrack, gTypeTextTrack
  , TextTrackCue(TextTrackCue), unTextTrackCue, IsTextTrackCue, toTextTrackCue, castToTextTrackCue, gTypeTextTrackCue
  , TextTrackCueList(TextTrackCueList), unTextTrackCueList, castToTextTrackCueList, gTypeTextTrackCueList
  , TextTrackList(TextTrackList), unTextTrackList, castToTextTrackList, gTypeTextTrackList
  , TimeRanges(TimeRanges), unTimeRanges, castToTimeRanges, gTypeTimeRanges
  , Touch(Touch), unTouch, castToTouch, gTypeTouch
  , TouchEvent(TouchEvent), unTouchEvent, castToTouchEvent, gTypeTouchEvent
  , TouchList(TouchList), unTouchList, castToTouchList, gTypeTouchList
  , TrackEvent(TrackEvent), unTrackEvent, castToTrackEvent, gTypeTrackEvent
  , TransitionEvent(TransitionEvent), unTransitionEvent, castToTransitionEvent, gTypeTransitionEvent
  , TreeWalker(TreeWalker), unTreeWalker, castToTreeWalker, gTypeTreeWalker
  , TypeConversions(TypeConversions), unTypeConversions, castToTypeConversions, gTypeTypeConversions
  , UIEvent(UIEvent), unUIEvent, IsUIEvent, toUIEvent, castToUIEvent, gTypeUIEvent
  , UIRequestEvent(UIRequestEvent), unUIRequestEvent, castToUIRequestEvent, gTypeUIRequestEvent
  , URL(URL), unURL, castToURL, gTypeURL
  , URLUtils(URLUtils), unURLUtils, castToURLUtils, gTypeURLUtils
  , UserMessageHandler(UserMessageHandler), unUserMessageHandler, castToUserMessageHandler, gTypeUserMessageHandler
  , UserMessageHandlersNamespace(UserMessageHandlersNamespace), unUserMessageHandlersNamespace, castToUserMessageHandlersNamespace, gTypeUserMessageHandlersNamespace
  , VTTCue(VTTCue), unVTTCue, castToVTTCue, gTypeVTTCue
  , VTTRegion(VTTRegion), unVTTRegion, castToVTTRegion, gTypeVTTRegion
  , VTTRegionList(VTTRegionList), unVTTRegionList, castToVTTRegionList, gTypeVTTRegionList
  , ValidityState(ValidityState), unValidityState, castToValidityState, gTypeValidityState
  , VideoPlaybackQuality(VideoPlaybackQuality), unVideoPlaybackQuality, castToVideoPlaybackQuality, gTypeVideoPlaybackQuality
  , VideoStreamTrack(VideoStreamTrack), unVideoStreamTrack, castToVideoStreamTrack, gTypeVideoStreamTrack
  , VideoTrack(VideoTrack), unVideoTrack, castToVideoTrack, gTypeVideoTrack
  , VideoTrackList(VideoTrackList), unVideoTrackList, castToVideoTrackList, gTypeVideoTrackList
  , WaveShaperNode(WaveShaperNode), unWaveShaperNode, castToWaveShaperNode, gTypeWaveShaperNode
  , WebGL2RenderingContext(WebGL2RenderingContext), unWebGL2RenderingContext, castToWebGL2RenderingContext, gTypeWebGL2RenderingContext
  , WebGLActiveInfo(WebGLActiveInfo), unWebGLActiveInfo, castToWebGLActiveInfo, gTypeWebGLActiveInfo
  , WebGLBuffer(WebGLBuffer), unWebGLBuffer, castToWebGLBuffer, gTypeWebGLBuffer
  , WebGLCompressedTextureATC(WebGLCompressedTextureATC), unWebGLCompressedTextureATC, castToWebGLCompressedTextureATC, gTypeWebGLCompressedTextureATC
  , WebGLCompressedTexturePVRTC(WebGLCompressedTexturePVRTC), unWebGLCompressedTexturePVRTC, castToWebGLCompressedTexturePVRTC, gTypeWebGLCompressedTexturePVRTC
  , WebGLCompressedTextureS3TC(WebGLCompressedTextureS3TC), unWebGLCompressedTextureS3TC, castToWebGLCompressedTextureS3TC, gTypeWebGLCompressedTextureS3TC
  , WebGLContextAttributes(WebGLContextAttributes), unWebGLContextAttributes, castToWebGLContextAttributes, gTypeWebGLContextAttributes
  , WebGLContextEvent(WebGLContextEvent), unWebGLContextEvent, castToWebGLContextEvent, gTypeWebGLContextEvent
  , WebGLDebugRendererInfo(WebGLDebugRendererInfo), unWebGLDebugRendererInfo, castToWebGLDebugRendererInfo, gTypeWebGLDebugRendererInfo
  , WebGLDebugShaders(WebGLDebugShaders), unWebGLDebugShaders, castToWebGLDebugShaders, gTypeWebGLDebugShaders
  , WebGLDepthTexture(WebGLDepthTexture), unWebGLDepthTexture, castToWebGLDepthTexture, gTypeWebGLDepthTexture
  , WebGLDrawBuffers(WebGLDrawBuffers), unWebGLDrawBuffers, castToWebGLDrawBuffers, gTypeWebGLDrawBuffers
  , WebGLFramebuffer(WebGLFramebuffer), unWebGLFramebuffer, castToWebGLFramebuffer, gTypeWebGLFramebuffer
  , WebGLLoseContext(WebGLLoseContext), unWebGLLoseContext, castToWebGLLoseContext, gTypeWebGLLoseContext
  , WebGLProgram(WebGLProgram), unWebGLProgram, castToWebGLProgram, gTypeWebGLProgram
  , WebGLQuery(WebGLQuery), unWebGLQuery, castToWebGLQuery, gTypeWebGLQuery
  , WebGLRenderbuffer(WebGLRenderbuffer), unWebGLRenderbuffer, castToWebGLRenderbuffer, gTypeWebGLRenderbuffer
  , WebGLRenderingContext(WebGLRenderingContext), unWebGLRenderingContext, castToWebGLRenderingContext, gTypeWebGLRenderingContext
  , WebGLRenderingContextBase(WebGLRenderingContextBase), unWebGLRenderingContextBase, IsWebGLRenderingContextBase, toWebGLRenderingContextBase, castToWebGLRenderingContextBase, gTypeWebGLRenderingContextBase
  , WebGLSampler(WebGLSampler), unWebGLSampler, castToWebGLSampler, gTypeWebGLSampler
  , WebGLShader(WebGLShader), unWebGLShader, castToWebGLShader, gTypeWebGLShader
  , WebGLShaderPrecisionFormat(WebGLShaderPrecisionFormat), unWebGLShaderPrecisionFormat, castToWebGLShaderPrecisionFormat, gTypeWebGLShaderPrecisionFormat
  , WebGLSync(WebGLSync), unWebGLSync, castToWebGLSync, gTypeWebGLSync
  , WebGLTexture(WebGLTexture), unWebGLTexture, castToWebGLTexture, gTypeWebGLTexture
  , WebGLTransformFeedback(WebGLTransformFeedback), unWebGLTransformFeedback, castToWebGLTransformFeedback, gTypeWebGLTransformFeedback
  , WebGLUniformLocation(WebGLUniformLocation), unWebGLUniformLocation, castToWebGLUniformLocation, gTypeWebGLUniformLocation
  , WebGLVertexArrayObject(WebGLVertexArrayObject), unWebGLVertexArrayObject, castToWebGLVertexArrayObject, gTypeWebGLVertexArrayObject
  , WebGLVertexArrayObjectOES(WebGLVertexArrayObjectOES), unWebGLVertexArrayObjectOES, castToWebGLVertexArrayObjectOES, gTypeWebGLVertexArrayObjectOES
  , WebKitAnimationEvent(WebKitAnimationEvent), unWebKitAnimationEvent, castToWebKitAnimationEvent, gTypeWebKitAnimationEvent
  , WebKitCSSFilterValue(WebKitCSSFilterValue), unWebKitCSSFilterValue, castToWebKitCSSFilterValue, gTypeWebKitCSSFilterValue
  , WebKitCSSMatrix(WebKitCSSMatrix), unWebKitCSSMatrix, castToWebKitCSSMatrix, gTypeWebKitCSSMatrix
  , WebKitCSSRegionRule(WebKitCSSRegionRule), unWebKitCSSRegionRule, castToWebKitCSSRegionRule, gTypeWebKitCSSRegionRule
  , WebKitCSSTransformValue(WebKitCSSTransformValue), unWebKitCSSTransformValue, castToWebKitCSSTransformValue, gTypeWebKitCSSTransformValue
  , WebKitCSSViewportRule(WebKitCSSViewportRule), unWebKitCSSViewportRule, castToWebKitCSSViewportRule, gTypeWebKitCSSViewportRule
  , WebKitNamedFlow(WebKitNamedFlow), unWebKitNamedFlow, castToWebKitNamedFlow, gTypeWebKitNamedFlow
  , WebKitNamespace(WebKitNamespace), unWebKitNamespace, castToWebKitNamespace, gTypeWebKitNamespace
  , WebKitPlaybackTargetAvailabilityEvent(WebKitPlaybackTargetAvailabilityEvent), unWebKitPlaybackTargetAvailabilityEvent, castToWebKitPlaybackTargetAvailabilityEvent, gTypeWebKitPlaybackTargetAvailabilityEvent
  , WebKitPoint(WebKitPoint), unWebKitPoint, castToWebKitPoint, gTypeWebKitPoint
  , WebKitTransitionEvent(WebKitTransitionEvent), unWebKitTransitionEvent, castToWebKitTransitionEvent, gTypeWebKitTransitionEvent
  , WebSocket(WebSocket), unWebSocket, castToWebSocket, gTypeWebSocket
  , WheelEvent(WheelEvent), unWheelEvent, castToWheelEvent, gTypeWheelEvent
  , Window(Window), unWindow, castToWindow, gTypeWindow
  , WindowBase64(WindowBase64), unWindowBase64, castToWindowBase64, gTypeWindowBase64
  , WindowTimers(WindowTimers), unWindowTimers, castToWindowTimers, gTypeWindowTimers
  , Worker(Worker), unWorker, castToWorker, gTypeWorker
  , WorkerGlobalScope(WorkerGlobalScope), unWorkerGlobalScope, IsWorkerGlobalScope, toWorkerGlobalScope, castToWorkerGlobalScope, gTypeWorkerGlobalScope
  , WorkerLocation(WorkerLocation), unWorkerLocation, castToWorkerLocation, gTypeWorkerLocation
  , WorkerNavigator(WorkerNavigator), unWorkerNavigator, castToWorkerNavigator, gTypeWorkerNavigator
  , XMLHttpRequest(XMLHttpRequest), unXMLHttpRequest, castToXMLHttpRequest, gTypeXMLHttpRequest
  , XMLHttpRequestProgressEvent(XMLHttpRequestProgressEvent), unXMLHttpRequestProgressEvent, castToXMLHttpRequestProgressEvent, gTypeXMLHttpRequestProgressEvent
  , XMLHttpRequestUpload(XMLHttpRequestUpload), unXMLHttpRequestUpload, castToXMLHttpRequestUpload, gTypeXMLHttpRequestUpload
  , XMLSerializer(XMLSerializer), unXMLSerializer, castToXMLSerializer, gTypeXMLSerializer
  , XPathEvaluator(XPathEvaluator), unXPathEvaluator, castToXPathEvaluator, gTypeXPathEvaluator
  , XPathExpression(XPathExpression), unXPathExpression, castToXPathExpression, gTypeXPathExpression
  , XPathNSResolver(XPathNSResolver), unXPathNSResolver, castToXPathNSResolver, gTypeXPathNSResolver
  , XPathResult(XPathResult), unXPathResult, castToXPathResult, gTypeXPathResult
  , XSLTProcessor(XSLTProcessor), unXSLTProcessor, castToXSLTProcessor, gTypeXSLTProcessor
#else
    propagateGError, GType(..), DOMString(..), ToDOMString(..), FromDOMString(..)
  , FocusEvent
  , TouchEvent
  , module Graphics.UI.Gtk.WebKit.Types
  , IsGObject

  , IsApplicationCache
  , IsAttr
#ifndef USE_OLD_WEBKIT
  , IsAudioTrack
#endif
#ifndef USE_OLD_WEBKIT
  , IsAudioTrackList
#endif
#ifndef USE_OLD_WEBKIT
  , IsBarProp
#endif
#ifndef USE_OLD_WEBKIT
  , IsBatteryManager
#endif
  , IsBlob
  , IsCDATASection
#ifndef USE_OLD_WEBKIT
  , IsCSS
#endif
  , IsCSSRule
  , IsCSSRuleList
  , IsCSSStyleDeclaration
  , IsCSSStyleSheet
  , IsCSSValue
  , IsCharacterData
  , IsComment
  , IsDOMImplementation
#ifndef USE_OLD_WEBKIT
  , IsDOMNamedFlowCollection
#endif
  , IsDOMSettableTokenList
  , IsDOMStringList
  , IsDOMTokenList
  , IsDocument
  , IsDocumentFragment
  , IsDocumentType
  , IsElement
  , IsEntityReference
  , IsEvent
  , IsEventTarget
  , IsFile
  , IsFileList
  , IsGeolocation
  , IsHTMLAnchorElement
  , IsHTMLAppletElement
  , IsHTMLAreaElement
  , IsHTMLAudioElement
  , IsHTMLBRElement
  , IsHTMLBaseElement
  , IsHTMLBaseFontElement
  , IsHTMLBodyElement
  , IsHTMLButtonElement
  , IsHTMLCanvasElement
  , IsHTMLCollection
  , IsHTMLDListElement
  , IsHTMLDetailsElement
  , IsHTMLDirectoryElement
  , IsHTMLDivElement
  , IsHTMLDocument
  , IsHTMLElement
  , IsHTMLEmbedElement
  , IsHTMLFieldSetElement
  , IsHTMLFontElement
  , IsHTMLFormElement
  , IsHTMLFrameElement
  , IsHTMLFrameSetElement
  , IsHTMLHRElement
  , IsHTMLHeadElement
  , IsHTMLHeadingElement
  , IsHTMLHtmlElement
  , IsHTMLIFrameElement
  , IsHTMLImageElement
  , IsHTMLInputElement
  , IsHTMLKeygenElement
  , IsHTMLLIElement
  , IsHTMLLabelElement
  , IsHTMLLegendElement
  , IsHTMLLinkElement
  , IsHTMLMapElement
  , IsHTMLMarqueeElement
  , IsHTMLMediaElement
  , IsHTMLMenuElement
  , IsHTMLMetaElement
  , IsHTMLModElement
  , IsHTMLOListElement
  , IsHTMLObjectElement
  , IsHTMLOptGroupElement
  , IsHTMLOptionElement
  , IsHTMLOptionsCollection
  , IsHTMLParagraphElement
  , IsHTMLParamElement
  , IsHTMLPreElement
  , IsHTMLQuoteElement
  , IsHTMLScriptElement
  , IsHTMLSelectElement
  , IsHTMLStyleElement
  , IsHTMLTableCaptionElement
  , IsHTMLTableCellElement
  , IsHTMLTableColElement
  , IsHTMLTableElement
  , IsHTMLTableRowElement
  , IsHTMLTableSectionElement
  , IsHTMLTextAreaElement
  , IsHTMLTitleElement
  , IsHTMLUListElement
  , IsHTMLVideoElement
  , IsHistory
#ifndef USE_OLD_WEBKIT
  , IsKeyboardEvent
#endif
  , IsLocation
  , IsMediaError
  , IsMediaList
  , IsMediaQueryList
  , IsMessagePort
  , IsMimeType
  , IsMimeTypeArray
  , IsMouseEvent
  , IsNamedNodeMap
  , IsNavigator
  , IsNode
  , IsNodeFilter
  , IsNodeIterator
  , IsNodeList
#ifndef USE_OLD_WEBKIT
  , IsPerformance
#endif
#ifndef USE_OLD_WEBKIT
  , IsPerformanceNavigation
#endif
#ifndef USE_OLD_WEBKIT
  , IsPerformanceTiming
#endif
  , IsPlugin
  , IsPluginArray
  , IsProcessingInstruction
  , IsRange
  , IsScreen
#ifndef USE_OLD_WEBKIT
  , IsSecurityPolicy
#endif
  , IsSelection
  , IsStorage
#ifndef USE_OLD_WEBKIT
  , IsStorageInfo
#endif
#ifndef USE_OLD_WEBKIT
  , IsStorageQuota
#endif
  , IsStyleMedia
  , IsStyleSheet
  , IsStyleSheetList
  , IsText
#ifndef USE_OLD_WEBKIT
  , IsTextTrack
#endif
#ifndef USE_OLD_WEBKIT
  , IsTextTrackCue
#endif
#ifndef USE_OLD_WEBKIT
  , IsTextTrackCueList
#endif
#ifndef USE_OLD_WEBKIT
  , IsTextTrackList
#endif
  , IsTimeRanges
#ifndef USE_OLD_WEBKIT
  , IsTouch
#endif
  , IsTreeWalker
  , IsUIEvent
  , IsValidityState
#ifndef USE_OLD_WEBKIT
  , IsVideoTrack
#endif
#ifndef USE_OLD_WEBKIT
  , IsVideoTrackList
#endif
  , IsWebKitNamedFlow
  , IsWebKitPoint
#ifndef USE_OLD_WEBKIT
  , IsWheelEvent
#endif
  , IsWindow
  , IsXPathExpression
  , IsXPathNSResolver
  , IsXPathResult
-- AUTO GENERATION ENDS HERE
#endif
  ) where

import Control.Applicative ((<$>))
import qualified Data.Text as T (Text)
#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
import qualified Data.Text.Lazy as LT (Text)
import Data.JSString (pack, unpack)
import Data.JSString.Text (textToJSString, textFromJSString, lazyTextToJSString, lazyTextFromJSString)
import GHCJS.Types (JSRef(..), nullRef, isNull, isUndefined, JSString(..))
import GHCJS.Marshal (ToJSRef(..), FromJSRef(..))
import GHCJS.Marshal.Pure (PToJSRef(..), PFromJSRef(..))
import GHCJS.Nullable (Nullable(..), nullableToMaybe, maybeToNullable)
import GHCJS.Foreign.Callback.Internal (Callback(..))
import Control.Monad.IO.Class (MonadIO(..))
#else
import Data.Maybe (isNothing)
import Foreign.C (CString)
import Graphics.UI.Gtk.WebKit.Types
import System.Glib (propagateGError, GType(..))
import System.Glib.UTFString
       (readUTFString, GlibString(..))
#endif
import Data.Int (Int8, Int16, Int32, Int64)
import Data.Word (Word8, Word16, Word32, Word64)

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
maybeJSNullOrUndefined :: JSRef -> Maybe JSRef
maybeJSNullOrUndefined r | isNull r || isUndefined r = Nothing
maybeJSNullOrUndefined r = Just r


propagateGError = id
castRef = id

newtype GType = GType JSRef

foreign import javascript unsafe
  "$1===$2" js_eq :: JSRef -> JSRef -> Bool

#ifdef ghcjs_HOST_OS
foreign import javascript unsafe "h$isInstanceOf $1 $2"
    typeInstanceIsA' :: JSRef -> JSRef -> Bool
#else
typeInstanceIsA' :: JSRef -> JSRef -> Bool
typeInstanceIsA' = error "typeInstanceIsA': only available in JavaScript"
#endif

typeInstanceIsA o (GType t) = typeInstanceIsA' o t

-- The usage of foreignPtrToPtr should be safe as the evaluation will only be
-- forced if the object is used afterwards
--
castTo :: (IsGObject obj, IsGObject obj') => GType -> String
                                                -> (obj -> obj')
castTo gtype objTypeName obj =
  case toGObject obj of
    gobj@(GObject objRef)
      | typeInstanceIsA objRef gtype
                  -> unsafeCastGObject gobj
      | otherwise -> error $ "Cannot cast object to " ++ objTypeName

-- | Determine if this is an instance of a particular type
--
isA :: IsGObject o => o -> GType -> Bool
isA obj = typeInstanceIsA (unGObject $ toGObject obj)

newtype GObject = GObject { unGObject :: JSRef }

class (ToJSRef o, FromJSRef o) => IsGObject o where
  -- | Safe upcast.
  toGObject         :: o -> GObject
  -- | Unchecked downcast.
  unsafeCastGObject :: GObject -> o

instance PToJSRef GObject where
  pToJSRef = unGObject
  {-# INLINE pToJSRef #-}

instance PFromJSRef GObject where
  pFromJSRef = GObject
  {-# INLINE pFromJSRef #-}

instance ToJSRef GObject where
  toJSRef = return . unGObject
  {-# INLINE toJSRef #-}

instance FromJSRef GObject where
  fromJSRef = return . fmap GObject . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

--instance IsGObject o => PToJSRef o where
--  pToJSRef = castRef . unGObject . toGObject
--  {-# INLINE pToJSRef #-}
--
--instance IsGObject o => PFromJSRef o where
--  pFromJSRef = unsafeCastGObject . GObject . castRef
--  {-# INLINE pFromJSRef #-}
--
--instance IsGObject o => ToJSRef o where
--  toJSRef = return . castRef . unGObject . toGObject
--  {-# INLINE toJSRef #-}
--
--instance IsGObject o => FromJSRef o where
--  fromJSRef = return . fmap (unsafeCastGObject . GObject . castRef) . maybeJSNullOrUndefined
--  {-# INLINE fromJSRef #-}

instance IsGObject GObject where
  toGObject = id
  {-# INLINE toGObject #-}
  unsafeCastGObject = id
  {-# INLINE unsafeCastGObject #-}

castToGObject :: IsGObject obj => obj -> obj
castToGObject = id

#ifdef ghcjs_HOST_OS
foreign import javascript unsafe "object" gTypeGObject :: GType
#else
gTypeGObject = error "gTypeGObject: only available in JavaScript"
#endif

foreign import javascript unsafe "$1[\"toString\"]()" js_objectToString :: GObject -> IO JSString

objectToString :: (MonadIO m, IsGObject self, FromJSString result) => self -> m result
objectToString self = liftIO (fromJSString <$> (js_objectToString (toGObject self)))

#ifdef ghcjs_HOST_OS
-- | Fastest string type to use when you just
--   want to take a string from the DOM then
--   give it back as is.
type DOMString = JSString

class (PToJSRef a, ToJSRef a) => ToJSString a
class (PFromJSRef a, FromJSRef a) => FromJSString a

toJSString :: ToJSString a => a -> JSString
toJSString = pFromJSRef . pToJSRef
{-# INLINE toJSString #-}

fromJSString :: FromJSString a => JSString -> a
fromJSString = pFromJSRef . castRef . pToJSRef
{-# INLINE fromJSString #-}

toMaybeJSString :: ToJSString a => Maybe a -> Nullable JSString
toMaybeJSString = Nullable . pToJSRef
{-# INLINE toMaybeJSString #-}

fromMaybeJSString :: FromJSString a => Nullable JSString -> Maybe a
fromMaybeJSString (Nullable r) = pFromJSRef r
{-# INLINE fromMaybeJSString #-}

instance ToJSString   [Char]
instance FromJSString [Char]
instance ToJSString   T.Text
instance FromJSString T.Text
instance ToJSString   JSString
instance FromJSString JSString

type ToDOMString s = ToJSString s
type FromDOMString s = FromJSString s
#endif

#else
type IsGObject o = GObjectClass o

-- | Fastest string type to use when you just
--   want to take a string from the DOM then
--   give it back as is.
type DOMString = T.Text

type ToDOMString s = GlibString s
type FromDOMString s = GlibString s

type FocusEvent = UIEvent
type TouchEvent = UIEvent
#endif

type IsDOMString s = (ToDOMString s, FromDOMString s)

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- Callbacks
newtype AudioBufferCallback = AudioBufferCallback (Callback (JSRef -> IO ()))
instance PToJSRef AudioBufferCallback where pToJSRef (AudioBufferCallback (Callback r)) = r
newtype DatabaseCallback = DatabaseCallback (Callback (JSRef -> IO ()))
instance PToJSRef DatabaseCallback where pToJSRef (DatabaseCallback (Callback r)) = r
newtype MediaQueryListListener = MediaQueryListListener (Callback (JSRef -> IO ()))
instance PToJSRef MediaQueryListListener where pToJSRef (MediaQueryListListener (Callback r)) = r
newtype MediaStreamTrackSourcesCallback = MediaStreamTrackSourcesCallback (Callback (JSRef -> IO ()))
instance PToJSRef MediaStreamTrackSourcesCallback where pToJSRef (MediaStreamTrackSourcesCallback (Callback r)) = r
newtype NavigatorUserMediaErrorCallback = NavigatorUserMediaErrorCallback (Callback (JSRef -> IO ()))
instance PToJSRef NavigatorUserMediaErrorCallback where pToJSRef (NavigatorUserMediaErrorCallback (Callback r)) = r
newtype NavigatorUserMediaSuccessCallback = NavigatorUserMediaSuccessCallback (Callback (JSRef -> IO ()))
instance PToJSRef NavigatorUserMediaSuccessCallback where pToJSRef (NavigatorUserMediaSuccessCallback (Callback r)) = r
newtype NotificationPermissionCallback permissions = NotificationPermissionCallback (Callback (JSRef -> IO ()))
instance PToJSRef (NotificationPermissionCallback permissions) where pToJSRef (NotificationPermissionCallback (Callback r)) = r
newtype PositionCallback = PositionCallback (Callback (JSRef -> IO ()))
instance PToJSRef PositionCallback where pToJSRef (PositionCallback (Callback r)) = r
newtype PositionErrorCallback = PositionErrorCallback (Callback (JSRef -> IO ()))
instance PToJSRef PositionErrorCallback where pToJSRef (PositionErrorCallback (Callback r)) = r
newtype RequestAnimationFrameCallback = RequestAnimationFrameCallback (Callback (JSRef -> IO ()))
instance PToJSRef RequestAnimationFrameCallback where pToJSRef (RequestAnimationFrameCallback (Callback r)) = r
newtype RTCPeerConnectionErrorCallback = RTCPeerConnectionErrorCallback (Callback (JSRef -> IO ()))
instance PToJSRef RTCPeerConnectionErrorCallback where pToJSRef (RTCPeerConnectionErrorCallback (Callback r)) = r
newtype RTCSessionDescriptionCallback = RTCSessionDescriptionCallback (Callback (JSRef -> IO ()))
instance PToJSRef RTCSessionDescriptionCallback where pToJSRef (RTCSessionDescriptionCallback (Callback r)) = r
newtype RTCStatsCallback = RTCStatsCallback (Callback (JSRef -> IO ()))
instance PToJSRef RTCStatsCallback where pToJSRef (RTCStatsCallback (Callback r)) = r
newtype SQLStatementCallback = SQLStatementCallback (Callback (JSRef -> JSRef -> IO ()))
instance PToJSRef SQLStatementCallback where pToJSRef (SQLStatementCallback (Callback r)) = r
newtype SQLStatementErrorCallback = SQLStatementErrorCallback (Callback (JSRef -> JSRef -> IO ()))
instance PToJSRef SQLStatementErrorCallback where pToJSRef (SQLStatementErrorCallback (Callback r)) = r
newtype SQLTransactionCallback = SQLTransactionCallback (Callback (JSRef -> IO ()))
instance PToJSRef SQLTransactionCallback where pToJSRef (SQLTransactionCallback (Callback r)) = r
newtype SQLTransactionErrorCallback = SQLTransactionErrorCallback (Callback (JSRef -> IO ()))
instance PToJSRef SQLTransactionErrorCallback where pToJSRef (SQLTransactionErrorCallback (Callback r)) = r
newtype StorageErrorCallback = StorageErrorCallback (Callback (JSRef -> IO ()))
instance PToJSRef StorageErrorCallback where pToJSRef (StorageErrorCallback (Callback r)) = r
newtype StorageQuotaCallback = StorageQuotaCallback (Callback (JSRef -> IO ()))
instance PToJSRef StorageQuotaCallback where pToJSRef (StorageQuotaCallback (Callback r)) = r
newtype StorageUsageCallback = StorageUsageCallback (Callback (JSRef -> JSRef -> IO ()))
instance PToJSRef StorageUsageCallback where pToJSRef (StorageUsageCallback (Callback r)) = r
newtype StringCallback s = StringCallback (Callback (JSRef -> IO ()))
instance PToJSRef (StringCallback s) where pToJSRef (StringCallback (Callback r)) = r
newtype VoidCallback = VoidCallback (Callback (IO ()))
instance PToJSRef VoidCallback where pToJSRef (VoidCallback (Callback r)) = r
#endif

-- Custom types
#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype SerializedScriptValue = SerializedScriptValue { unSerializedScriptValue :: JSRef }

instance Eq SerializedScriptValue where
  (SerializedScriptValue a) == (SerializedScriptValue b) = js_eq a b

instance PToJSRef SerializedScriptValue where
  pToJSRef = unSerializedScriptValue
  {-# INLINE pToJSRef #-}

instance PFromJSRef SerializedScriptValue where
  pFromJSRef = SerializedScriptValue
  {-# INLINE pFromJSRef #-}

instance ToJSRef SerializedScriptValue where
  toJSRef = return . unSerializedScriptValue
  {-# INLINE toJSRef #-}

instance FromJSRef SerializedScriptValue where
  fromJSRef = return . fmap SerializedScriptValue . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsSerializedScriptValue o
toSerializedScriptValue :: IsSerializedScriptValue o => o -> SerializedScriptValue
toSerializedScriptValue = unsafeCastGObject . toGObject

instance IsSerializedScriptValue SerializedScriptValue
instance IsGObject SerializedScriptValue where
  toGObject = GObject . castRef . unSerializedScriptValue
  unsafeCastGObject = SerializedScriptValue . castRef . unGObject
-- TODO add more IsSerializedScriptValue instances
#else
-- TODO work out how we can support SerializedScriptValue in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype PositionOptions = PositionOptions { unPositionOptions :: JSRef }

instance Eq PositionOptions where
  (PositionOptions a) == (PositionOptions b) = js_eq a b

instance PToJSRef PositionOptions where
  pToJSRef = unPositionOptions
  {-# INLINE pToJSRef #-}

instance PFromJSRef PositionOptions where
  pFromJSRef = PositionOptions
  {-# INLINE pFromJSRef #-}

instance ToJSRef PositionOptions where
  toJSRef = return . unPositionOptions
  {-# INLINE toJSRef #-}

instance FromJSRef PositionOptions where
  fromJSRef = return . fmap PositionOptions . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsPositionOptions o
toPositionOptions :: IsPositionOptions o => o -> PositionOptions
toPositionOptions = unsafeCastGObject . toGObject

instance IsPositionOptions PositionOptions
instance IsGObject PositionOptions where
  toGObject = GObject . castRef . unPositionOptions
  unsafeCastGObject = PositionOptions . castRef . unGObject
-- TODO add more IsPositionOptions instances
#else
-- TODO work out how we can support PositionOptions in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype Dictionary = Dictionary { unDictionary :: JSRef }

instance Eq Dictionary where
  (Dictionary a) == (Dictionary b) = js_eq a b

instance PToJSRef Dictionary where
  pToJSRef = unDictionary
  {-# INLINE pToJSRef #-}

instance PFromJSRef Dictionary where
  pFromJSRef = Dictionary
  {-# INLINE pFromJSRef #-}

instance ToJSRef Dictionary where
  toJSRef = return . unDictionary
  {-# INLINE toJSRef #-}

instance FromJSRef Dictionary where
  fromJSRef = return . fmap Dictionary . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsDictionary o
toDictionary :: IsDictionary o => o -> Dictionary
toDictionary = unsafeCastGObject . toGObject

instance IsDictionary Dictionary
instance IsGObject Dictionary where
  toGObject = GObject . castRef . unDictionary
  unsafeCastGObject = Dictionary . castRef . unGObject
-- TODO add more IsDictionary instances
#else
-- TODO work out how we can support Dictionary in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype BlobPropertyBag = BlobPropertyBag { unBlobPropertyBag :: JSRef }

instance Eq BlobPropertyBag where
  (BlobPropertyBag a) == (BlobPropertyBag b) = js_eq a b

instance PToJSRef BlobPropertyBag where
  pToJSRef = unBlobPropertyBag
  {-# INLINE pToJSRef #-}

instance PFromJSRef BlobPropertyBag where
  pFromJSRef = BlobPropertyBag
  {-# INLINE pFromJSRef #-}

instance ToJSRef BlobPropertyBag where
  toJSRef = return . unBlobPropertyBag
  {-# INLINE toJSRef #-}

instance FromJSRef BlobPropertyBag where
  fromJSRef = return . fmap BlobPropertyBag . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsBlobPropertyBag o
toBlobPropertyBag :: IsBlobPropertyBag o => o -> BlobPropertyBag
toBlobPropertyBag = unsafeCastGObject . toGObject

instance IsBlobPropertyBag BlobPropertyBag
instance IsGObject BlobPropertyBag where
  toGObject = GObject . castRef . unBlobPropertyBag
  unsafeCastGObject = BlobPropertyBag . castRef . unGObject
-- TODO add more IsBlobPropertyBag instances
#else
-- TODO work out how we can support BlobPropertyBag in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype MutationCallback = MutationCallback { unMutationCallback :: JSRef }

instance Eq MutationCallback where
  (MutationCallback a) == (MutationCallback b) = js_eq a b

instance PToJSRef MutationCallback where
  pToJSRef = unMutationCallback
  {-# INLINE pToJSRef #-}

instance PFromJSRef MutationCallback where
  pFromJSRef = MutationCallback
  {-# INLINE pFromJSRef #-}

instance ToJSRef MutationCallback where
  toJSRef = return . unMutationCallback
  {-# INLINE toJSRef #-}

instance FromJSRef MutationCallback where
  fromJSRef = return . fmap MutationCallback . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsMutationCallback o
toMutationCallback :: IsMutationCallback o => o -> MutationCallback
toMutationCallback = unsafeCastGObject . toGObject

instance IsMutationCallback MutationCallback
instance IsGObject MutationCallback where
  toGObject = GObject . castRef . unMutationCallback
  unsafeCastGObject = MutationCallback . castRef . unGObject
-- TODO add more IsMutationCallback instances
#else
-- TODO work out how we can support MutationCallback in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype Promise = Promise { unPromise :: JSRef }

instance Eq Promise where
  (Promise a) == (Promise b) = js_eq a b

instance PToJSRef Promise where
  pToJSRef = unPromise
  {-# INLINE pToJSRef #-}

instance PFromJSRef Promise where
  pFromJSRef = Promise
  {-# INLINE pFromJSRef #-}

instance ToJSRef Promise where
  toJSRef = return . unPromise
  {-# INLINE toJSRef #-}

instance FromJSRef Promise where
  fromJSRef = return . fmap Promise . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsPromise o
toPromise :: IsPromise o => o -> Promise
toPromise = unsafeCastGObject . toGObject

instance IsPromise Promise
instance IsGObject Promise where
  toGObject = GObject . castRef . unPromise
  unsafeCastGObject = Promise . castRef . unGObject
-- TODO add more IsPromise instances

castToPromise :: IsGObject obj => obj -> Promise
castToPromise = castTo gTypePromise "Promise"

foreign import javascript unsafe "window[\"Promise\"]" gTypePromise :: GType
#else
-- TODO work out how we can support Promise in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype ArrayBuffer = ArrayBuffer { unArrayBuffer :: JSRef }

instance Eq ArrayBuffer where
  (ArrayBuffer a) == (ArrayBuffer b) = js_eq a b

instance PToJSRef ArrayBuffer where
  pToJSRef = unArrayBuffer
  {-# INLINE pToJSRef #-}

instance PFromJSRef ArrayBuffer where
  pFromJSRef = ArrayBuffer
  {-# INLINE pFromJSRef #-}

instance ToJSRef ArrayBuffer where
  toJSRef = return . unArrayBuffer
  {-# INLINE toJSRef #-}

instance FromJSRef ArrayBuffer where
  fromJSRef = return . fmap ArrayBuffer . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsArrayBuffer o
toArrayBuffer :: IsArrayBuffer o => o -> ArrayBuffer
toArrayBuffer = unsafeCastGObject . toGObject

instance IsArrayBuffer ArrayBuffer
instance IsGObject ArrayBuffer where
  toGObject = GObject . castRef . unArrayBuffer
  unsafeCastGObject = ArrayBuffer . castRef . unGObject

castToArrayBuffer :: IsGObject obj => obj -> ArrayBuffer
castToArrayBuffer = castTo gTypeArrayBuffer "ArrayBuffer"

foreign import javascript unsafe "window[\"ArrayBuffer\"]" gTypeArrayBuffer :: GType
#else
-- TODO work out how we can support ArrayBuffer in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype Float32Array = Float32Array { unFloat32Array :: JSRef }

instance Eq Float32Array where
  (Float32Array a) == (Float32Array b) = js_eq a b

instance PToJSRef Float32Array where
  pToJSRef = unFloat32Array
  {-# INLINE pToJSRef #-}

instance PFromJSRef Float32Array where
  pFromJSRef = Float32Array
  {-# INLINE pFromJSRef #-}

instance ToJSRef Float32Array where
  toJSRef = return . unFloat32Array
  {-# INLINE toJSRef #-}

instance FromJSRef Float32Array where
  fromJSRef = return . fmap Float32Array . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsFloat32Array o
toFloat32Array :: IsFloat32Array o => o -> Float32Array
toFloat32Array = unsafeCastGObject . toGObject

instance IsFloat32Array Float32Array
instance IsGObject Float32Array where
  toGObject = GObject . castRef . unFloat32Array
  unsafeCastGObject = Float32Array . castRef . unGObject
-- TODO add more IsFloat32Array instances

castToFloat32Array :: IsGObject obj => obj -> Float32Array
castToFloat32Array = castTo gTypeFloat32Array "Float32Array"

foreign import javascript unsafe "window[\"Float32Array\"]" gTypeFloat32Array :: GType
#else
-- TODO work out how we can support Float32Array in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype Float64Array = Float64Array { unFloat64Array :: JSRef }

instance Eq Float64Array where
  (Float64Array a) == (Float64Array b) = js_eq a b

instance PToJSRef Float64Array where
  pToJSRef = unFloat64Array
  {-# INLINE pToJSRef #-}

instance PFromJSRef Float64Array where
  pFromJSRef = Float64Array
  {-# INLINE pFromJSRef #-}

instance ToJSRef Float64Array where
  toJSRef = return . unFloat64Array
  {-# INLINE toJSRef #-}

instance FromJSRef Float64Array where
  fromJSRef = return . fmap Float64Array . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsFloat64Array o
toFloat64Array :: IsFloat64Array o => o -> Float64Array
toFloat64Array = unsafeCastGObject . toGObject

instance IsFloat64Array Float64Array
instance IsGObject Float64Array where
  toGObject = GObject . castRef . unFloat64Array
  unsafeCastGObject = Float64Array . castRef . unGObject
-- TODO add more IsFloat64Array instances

castToFloat64Array :: IsGObject obj => obj -> Float64Array
castToFloat64Array = castTo gTypeFloat64Array "Float64Array"

foreign import javascript unsafe "window[\"Float64Array\"]" gTypeFloat64Array :: GType
#else
-- TODO work out how we can support Float64Array in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype Uint8Array = Uint8Array { unUint8Array :: JSRef }

instance Eq Uint8Array where
  (Uint8Array a) == (Uint8Array b) = js_eq a b

instance PToJSRef Uint8Array where
  pToJSRef = unUint8Array
  {-# INLINE pToJSRef #-}

instance PFromJSRef Uint8Array where
  pFromJSRef = Uint8Array
  {-# INLINE pFromJSRef #-}

instance ToJSRef Uint8Array where
  toJSRef = return . unUint8Array
  {-# INLINE toJSRef #-}

instance FromJSRef Uint8Array where
  fromJSRef = return . fmap Uint8Array . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsUint8Array o
toUint8Array :: IsUint8Array o => o -> Uint8Array
toUint8Array = unsafeCastGObject . toGObject

instance IsUint8Array Uint8Array
instance IsGObject Uint8Array where
  toGObject = GObject . castRef . unUint8Array
  unsafeCastGObject = Uint8Array . castRef . unGObject
-- TODO add more IsUint8Array instances

castToUint8Array :: IsGObject obj => obj -> Uint8Array
castToUint8Array = castTo gTypeUint8Array "Uint8Array"

foreign import javascript unsafe "window[\"Uint8Array\"]" gTypeUint8Array :: GType
#else
-- TODO work out how we can support Uint8Array in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype Uint8ClampedArray = Uint8ClampedArray { unUint8ClampedArray :: JSRef }

instance Eq Uint8ClampedArray where
  (Uint8ClampedArray a) == (Uint8ClampedArray b) = js_eq a b

instance PToJSRef Uint8ClampedArray where
  pToJSRef = unUint8ClampedArray
  {-# INLINE pToJSRef #-}

instance PFromJSRef Uint8ClampedArray where
  pFromJSRef = Uint8ClampedArray
  {-# INLINE pFromJSRef #-}

instance ToJSRef Uint8ClampedArray where
  toJSRef = return . unUint8ClampedArray
  {-# INLINE toJSRef #-}

instance FromJSRef Uint8ClampedArray where
  fromJSRef = return . fmap Uint8ClampedArray . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsUint8ClampedArray o
toUint8ClampedArray :: IsUint8ClampedArray o => o -> Uint8ClampedArray
toUint8ClampedArray = unsafeCastGObject . toGObject

instance IsUint8ClampedArray Uint8ClampedArray
instance IsGObject Uint8ClampedArray where
  toGObject = GObject . castRef . unUint8ClampedArray
  unsafeCastGObject = Uint8ClampedArray . castRef . unGObject
-- TODO add more IsUint8ClampedArray instances

castToUint8ClampedArray :: IsGObject obj => obj -> Uint8ClampedArray
castToUint8ClampedArray = castTo gTypeUint8ClampedArray "Uint8ClampedArray"

foreign import javascript unsafe "window[\"Uint8ClampedArray\"]" gTypeUint8ClampedArray :: GType
#else
-- TODO work out how we can support Uint8ClampedArray in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype Uint16Array = Uint16Array { unUint16Array :: JSRef }

instance Eq Uint16Array where
  (Uint16Array a) == (Uint16Array b) = js_eq a b

instance PToJSRef Uint16Array where
  pToJSRef = unUint16Array
  {-# INLINE pToJSRef #-}

instance PFromJSRef Uint16Array where
  pFromJSRef = Uint16Array
  {-# INLINE pFromJSRef #-}

instance ToJSRef Uint16Array where
  toJSRef = return . unUint16Array
  {-# INLINE toJSRef #-}

instance FromJSRef Uint16Array where
  fromJSRef = return . fmap Uint16Array . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsUint16Array o
toUint16Array :: IsUint16Array o => o -> Uint16Array
toUint16Array = unsafeCastGObject . toGObject

instance IsUint16Array Uint16Array
instance IsGObject Uint16Array where
  toGObject = GObject . castRef . unUint16Array
  unsafeCastGObject = Uint16Array . castRef . unGObject
-- TODO add more IsUint16Array instances

castToUint16Array :: IsGObject obj => obj -> Uint16Array
castToUint16Array = castTo gTypeUint16Array "Uint16Array"

foreign import javascript unsafe "window[\"Uint16Array\"]" gTypeUint16Array :: GType
#else
-- TODO work out how we can support Uint16Array in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype Uint32Array = Uint32Array { unUint32Array :: JSRef }

instance Eq Uint32Array where
  (Uint32Array a) == (Uint32Array b) = js_eq a b

instance PToJSRef Uint32Array where
  pToJSRef = unUint32Array
  {-# INLINE pToJSRef #-}

instance PFromJSRef Uint32Array where
  pFromJSRef = Uint32Array
  {-# INLINE pFromJSRef #-}

instance ToJSRef Uint32Array where
  toJSRef = return . unUint32Array
  {-# INLINE toJSRef #-}

instance FromJSRef Uint32Array where
  fromJSRef = return . fmap Uint32Array . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsUint32Array o
toUint32Array :: IsUint32Array o => o -> Uint32Array
toUint32Array = unsafeCastGObject . toGObject

instance IsUint32Array Uint32Array
instance IsGObject Uint32Array where
  toGObject = GObject . castRef . unUint32Array
  unsafeCastGObject = Uint32Array . castRef . unGObject
-- TODO add more IsUint32Array instances

castToUint32Array :: IsGObject obj => obj -> Uint32Array
castToUint32Array = castTo gTypeUint32Array "Uint32Array"

foreign import javascript unsafe "window[\"Uint32Array\"]" gTypeUint32Array :: GType
#else
-- TODO work out how we can support Uint32Array in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype Int8Array = Int8Array { unInt8Array :: JSRef }

instance Eq Int8Array where
  (Int8Array a) == (Int8Array b) = js_eq a b

instance PToJSRef Int8Array where
  pToJSRef = unInt8Array
  {-# INLINE pToJSRef #-}

instance PFromJSRef Int8Array where
  pFromJSRef = Int8Array
  {-# INLINE pFromJSRef #-}

instance ToJSRef Int8Array where
  toJSRef = return . unInt8Array
  {-# INLINE toJSRef #-}

instance FromJSRef Int8Array where
  fromJSRef = return . fmap Int8Array . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsInt8Array o
toInt8Array :: IsInt8Array o => o -> Int8Array
toInt8Array = unsafeCastGObject . toGObject

instance IsInt8Array Int8Array
instance IsGObject Int8Array where
  toGObject = GObject . castRef . unInt8Array
  unsafeCastGObject = Int8Array . castRef . unGObject
-- TODO add more IsInt8Array instances

castToInt8Array :: IsGObject obj => obj -> Int8Array
castToInt8Array = castTo gTypeInt8Array "Int8Array"

foreign import javascript unsafe "window[\"Int8Array\"]" gTypeInt8Array :: GType
#else
-- TODO work out how we can support Int8Array in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype Int16Array = Int16Array { unInt16Array :: JSRef }

instance Eq Int16Array where
  (Int16Array a) == (Int16Array b) = js_eq a b

instance PToJSRef Int16Array where
  pToJSRef = unInt16Array
  {-# INLINE pToJSRef #-}

instance PFromJSRef Int16Array where
  pFromJSRef = Int16Array
  {-# INLINE pFromJSRef #-}

instance ToJSRef Int16Array where
  toJSRef = return . unInt16Array
  {-# INLINE toJSRef #-}

instance FromJSRef Int16Array where
  fromJSRef = return . fmap Int16Array . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsInt16Array o
toInt16Array :: IsInt16Array o => o -> Int16Array
toInt16Array = unsafeCastGObject . toGObject

instance IsInt16Array Int16Array
instance IsGObject Int16Array where
  toGObject = GObject . castRef . unInt16Array
  unsafeCastGObject = Int16Array . castRef . unGObject
-- TODO add more IsInt16Array instances

castToInt16Array :: IsGObject obj => obj -> Int16Array
castToInt16Array = castTo gTypeInt16Array "Int16Array"

foreign import javascript unsafe "window[\"Int16Array\"]" gTypeInt16Array :: GType
#else
-- TODO work out how we can support Int16Array in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype Int32Array = Int32Array { unInt32Array :: JSRef }

instance Eq Int32Array where
  (Int32Array a) == (Int32Array b) = js_eq a b

instance PToJSRef Int32Array where
  pToJSRef = unInt32Array
  {-# INLINE pToJSRef #-}

instance PFromJSRef Int32Array where
  pFromJSRef = Int32Array
  {-# INLINE pFromJSRef #-}

instance ToJSRef Int32Array where
  toJSRef = return . unInt32Array
  {-# INLINE toJSRef #-}

instance FromJSRef Int32Array where
  fromJSRef = return . fmap Int32Array . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsInt32Array o
toInt32Array :: IsInt32Array o => o -> Int32Array
toInt32Array = unsafeCastGObject . toGObject

instance IsInt32Array Int32Array
instance IsGObject Int32Array where
  toGObject = GObject . castRef . unInt32Array
  unsafeCastGObject = Int32Array . castRef . unGObject
-- TODO add more IsInt32Array instances

castToInt32Array :: IsGObject obj => obj -> Int32Array
castToInt32Array = castTo gTypeInt32Array "Int32Array"

foreign import javascript unsafe "window[\"Int32Array\"]" gTypeInt32Array :: GType
#else
-- TODO work out how we can support Int32Array in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype ObjectArray = ObjectArray { unObjectArray :: JSRef }

instance Eq ObjectArray where
  (ObjectArray a) == (ObjectArray b) = js_eq a b

instance PToJSRef ObjectArray where
  pToJSRef = unObjectArray
  {-# INLINE pToJSRef #-}

instance PFromJSRef ObjectArray where
  pFromJSRef = ObjectArray
  {-# INLINE pFromJSRef #-}

instance ToJSRef ObjectArray where
  toJSRef = return . unObjectArray
  {-# INLINE toJSRef #-}

instance FromJSRef ObjectArray where
  fromJSRef = return . fmap ObjectArray . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsObjectArray o
toObjectArray :: IsObjectArray o => o -> ObjectArray
toObjectArray = unsafeCastGObject . toGObject

instance IsObjectArray ObjectArray
instance IsGObject ObjectArray where
  toGObject = GObject . castRef . unObjectArray
  unsafeCastGObject = ObjectArray . castRef . unGObject
-- TODO add more IsObjectArray instances
#else
-- TODO work out how we can support ObjectArray in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype ArrayBufferView = ArrayBufferView { unArrayBufferView :: JSRef }

instance Eq ArrayBufferView where
  (ArrayBufferView a) == (ArrayBufferView b) = js_eq a b

instance PToJSRef ArrayBufferView where
  pToJSRef = unArrayBufferView
  {-# INLINE pToJSRef #-}

instance PFromJSRef ArrayBufferView where
  pFromJSRef = ArrayBufferView
  {-# INLINE pFromJSRef #-}

instance ToJSRef ArrayBufferView where
  toJSRef = return . unArrayBufferView
  {-# INLINE toJSRef #-}

instance FromJSRef ArrayBufferView where
  fromJSRef = return . fmap ArrayBufferView . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsArrayBufferView o
toArrayBufferView :: IsArrayBufferView o => o -> ArrayBufferView
toArrayBufferView = unsafeCastGObject . toGObject

instance IsArrayBufferView ArrayBufferView
instance IsGObject ArrayBufferView where
  toGObject = GObject . castRef . unArrayBufferView
  unsafeCastGObject = ArrayBufferView . castRef . unGObject
-- TODO add more IsArrayBufferView instances
#else
-- TODO work out how we can support ArrayBufferView in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype Array = Array { unArray :: JSRef }

instance Eq Array where
  (Array a) == (Array b) = js_eq a b

instance PToJSRef Array where
  pToJSRef = unArray
  {-# INLINE pToJSRef #-}

instance PFromJSRef Array where
  pFromJSRef = Array
  {-# INLINE pFromJSRef #-}

instance ToJSRef Array where
  toJSRef = return . unArray
  {-# INLINE toJSRef #-}

instance FromJSRef Array where
  fromJSRef = return . fmap Array . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsArray o
toArray :: IsArray o => o -> Array
toArray = unsafeCastGObject . toGObject

instance IsArray Array
instance IsGObject Array where
  toGObject = GObject . castRef . unArray
  unsafeCastGObject = Array . castRef . unGObject
-- TODO add more IsArray instances

castToArray :: IsGObject obj => obj -> Array
castToArray = castTo gTypeArray "Array"

foreign import javascript unsafe "window[\"Array\"]" gTypeArray :: GType
#else
-- TODO work out how we can support Array in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype Date = Date { unDate :: JSRef }

instance Eq Date where
  (Date a) == (Date b) = js_eq a b

instance PToJSRef Date where
  pToJSRef = unDate
  {-# INLINE pToJSRef #-}

instance PFromJSRef Date where
  pFromJSRef = Date
  {-# INLINE pFromJSRef #-}

instance ToJSRef Date where
  toJSRef = return . unDate
  {-# INLINE toJSRef #-}

instance FromJSRef Date where
  fromJSRef = return . fmap Date . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsDate o
toDate :: IsDate o => o -> Date
toDate = unsafeCastGObject . toGObject

instance IsDate Date
instance IsGObject Date where
  toGObject = GObject . castRef . unDate
  unsafeCastGObject = Date . castRef . unGObject
-- TODO add more IsDate instances

castToDate :: IsGObject obj => obj -> Date
castToDate = castTo gTypeDate "Date"

foreign import javascript unsafe "window[\"Date\"]" gTypeDate :: GType
#else
-- TODO work out how we can support Date in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype Acceleration = Acceleration { unAcceleration :: JSRef }

instance Eq Acceleration where
  (Acceleration a) == (Acceleration b) = js_eq a b

instance PToJSRef Acceleration where
  pToJSRef = unAcceleration
  {-# INLINE pToJSRef #-}

instance PFromJSRef Acceleration where
  pFromJSRef = Acceleration
  {-# INLINE pFromJSRef #-}

instance ToJSRef Acceleration where
  toJSRef = return . unAcceleration
  {-# INLINE toJSRef #-}

instance FromJSRef Acceleration where
  fromJSRef = return . fmap Acceleration . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsAcceleration o
toAcceleration :: IsAcceleration o => o -> Acceleration
toAcceleration = unsafeCastGObject . toGObject

instance IsAcceleration Acceleration
instance IsGObject Acceleration where
  toGObject = GObject . castRef . unAcceleration
  unsafeCastGObject = Acceleration . castRef . unGObject
-- TODO add more IsAcceleration instances
#else
-- TODO work out how we can support Acceleration in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype RotationRate = RotationRate { unRotationRate :: JSRef }

instance Eq RotationRate where
  (RotationRate a) == (RotationRate b) = js_eq a b

instance PToJSRef RotationRate where
  pToJSRef = unRotationRate
  {-# INLINE pToJSRef #-}

instance PFromJSRef RotationRate where
  pFromJSRef = RotationRate
  {-# INLINE pFromJSRef #-}

instance ToJSRef RotationRate where
  toJSRef = return . unRotationRate
  {-# INLINE toJSRef #-}

instance FromJSRef RotationRate where
  fromJSRef = return . fmap RotationRate . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsRotationRate o
toRotationRate :: IsRotationRate o => o -> RotationRate
toRotationRate = unsafeCastGObject . toGObject

instance IsRotationRate RotationRate
instance IsGObject RotationRate where
  toGObject = GObject . castRef . unRotationRate
  unsafeCastGObject = RotationRate . castRef . unGObject
-- TODO add more IsRotationRate instances
#else
-- TODO work out how we can support RotationRate in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype Algorithm = Algorithm { unAlgorithm :: JSRef }

instance Eq Algorithm where
  (Algorithm a) == (Algorithm b) = js_eq a b

instance PToJSRef Algorithm where
  pToJSRef = unAlgorithm
  {-# INLINE pToJSRef #-}

instance PFromJSRef Algorithm where
  pFromJSRef = Algorithm
  {-# INLINE pFromJSRef #-}

instance ToJSRef Algorithm where
  toJSRef = return . unAlgorithm
  {-# INLINE toJSRef #-}

instance FromJSRef Algorithm where
  fromJSRef = return . fmap Algorithm . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsAlgorithm o
toAlgorithm :: IsAlgorithm o => o -> Algorithm
toAlgorithm = unsafeCastGObject . toGObject

instance IsAlgorithm Algorithm
instance IsGObject Algorithm where
  toGObject = GObject . castRef . unAlgorithm
  unsafeCastGObject = Algorithm . castRef . unGObject
-- TODO add more IsAlgorithm instances
#else
-- TODO work out how we can support Algorithm in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype CryptoOperationData = CryptoOperationData { unCryptoOperationData :: JSRef }

instance Eq CryptoOperationData where
  (CryptoOperationData a) == (CryptoOperationData b) = js_eq a b

instance PToJSRef CryptoOperationData where
  pToJSRef = unCryptoOperationData
  {-# INLINE pToJSRef #-}

instance PFromJSRef CryptoOperationData where
  pFromJSRef = CryptoOperationData
  {-# INLINE pFromJSRef #-}

instance ToJSRef CryptoOperationData where
  toJSRef = return . unCryptoOperationData
  {-# INLINE toJSRef #-}

instance FromJSRef CryptoOperationData where
  fromJSRef = return . fmap CryptoOperationData . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsCryptoOperationData o
toCryptoOperationData :: IsCryptoOperationData o => o -> CryptoOperationData
toCryptoOperationData = unsafeCastGObject . toGObject

instance IsCryptoOperationData CryptoOperationData
instance IsGObject CryptoOperationData where
  toGObject = GObject . castRef . unCryptoOperationData
  unsafeCastGObject = CryptoOperationData . castRef . unGObject
instance IsCryptoOperationData ArrayBuffer
instance IsCryptoOperationData ArrayBufferView
#else
-- TODO work out how we can support CryptoOperationData in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype CanvasStyle = CanvasStyle { unCanvasStyle :: JSRef }

instance Eq CanvasStyle where
  (CanvasStyle a) == (CanvasStyle b) = js_eq a b

instance PToJSRef CanvasStyle where
  pToJSRef = unCanvasStyle
  {-# INLINE pToJSRef #-}

instance PFromJSRef CanvasStyle where
  pFromJSRef = CanvasStyle
  {-# INLINE pFromJSRef #-}

instance ToJSRef CanvasStyle where
  toJSRef = return . unCanvasStyle
  {-# INLINE toJSRef #-}

instance FromJSRef CanvasStyle where
  fromJSRef = return . fmap CanvasStyle . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsCanvasStyle o
toCanvasStyle :: IsCanvasStyle o => o -> CanvasStyle
toCanvasStyle = unsafeCastGObject . toGObject

instance IsCanvasStyle CanvasStyle
instance IsGObject CanvasStyle where
  toGObject = GObject . castRef . unCanvasStyle
  unsafeCastGObject = CanvasStyle . castRef . unGObject
instance IsCanvasStyle CanvasGradient
instance IsCanvasStyle CanvasPattern
#else
-- TODO work out how we can support CanvasStyle in native code
#endif

#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
newtype DOMException = DOMException { unDOMException :: JSRef }

instance Eq DOMException where
  (DOMException a) == (DOMException b) = js_eq a b

instance PToJSRef DOMException where
  pToJSRef = unDOMException
  {-# INLINE pToJSRef #-}

instance PFromJSRef DOMException where
  pFromJSRef = DOMException
  {-# INLINE pFromJSRef #-}

instance ToJSRef DOMException where
  toJSRef = return . unDOMException
  {-# INLINE toJSRef #-}

instance FromJSRef DOMException where
  fromJSRef = return . fmap DOMException . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsDOMException o
toDOMException :: IsDOMException o => o -> DOMException
toDOMException = unsafeCastGObject . toGObject

instance IsDOMException DOMException
instance IsGObject DOMException where
  toGObject = GObject . castRef . unDOMException
  unsafeCastGObject = DOMException . castRef . unGObject
#else
-- TODO work out how we can support DOMException in native code
#endif

type GLenum = Word32
type GLboolean = Bool
type GLbitfield = Word32
type GLbyte = Int8
type GLshort = Int16
type GLint = Int32
type GLint64 = Int64
type GLsizei = Int32
type GLintptr = Int64
type GLsizeiptr = Int64
type GLubyte = Word8
type GLushort = Word16
type GLuint = Word32
type GLuint64 = Word64
type GLfloat = Double
type GLclampf = Double

-- AUTO GENERATION STARTS HERE
-- The remainder of this file is generated from IDL files using domconv-webkit-jsffi
#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ANGLEInstancedArrays".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ANGLEInstancedArrays Mozilla ANGLEInstancedArrays documentation>
newtype ANGLEInstancedArrays = ANGLEInstancedArrays { unANGLEInstancedArrays :: JSRef }

instance Eq (ANGLEInstancedArrays) where
  (ANGLEInstancedArrays a) == (ANGLEInstancedArrays b) = js_eq a b

instance PToJSRef ANGLEInstancedArrays where
  pToJSRef = unANGLEInstancedArrays
  {-# INLINE pToJSRef #-}

instance PFromJSRef ANGLEInstancedArrays where
  pFromJSRef = ANGLEInstancedArrays
  {-# INLINE pFromJSRef #-}

instance ToJSRef ANGLEInstancedArrays where
  toJSRef = return . unANGLEInstancedArrays
  {-# INLINE toJSRef #-}

instance FromJSRef ANGLEInstancedArrays where
  fromJSRef = return . fmap ANGLEInstancedArrays . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject ANGLEInstancedArrays where
  toGObject = GObject . unANGLEInstancedArrays
  {-# INLINE toGObject #-}
  unsafeCastGObject = ANGLEInstancedArrays . unGObject
  {-# INLINE unsafeCastGObject #-}

castToANGLEInstancedArrays :: IsGObject obj => obj -> ANGLEInstancedArrays
castToANGLEInstancedArrays = castTo gTypeANGLEInstancedArrays "ANGLEInstancedArrays"

foreign import javascript unsafe "window[\"ANGLEInstancedArrays\"]" gTypeANGLEInstancedArrays :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AbstractView".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AbstractView Mozilla AbstractView documentation>
newtype AbstractView = AbstractView { unAbstractView :: JSRef }

instance Eq (AbstractView) where
  (AbstractView a) == (AbstractView b) = js_eq a b

instance PToJSRef AbstractView where
  pToJSRef = unAbstractView
  {-# INLINE pToJSRef #-}

instance PFromJSRef AbstractView where
  pFromJSRef = AbstractView
  {-# INLINE pFromJSRef #-}

instance ToJSRef AbstractView where
  toJSRef = return . unAbstractView
  {-# INLINE toJSRef #-}

instance FromJSRef AbstractView where
  fromJSRef = return . fmap AbstractView . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject AbstractView where
  toGObject = GObject . unAbstractView
  {-# INLINE toGObject #-}
  unsafeCastGObject = AbstractView . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAbstractView :: IsGObject obj => obj -> AbstractView
castToAbstractView = castTo gTypeAbstractView "AbstractView"

foreign import javascript unsafe "window[\"AbstractView\"]" gTypeAbstractView :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AbstractWorker".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AbstractWorker Mozilla AbstractWorker documentation>
newtype AbstractWorker = AbstractWorker { unAbstractWorker :: JSRef }

instance Eq (AbstractWorker) where
  (AbstractWorker a) == (AbstractWorker b) = js_eq a b

instance PToJSRef AbstractWorker where
  pToJSRef = unAbstractWorker
  {-# INLINE pToJSRef #-}

instance PFromJSRef AbstractWorker where
  pFromJSRef = AbstractWorker
  {-# INLINE pFromJSRef #-}

instance ToJSRef AbstractWorker where
  toJSRef = return . unAbstractWorker
  {-# INLINE toJSRef #-}

instance FromJSRef AbstractWorker where
  fromJSRef = return . fmap AbstractWorker . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject AbstractWorker where
  toGObject = GObject . unAbstractWorker
  {-# INLINE toGObject #-}
  unsafeCastGObject = AbstractWorker . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAbstractWorker :: IsGObject obj => obj -> AbstractWorker
castToAbstractWorker = castTo gTypeAbstractWorker "AbstractWorker"

foreign import javascript unsafe "window[\"AbstractWorker\"]" gTypeAbstractWorker :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AllAudioCapabilities".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.MediaStreamCapabilities"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AllAudioCapabilities Mozilla AllAudioCapabilities documentation>
newtype AllAudioCapabilities = AllAudioCapabilities { unAllAudioCapabilities :: JSRef }

instance Eq (AllAudioCapabilities) where
  (AllAudioCapabilities a) == (AllAudioCapabilities b) = js_eq a b

instance PToJSRef AllAudioCapabilities where
  pToJSRef = unAllAudioCapabilities
  {-# INLINE pToJSRef #-}

instance PFromJSRef AllAudioCapabilities where
  pFromJSRef = AllAudioCapabilities
  {-# INLINE pFromJSRef #-}

instance ToJSRef AllAudioCapabilities where
  toJSRef = return . unAllAudioCapabilities
  {-# INLINE toJSRef #-}

instance FromJSRef AllAudioCapabilities where
  fromJSRef = return . fmap AllAudioCapabilities . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsMediaStreamCapabilities AllAudioCapabilities
instance IsGObject AllAudioCapabilities where
  toGObject = GObject . unAllAudioCapabilities
  {-# INLINE toGObject #-}
  unsafeCastGObject = AllAudioCapabilities . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAllAudioCapabilities :: IsGObject obj => obj -> AllAudioCapabilities
castToAllAudioCapabilities = castTo gTypeAllAudioCapabilities "AllAudioCapabilities"

foreign import javascript unsafe "window[\"AllAudioCapabilities\"]" gTypeAllAudioCapabilities :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AllVideoCapabilities".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.MediaStreamCapabilities"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AllVideoCapabilities Mozilla AllVideoCapabilities documentation>
newtype AllVideoCapabilities = AllVideoCapabilities { unAllVideoCapabilities :: JSRef }

instance Eq (AllVideoCapabilities) where
  (AllVideoCapabilities a) == (AllVideoCapabilities b) = js_eq a b

instance PToJSRef AllVideoCapabilities where
  pToJSRef = unAllVideoCapabilities
  {-# INLINE pToJSRef #-}

instance PFromJSRef AllVideoCapabilities where
  pFromJSRef = AllVideoCapabilities
  {-# INLINE pFromJSRef #-}

instance ToJSRef AllVideoCapabilities where
  toJSRef = return . unAllVideoCapabilities
  {-# INLINE toJSRef #-}

instance FromJSRef AllVideoCapabilities where
  fromJSRef = return . fmap AllVideoCapabilities . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsMediaStreamCapabilities AllVideoCapabilities
instance IsGObject AllVideoCapabilities where
  toGObject = GObject . unAllVideoCapabilities
  {-# INLINE toGObject #-}
  unsafeCastGObject = AllVideoCapabilities . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAllVideoCapabilities :: IsGObject obj => obj -> AllVideoCapabilities
castToAllVideoCapabilities = castTo gTypeAllVideoCapabilities "AllVideoCapabilities"

foreign import javascript unsafe "window[\"AllVideoCapabilities\"]" gTypeAllVideoCapabilities :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AnalyserNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AnalyserNode Mozilla AnalyserNode documentation>
newtype AnalyserNode = AnalyserNode { unAnalyserNode :: JSRef }

instance Eq (AnalyserNode) where
  (AnalyserNode a) == (AnalyserNode b) = js_eq a b

instance PToJSRef AnalyserNode where
  pToJSRef = unAnalyserNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef AnalyserNode where
  pFromJSRef = AnalyserNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef AnalyserNode where
  toJSRef = return . unAnalyserNode
  {-# INLINE toJSRef #-}

instance FromJSRef AnalyserNode where
  fromJSRef = return . fmap AnalyserNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode AnalyserNode
instance IsEventTarget AnalyserNode
instance IsGObject AnalyserNode where
  toGObject = GObject . unAnalyserNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = AnalyserNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAnalyserNode :: IsGObject obj => obj -> AnalyserNode
castToAnalyserNode = castTo gTypeAnalyserNode "AnalyserNode"

foreign import javascript unsafe "window[\"AnalyserNode\"]" gTypeAnalyserNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AnimationEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AnimationEvent Mozilla AnimationEvent documentation>
newtype AnimationEvent = AnimationEvent { unAnimationEvent :: JSRef }

instance Eq (AnimationEvent) where
  (AnimationEvent a) == (AnimationEvent b) = js_eq a b

instance PToJSRef AnimationEvent where
  pToJSRef = unAnimationEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef AnimationEvent where
  pFromJSRef = AnimationEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef AnimationEvent where
  toJSRef = return . unAnimationEvent
  {-# INLINE toJSRef #-}

instance FromJSRef AnimationEvent where
  fromJSRef = return . fmap AnimationEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent AnimationEvent
instance IsGObject AnimationEvent where
  toGObject = GObject . unAnimationEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = AnimationEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAnimationEvent :: IsGObject obj => obj -> AnimationEvent
castToAnimationEvent = castTo gTypeAnimationEvent "AnimationEvent"

foreign import javascript unsafe "window[\"AnimationEvent\"]" gTypeAnimationEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ApplicationCache".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ApplicationCache Mozilla ApplicationCache documentation>
newtype ApplicationCache = ApplicationCache { unApplicationCache :: JSRef }

instance Eq (ApplicationCache) where
  (ApplicationCache a) == (ApplicationCache b) = js_eq a b

instance PToJSRef ApplicationCache where
  pToJSRef = unApplicationCache
  {-# INLINE pToJSRef #-}

instance PFromJSRef ApplicationCache where
  pFromJSRef = ApplicationCache
  {-# INLINE pFromJSRef #-}

instance ToJSRef ApplicationCache where
  toJSRef = return . unApplicationCache
  {-# INLINE toJSRef #-}

instance FromJSRef ApplicationCache where
  fromJSRef = return . fmap ApplicationCache . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget ApplicationCache
instance IsGObject ApplicationCache where
  toGObject = GObject . unApplicationCache
  {-# INLINE toGObject #-}
  unsafeCastGObject = ApplicationCache . unGObject
  {-# INLINE unsafeCastGObject #-}

castToApplicationCache :: IsGObject obj => obj -> ApplicationCache
castToApplicationCache = castTo gTypeApplicationCache "ApplicationCache"

foreign import javascript unsafe "window[\"ApplicationCache\"]" gTypeApplicationCache :: GType
#else
type IsApplicationCache o = ApplicationCacheClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Attr".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Attr Mozilla Attr documentation>
newtype Attr = Attr { unAttr :: JSRef }

instance Eq (Attr) where
  (Attr a) == (Attr b) = js_eq a b

instance PToJSRef Attr where
  pToJSRef = unAttr
  {-# INLINE pToJSRef #-}

instance PFromJSRef Attr where
  pFromJSRef = Attr
  {-# INLINE pFromJSRef #-}

instance ToJSRef Attr where
  toJSRef = return . unAttr
  {-# INLINE toJSRef #-}

instance FromJSRef Attr where
  fromJSRef = return . fmap Attr . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsNode Attr
instance IsEventTarget Attr
instance IsGObject Attr where
  toGObject = GObject . unAttr
  {-# INLINE toGObject #-}
  unsafeCastGObject = Attr . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAttr :: IsGObject obj => obj -> Attr
castToAttr = castTo gTypeAttr "Attr"

foreign import javascript unsafe "window[\"Attr\"]" gTypeAttr :: GType
#else
type IsAttr o = AttrClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AudioBuffer".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AudioBuffer Mozilla AudioBuffer documentation>
newtype AudioBuffer = AudioBuffer { unAudioBuffer :: JSRef }

instance Eq (AudioBuffer) where
  (AudioBuffer a) == (AudioBuffer b) = js_eq a b

instance PToJSRef AudioBuffer where
  pToJSRef = unAudioBuffer
  {-# INLINE pToJSRef #-}

instance PFromJSRef AudioBuffer where
  pFromJSRef = AudioBuffer
  {-# INLINE pFromJSRef #-}

instance ToJSRef AudioBuffer where
  toJSRef = return . unAudioBuffer
  {-# INLINE toJSRef #-}

instance FromJSRef AudioBuffer where
  fromJSRef = return . fmap AudioBuffer . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject AudioBuffer where
  toGObject = GObject . unAudioBuffer
  {-# INLINE toGObject #-}
  unsafeCastGObject = AudioBuffer . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAudioBuffer :: IsGObject obj => obj -> AudioBuffer
castToAudioBuffer = castTo gTypeAudioBuffer "AudioBuffer"

foreign import javascript unsafe "window[\"AudioBuffer\"]" gTypeAudioBuffer :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AudioBufferSourceNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AudioBufferSourceNode Mozilla AudioBufferSourceNode documentation>
newtype AudioBufferSourceNode = AudioBufferSourceNode { unAudioBufferSourceNode :: JSRef }

instance Eq (AudioBufferSourceNode) where
  (AudioBufferSourceNode a) == (AudioBufferSourceNode b) = js_eq a b

instance PToJSRef AudioBufferSourceNode where
  pToJSRef = unAudioBufferSourceNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef AudioBufferSourceNode where
  pFromJSRef = AudioBufferSourceNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef AudioBufferSourceNode where
  toJSRef = return . unAudioBufferSourceNode
  {-# INLINE toJSRef #-}

instance FromJSRef AudioBufferSourceNode where
  fromJSRef = return . fmap AudioBufferSourceNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode AudioBufferSourceNode
instance IsEventTarget AudioBufferSourceNode
instance IsGObject AudioBufferSourceNode where
  toGObject = GObject . unAudioBufferSourceNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = AudioBufferSourceNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAudioBufferSourceNode :: IsGObject obj => obj -> AudioBufferSourceNode
castToAudioBufferSourceNode = castTo gTypeAudioBufferSourceNode "AudioBufferSourceNode"

foreign import javascript unsafe "window[\"AudioBufferSourceNode\"]" gTypeAudioBufferSourceNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AudioContext".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AudioContext Mozilla AudioContext documentation>
newtype AudioContext = AudioContext { unAudioContext :: JSRef }

instance Eq (AudioContext) where
  (AudioContext a) == (AudioContext b) = js_eq a b

instance PToJSRef AudioContext where
  pToJSRef = unAudioContext
  {-# INLINE pToJSRef #-}

instance PFromJSRef AudioContext where
  pFromJSRef = AudioContext
  {-# INLINE pFromJSRef #-}

instance ToJSRef AudioContext where
  toJSRef = return . unAudioContext
  {-# INLINE toJSRef #-}

instance FromJSRef AudioContext where
  fromJSRef = return . fmap AudioContext . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsEventTarget o => IsAudioContext o
toAudioContext :: IsAudioContext o => o -> AudioContext
toAudioContext = unsafeCastGObject . toGObject

instance IsAudioContext AudioContext
instance IsEventTarget AudioContext
instance IsGObject AudioContext where
  toGObject = GObject . unAudioContext
  {-# INLINE toGObject #-}
  unsafeCastGObject = AudioContext . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAudioContext :: IsGObject obj => obj -> AudioContext
castToAudioContext = castTo gTypeAudioContext "AudioContext"

foreign import javascript unsafe "window[\"AudioContext\"]" gTypeAudioContext :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AudioDestinationNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AudioDestinationNode Mozilla AudioDestinationNode documentation>
newtype AudioDestinationNode = AudioDestinationNode { unAudioDestinationNode :: JSRef }

instance Eq (AudioDestinationNode) where
  (AudioDestinationNode a) == (AudioDestinationNode b) = js_eq a b

instance PToJSRef AudioDestinationNode where
  pToJSRef = unAudioDestinationNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef AudioDestinationNode where
  pFromJSRef = AudioDestinationNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef AudioDestinationNode where
  toJSRef = return . unAudioDestinationNode
  {-# INLINE toJSRef #-}

instance FromJSRef AudioDestinationNode where
  fromJSRef = return . fmap AudioDestinationNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode AudioDestinationNode
instance IsEventTarget AudioDestinationNode
instance IsGObject AudioDestinationNode where
  toGObject = GObject . unAudioDestinationNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = AudioDestinationNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAudioDestinationNode :: IsGObject obj => obj -> AudioDestinationNode
castToAudioDestinationNode = castTo gTypeAudioDestinationNode "AudioDestinationNode"

foreign import javascript unsafe "window[\"AudioDestinationNode\"]" gTypeAudioDestinationNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AudioListener".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AudioListener Mozilla AudioListener documentation>
newtype AudioListener = AudioListener { unAudioListener :: JSRef }

instance Eq (AudioListener) where
  (AudioListener a) == (AudioListener b) = js_eq a b

instance PToJSRef AudioListener where
  pToJSRef = unAudioListener
  {-# INLINE pToJSRef #-}

instance PFromJSRef AudioListener where
  pFromJSRef = AudioListener
  {-# INLINE pFromJSRef #-}

instance ToJSRef AudioListener where
  toJSRef = return . unAudioListener
  {-# INLINE toJSRef #-}

instance FromJSRef AudioListener where
  fromJSRef = return . fmap AudioListener . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject AudioListener where
  toGObject = GObject . unAudioListener
  {-# INLINE toGObject #-}
  unsafeCastGObject = AudioListener . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAudioListener :: IsGObject obj => obj -> AudioListener
castToAudioListener = castTo gTypeAudioListener "AudioListener"

foreign import javascript unsafe "window[\"AudioListener\"]" gTypeAudioListener :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AudioNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AudioNode Mozilla AudioNode documentation>
newtype AudioNode = AudioNode { unAudioNode :: JSRef }

instance Eq (AudioNode) where
  (AudioNode a) == (AudioNode b) = js_eq a b

instance PToJSRef AudioNode where
  pToJSRef = unAudioNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef AudioNode where
  pFromJSRef = AudioNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef AudioNode where
  toJSRef = return . unAudioNode
  {-# INLINE toJSRef #-}

instance FromJSRef AudioNode where
  fromJSRef = return . fmap AudioNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsEventTarget o => IsAudioNode o
toAudioNode :: IsAudioNode o => o -> AudioNode
toAudioNode = unsafeCastGObject . toGObject

instance IsAudioNode AudioNode
instance IsEventTarget AudioNode
instance IsGObject AudioNode where
  toGObject = GObject . unAudioNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = AudioNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAudioNode :: IsGObject obj => obj -> AudioNode
castToAudioNode = castTo gTypeAudioNode "AudioNode"

foreign import javascript unsafe "window[\"AudioNode\"]" gTypeAudioNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AudioParam".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AudioParam Mozilla AudioParam documentation>
newtype AudioParam = AudioParam { unAudioParam :: JSRef }

instance Eq (AudioParam) where
  (AudioParam a) == (AudioParam b) = js_eq a b

instance PToJSRef AudioParam where
  pToJSRef = unAudioParam
  {-# INLINE pToJSRef #-}

instance PFromJSRef AudioParam where
  pFromJSRef = AudioParam
  {-# INLINE pFromJSRef #-}

instance ToJSRef AudioParam where
  toJSRef = return . unAudioParam
  {-# INLINE toJSRef #-}

instance FromJSRef AudioParam where
  fromJSRef = return . fmap AudioParam . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject AudioParam where
  toGObject = GObject . unAudioParam
  {-# INLINE toGObject #-}
  unsafeCastGObject = AudioParam . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAudioParam :: IsGObject obj => obj -> AudioParam
castToAudioParam = castTo gTypeAudioParam "AudioParam"

foreign import javascript unsafe "window[\"AudioParam\"]" gTypeAudioParam :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AudioProcessingEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AudioProcessingEvent Mozilla AudioProcessingEvent documentation>
newtype AudioProcessingEvent = AudioProcessingEvent { unAudioProcessingEvent :: JSRef }

instance Eq (AudioProcessingEvent) where
  (AudioProcessingEvent a) == (AudioProcessingEvent b) = js_eq a b

instance PToJSRef AudioProcessingEvent where
  pToJSRef = unAudioProcessingEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef AudioProcessingEvent where
  pFromJSRef = AudioProcessingEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef AudioProcessingEvent where
  toJSRef = return . unAudioProcessingEvent
  {-# INLINE toJSRef #-}

instance FromJSRef AudioProcessingEvent where
  fromJSRef = return . fmap AudioProcessingEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent AudioProcessingEvent
instance IsGObject AudioProcessingEvent where
  toGObject = GObject . unAudioProcessingEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = AudioProcessingEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAudioProcessingEvent :: IsGObject obj => obj -> AudioProcessingEvent
castToAudioProcessingEvent = castTo gTypeAudioProcessingEvent "AudioProcessingEvent"

foreign import javascript unsafe "window[\"AudioProcessingEvent\"]" gTypeAudioProcessingEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AudioStreamTrack".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.MediaStreamTrack"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AudioStreamTrack Mozilla AudioStreamTrack documentation>
newtype AudioStreamTrack = AudioStreamTrack { unAudioStreamTrack :: JSRef }

instance Eq (AudioStreamTrack) where
  (AudioStreamTrack a) == (AudioStreamTrack b) = js_eq a b

instance PToJSRef AudioStreamTrack where
  pToJSRef = unAudioStreamTrack
  {-# INLINE pToJSRef #-}

instance PFromJSRef AudioStreamTrack where
  pFromJSRef = AudioStreamTrack
  {-# INLINE pFromJSRef #-}

instance ToJSRef AudioStreamTrack where
  toJSRef = return . unAudioStreamTrack
  {-# INLINE toJSRef #-}

instance FromJSRef AudioStreamTrack where
  fromJSRef = return . fmap AudioStreamTrack . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsMediaStreamTrack AudioStreamTrack
instance IsEventTarget AudioStreamTrack
instance IsGObject AudioStreamTrack where
  toGObject = GObject . unAudioStreamTrack
  {-# INLINE toGObject #-}
  unsafeCastGObject = AudioStreamTrack . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAudioStreamTrack :: IsGObject obj => obj -> AudioStreamTrack
castToAudioStreamTrack = castTo gTypeAudioStreamTrack "AudioStreamTrack"

foreign import javascript unsafe "window[\"AudioStreamTrack\"]" gTypeAudioStreamTrack :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AudioTrack".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AudioTrack Mozilla AudioTrack documentation>
newtype AudioTrack = AudioTrack { unAudioTrack :: JSRef }

instance Eq (AudioTrack) where
  (AudioTrack a) == (AudioTrack b) = js_eq a b

instance PToJSRef AudioTrack where
  pToJSRef = unAudioTrack
  {-# INLINE pToJSRef #-}

instance PFromJSRef AudioTrack where
  pFromJSRef = AudioTrack
  {-# INLINE pFromJSRef #-}

instance ToJSRef AudioTrack where
  toJSRef = return . unAudioTrack
  {-# INLINE toJSRef #-}

instance FromJSRef AudioTrack where
  fromJSRef = return . fmap AudioTrack . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject AudioTrack where
  toGObject = GObject . unAudioTrack
  {-# INLINE toGObject #-}
  unsafeCastGObject = AudioTrack . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAudioTrack :: IsGObject obj => obj -> AudioTrack
castToAudioTrack = castTo gTypeAudioTrack "AudioTrack"

foreign import javascript unsafe "window[\"AudioTrack\"]" gTypeAudioTrack :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsAudioTrack o = AudioTrackClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AudioTrackList".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AudioTrackList Mozilla AudioTrackList documentation>
newtype AudioTrackList = AudioTrackList { unAudioTrackList :: JSRef }

instance Eq (AudioTrackList) where
  (AudioTrackList a) == (AudioTrackList b) = js_eq a b

instance PToJSRef AudioTrackList where
  pToJSRef = unAudioTrackList
  {-# INLINE pToJSRef #-}

instance PFromJSRef AudioTrackList where
  pFromJSRef = AudioTrackList
  {-# INLINE pFromJSRef #-}

instance ToJSRef AudioTrackList where
  toJSRef = return . unAudioTrackList
  {-# INLINE toJSRef #-}

instance FromJSRef AudioTrackList where
  fromJSRef = return . fmap AudioTrackList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget AudioTrackList
instance IsGObject AudioTrackList where
  toGObject = GObject . unAudioTrackList
  {-# INLINE toGObject #-}
  unsafeCastGObject = AudioTrackList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAudioTrackList :: IsGObject obj => obj -> AudioTrackList
castToAudioTrackList = castTo gTypeAudioTrackList "AudioTrackList"

foreign import javascript unsafe "window[\"AudioTrackList\"]" gTypeAudioTrackList :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsAudioTrackList o = AudioTrackListClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.AutocompleteErrorEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/AutocompleteErrorEvent Mozilla AutocompleteErrorEvent documentation>
newtype AutocompleteErrorEvent = AutocompleteErrorEvent { unAutocompleteErrorEvent :: JSRef }

instance Eq (AutocompleteErrorEvent) where
  (AutocompleteErrorEvent a) == (AutocompleteErrorEvent b) = js_eq a b

instance PToJSRef AutocompleteErrorEvent where
  pToJSRef = unAutocompleteErrorEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef AutocompleteErrorEvent where
  pFromJSRef = AutocompleteErrorEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef AutocompleteErrorEvent where
  toJSRef = return . unAutocompleteErrorEvent
  {-# INLINE toJSRef #-}

instance FromJSRef AutocompleteErrorEvent where
  fromJSRef = return . fmap AutocompleteErrorEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent AutocompleteErrorEvent
instance IsGObject AutocompleteErrorEvent where
  toGObject = GObject . unAutocompleteErrorEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = AutocompleteErrorEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToAutocompleteErrorEvent :: IsGObject obj => obj -> AutocompleteErrorEvent
castToAutocompleteErrorEvent = castTo gTypeAutocompleteErrorEvent "AutocompleteErrorEvent"

foreign import javascript unsafe "window[\"AutocompleteErrorEvent\"]" gTypeAutocompleteErrorEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.BarProp".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/BarProp Mozilla BarProp documentation>
newtype BarProp = BarProp { unBarProp :: JSRef }

instance Eq (BarProp) where
  (BarProp a) == (BarProp b) = js_eq a b

instance PToJSRef BarProp where
  pToJSRef = unBarProp
  {-# INLINE pToJSRef #-}

instance PFromJSRef BarProp where
  pFromJSRef = BarProp
  {-# INLINE pFromJSRef #-}

instance ToJSRef BarProp where
  toJSRef = return . unBarProp
  {-# INLINE toJSRef #-}

instance FromJSRef BarProp where
  fromJSRef = return . fmap BarProp . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject BarProp where
  toGObject = GObject . unBarProp
  {-# INLINE toGObject #-}
  unsafeCastGObject = BarProp . unGObject
  {-# INLINE unsafeCastGObject #-}

castToBarProp :: IsGObject obj => obj -> BarProp
castToBarProp = castTo gTypeBarProp "BarProp"

foreign import javascript unsafe "window[\"BarProp\"]" gTypeBarProp :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsBarProp o = BarPropClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.BatteryManager".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/BatteryManager Mozilla BatteryManager documentation>
newtype BatteryManager = BatteryManager { unBatteryManager :: JSRef }

instance Eq (BatteryManager) where
  (BatteryManager a) == (BatteryManager b) = js_eq a b

instance PToJSRef BatteryManager where
  pToJSRef = unBatteryManager
  {-# INLINE pToJSRef #-}

instance PFromJSRef BatteryManager where
  pFromJSRef = BatteryManager
  {-# INLINE pFromJSRef #-}

instance ToJSRef BatteryManager where
  toJSRef = return . unBatteryManager
  {-# INLINE toJSRef #-}

instance FromJSRef BatteryManager where
  fromJSRef = return . fmap BatteryManager . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget BatteryManager
instance IsGObject BatteryManager where
  toGObject = GObject . unBatteryManager
  {-# INLINE toGObject #-}
  unsafeCastGObject = BatteryManager . unGObject
  {-# INLINE unsafeCastGObject #-}

castToBatteryManager :: IsGObject obj => obj -> BatteryManager
castToBatteryManager = castTo gTypeBatteryManager "BatteryManager"

foreign import javascript unsafe "window[\"BatteryManager\"]" gTypeBatteryManager :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsBatteryManager o = BatteryManagerClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.BeforeLoadEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/BeforeLoadEvent Mozilla BeforeLoadEvent documentation>
newtype BeforeLoadEvent = BeforeLoadEvent { unBeforeLoadEvent :: JSRef }

instance Eq (BeforeLoadEvent) where
  (BeforeLoadEvent a) == (BeforeLoadEvent b) = js_eq a b

instance PToJSRef BeforeLoadEvent where
  pToJSRef = unBeforeLoadEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef BeforeLoadEvent where
  pFromJSRef = BeforeLoadEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef BeforeLoadEvent where
  toJSRef = return . unBeforeLoadEvent
  {-# INLINE toJSRef #-}

instance FromJSRef BeforeLoadEvent where
  fromJSRef = return . fmap BeforeLoadEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent BeforeLoadEvent
instance IsGObject BeforeLoadEvent where
  toGObject = GObject . unBeforeLoadEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = BeforeLoadEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToBeforeLoadEvent :: IsGObject obj => obj -> BeforeLoadEvent
castToBeforeLoadEvent = castTo gTypeBeforeLoadEvent "BeforeLoadEvent"

foreign import javascript unsafe "window[\"BeforeLoadEvent\"]" gTypeBeforeLoadEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.BeforeUnloadEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/BeforeUnloadEvent Mozilla BeforeUnloadEvent documentation>
newtype BeforeUnloadEvent = BeforeUnloadEvent { unBeforeUnloadEvent :: JSRef }

instance Eq (BeforeUnloadEvent) where
  (BeforeUnloadEvent a) == (BeforeUnloadEvent b) = js_eq a b

instance PToJSRef BeforeUnloadEvent where
  pToJSRef = unBeforeUnloadEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef BeforeUnloadEvent where
  pFromJSRef = BeforeUnloadEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef BeforeUnloadEvent where
  toJSRef = return . unBeforeUnloadEvent
  {-# INLINE toJSRef #-}

instance FromJSRef BeforeUnloadEvent where
  fromJSRef = return . fmap BeforeUnloadEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent BeforeUnloadEvent
instance IsGObject BeforeUnloadEvent where
  toGObject = GObject . unBeforeUnloadEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = BeforeUnloadEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToBeforeUnloadEvent :: IsGObject obj => obj -> BeforeUnloadEvent
castToBeforeUnloadEvent = castTo gTypeBeforeUnloadEvent "BeforeUnloadEvent"

foreign import javascript unsafe "window[\"BeforeUnloadEvent\"]" gTypeBeforeUnloadEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.BiquadFilterNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/BiquadFilterNode Mozilla BiquadFilterNode documentation>
newtype BiquadFilterNode = BiquadFilterNode { unBiquadFilterNode :: JSRef }

instance Eq (BiquadFilterNode) where
  (BiquadFilterNode a) == (BiquadFilterNode b) = js_eq a b

instance PToJSRef BiquadFilterNode where
  pToJSRef = unBiquadFilterNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef BiquadFilterNode where
  pFromJSRef = BiquadFilterNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef BiquadFilterNode where
  toJSRef = return . unBiquadFilterNode
  {-# INLINE toJSRef #-}

instance FromJSRef BiquadFilterNode where
  fromJSRef = return . fmap BiquadFilterNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode BiquadFilterNode
instance IsEventTarget BiquadFilterNode
instance IsGObject BiquadFilterNode where
  toGObject = GObject . unBiquadFilterNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = BiquadFilterNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToBiquadFilterNode :: IsGObject obj => obj -> BiquadFilterNode
castToBiquadFilterNode = castTo gTypeBiquadFilterNode "BiquadFilterNode"

foreign import javascript unsafe "window[\"BiquadFilterNode\"]" gTypeBiquadFilterNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Blob".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Blob Mozilla Blob documentation>
newtype Blob = Blob { unBlob :: JSRef }

instance Eq (Blob) where
  (Blob a) == (Blob b) = js_eq a b

instance PToJSRef Blob where
  pToJSRef = unBlob
  {-# INLINE pToJSRef #-}

instance PFromJSRef Blob where
  pFromJSRef = Blob
  {-# INLINE pFromJSRef #-}

instance ToJSRef Blob where
  toJSRef = return . unBlob
  {-# INLINE toJSRef #-}

instance FromJSRef Blob where
  fromJSRef = return . fmap Blob . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsBlob o
toBlob :: IsBlob o => o -> Blob
toBlob = unsafeCastGObject . toGObject

instance IsBlob Blob
instance IsGObject Blob where
  toGObject = GObject . unBlob
  {-# INLINE toGObject #-}
  unsafeCastGObject = Blob . unGObject
  {-# INLINE unsafeCastGObject #-}

castToBlob :: IsGObject obj => obj -> Blob
castToBlob = castTo gTypeBlob "Blob"

foreign import javascript unsafe "window[\"Blob\"]" gTypeBlob :: GType
#else
type IsBlob o = BlobClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CDATASection".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Text"
--     * "GHCJS.DOM.CharacterData"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CDATASection Mozilla CDATASection documentation>
newtype CDATASection = CDATASection { unCDATASection :: JSRef }

instance Eq (CDATASection) where
  (CDATASection a) == (CDATASection b) = js_eq a b

instance PToJSRef CDATASection where
  pToJSRef = unCDATASection
  {-# INLINE pToJSRef #-}

instance PFromJSRef CDATASection where
  pFromJSRef = CDATASection
  {-# INLINE pFromJSRef #-}

instance ToJSRef CDATASection where
  toJSRef = return . unCDATASection
  {-# INLINE toJSRef #-}

instance FromJSRef CDATASection where
  fromJSRef = return . fmap CDATASection . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsText CDATASection
instance IsCharacterData CDATASection
instance IsNode CDATASection
instance IsEventTarget CDATASection
instance IsGObject CDATASection where
  toGObject = GObject . unCDATASection
  {-# INLINE toGObject #-}
  unsafeCastGObject = CDATASection . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCDATASection :: IsGObject obj => obj -> CDATASection
castToCDATASection = castTo gTypeCDATASection "CDATASection"

foreign import javascript unsafe "window[\"CDATASection\"]" gTypeCDATASection :: GType
#else
type IsCDATASection o = CDATASectionClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSS".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSS Mozilla CSS documentation>
newtype CSS = CSS { unCSS :: JSRef }

instance Eq (CSS) where
  (CSS a) == (CSS b) = js_eq a b

instance PToJSRef CSS where
  pToJSRef = unCSS
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSS where
  pFromJSRef = CSS
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSS where
  toJSRef = return . unCSS
  {-# INLINE toJSRef #-}

instance FromJSRef CSS where
  fromJSRef = return . fmap CSS . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject CSS where
  toGObject = GObject . unCSS
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSS . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSS :: IsGObject obj => obj -> CSS
castToCSS = castTo gTypeCSS "CSS"

foreign import javascript unsafe "window[\"CSS\"]" gTypeCSS :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsCSS o = CSSClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSCharsetRule".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSRule"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSCharsetRule Mozilla CSSCharsetRule documentation>
newtype CSSCharsetRule = CSSCharsetRule { unCSSCharsetRule :: JSRef }

instance Eq (CSSCharsetRule) where
  (CSSCharsetRule a) == (CSSCharsetRule b) = js_eq a b

instance PToJSRef CSSCharsetRule where
  pToJSRef = unCSSCharsetRule
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSCharsetRule where
  pFromJSRef = CSSCharsetRule
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSCharsetRule where
  toJSRef = return . unCSSCharsetRule
  {-# INLINE toJSRef #-}

instance FromJSRef CSSCharsetRule where
  fromJSRef = return . fmap CSSCharsetRule . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCSSRule CSSCharsetRule
instance IsGObject CSSCharsetRule where
  toGObject = GObject . unCSSCharsetRule
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSCharsetRule . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSCharsetRule :: IsGObject obj => obj -> CSSCharsetRule
castToCSSCharsetRule = castTo gTypeCSSCharsetRule "CSSCharsetRule"

foreign import javascript unsafe "window[\"CSSCharsetRule\"]" gTypeCSSCharsetRule :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSFontFaceLoadEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSFontFaceLoadEvent Mozilla CSSFontFaceLoadEvent documentation>
newtype CSSFontFaceLoadEvent = CSSFontFaceLoadEvent { unCSSFontFaceLoadEvent :: JSRef }

instance Eq (CSSFontFaceLoadEvent) where
  (CSSFontFaceLoadEvent a) == (CSSFontFaceLoadEvent b) = js_eq a b

instance PToJSRef CSSFontFaceLoadEvent where
  pToJSRef = unCSSFontFaceLoadEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSFontFaceLoadEvent where
  pFromJSRef = CSSFontFaceLoadEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSFontFaceLoadEvent where
  toJSRef = return . unCSSFontFaceLoadEvent
  {-# INLINE toJSRef #-}

instance FromJSRef CSSFontFaceLoadEvent where
  fromJSRef = return . fmap CSSFontFaceLoadEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent CSSFontFaceLoadEvent
instance IsGObject CSSFontFaceLoadEvent where
  toGObject = GObject . unCSSFontFaceLoadEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSFontFaceLoadEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSFontFaceLoadEvent :: IsGObject obj => obj -> CSSFontFaceLoadEvent
castToCSSFontFaceLoadEvent = castTo gTypeCSSFontFaceLoadEvent "CSSFontFaceLoadEvent"

foreign import javascript unsafe "window[\"CSSFontFaceLoadEvent\"]" gTypeCSSFontFaceLoadEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSFontFaceRule".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSRule"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSFontFaceRule Mozilla CSSFontFaceRule documentation>
newtype CSSFontFaceRule = CSSFontFaceRule { unCSSFontFaceRule :: JSRef }

instance Eq (CSSFontFaceRule) where
  (CSSFontFaceRule a) == (CSSFontFaceRule b) = js_eq a b

instance PToJSRef CSSFontFaceRule where
  pToJSRef = unCSSFontFaceRule
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSFontFaceRule where
  pFromJSRef = CSSFontFaceRule
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSFontFaceRule where
  toJSRef = return . unCSSFontFaceRule
  {-# INLINE toJSRef #-}

instance FromJSRef CSSFontFaceRule where
  fromJSRef = return . fmap CSSFontFaceRule . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCSSRule CSSFontFaceRule
instance IsGObject CSSFontFaceRule where
  toGObject = GObject . unCSSFontFaceRule
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSFontFaceRule . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSFontFaceRule :: IsGObject obj => obj -> CSSFontFaceRule
castToCSSFontFaceRule = castTo gTypeCSSFontFaceRule "CSSFontFaceRule"

foreign import javascript unsafe "window[\"CSSFontFaceRule\"]" gTypeCSSFontFaceRule :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSImportRule".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSRule"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSImportRule Mozilla CSSImportRule documentation>
newtype CSSImportRule = CSSImportRule { unCSSImportRule :: JSRef }

instance Eq (CSSImportRule) where
  (CSSImportRule a) == (CSSImportRule b) = js_eq a b

instance PToJSRef CSSImportRule where
  pToJSRef = unCSSImportRule
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSImportRule where
  pFromJSRef = CSSImportRule
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSImportRule where
  toJSRef = return . unCSSImportRule
  {-# INLINE toJSRef #-}

instance FromJSRef CSSImportRule where
  fromJSRef = return . fmap CSSImportRule . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCSSRule CSSImportRule
instance IsGObject CSSImportRule where
  toGObject = GObject . unCSSImportRule
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSImportRule . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSImportRule :: IsGObject obj => obj -> CSSImportRule
castToCSSImportRule = castTo gTypeCSSImportRule "CSSImportRule"

foreign import javascript unsafe "window[\"CSSImportRule\"]" gTypeCSSImportRule :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSKeyframeRule".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSRule"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSKeyframeRule Mozilla CSSKeyframeRule documentation>
newtype CSSKeyframeRule = CSSKeyframeRule { unCSSKeyframeRule :: JSRef }

instance Eq (CSSKeyframeRule) where
  (CSSKeyframeRule a) == (CSSKeyframeRule b) = js_eq a b

instance PToJSRef CSSKeyframeRule where
  pToJSRef = unCSSKeyframeRule
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSKeyframeRule where
  pFromJSRef = CSSKeyframeRule
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSKeyframeRule where
  toJSRef = return . unCSSKeyframeRule
  {-# INLINE toJSRef #-}

instance FromJSRef CSSKeyframeRule where
  fromJSRef = return . fmap CSSKeyframeRule . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCSSRule CSSKeyframeRule
instance IsGObject CSSKeyframeRule where
  toGObject = GObject . unCSSKeyframeRule
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSKeyframeRule . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSKeyframeRule :: IsGObject obj => obj -> CSSKeyframeRule
castToCSSKeyframeRule = castTo gTypeCSSKeyframeRule "CSSKeyframeRule"

foreign import javascript unsafe "window[\"CSSKeyframeRule\"]" gTypeCSSKeyframeRule :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSKeyframesRule".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSRule"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSKeyframesRule Mozilla CSSKeyframesRule documentation>
newtype CSSKeyframesRule = CSSKeyframesRule { unCSSKeyframesRule :: JSRef }

instance Eq (CSSKeyframesRule) where
  (CSSKeyframesRule a) == (CSSKeyframesRule b) = js_eq a b

instance PToJSRef CSSKeyframesRule where
  pToJSRef = unCSSKeyframesRule
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSKeyframesRule where
  pFromJSRef = CSSKeyframesRule
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSKeyframesRule where
  toJSRef = return . unCSSKeyframesRule
  {-# INLINE toJSRef #-}

instance FromJSRef CSSKeyframesRule where
  fromJSRef = return . fmap CSSKeyframesRule . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCSSRule CSSKeyframesRule
instance IsGObject CSSKeyframesRule where
  toGObject = GObject . unCSSKeyframesRule
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSKeyframesRule . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSKeyframesRule :: IsGObject obj => obj -> CSSKeyframesRule
castToCSSKeyframesRule = castTo gTypeCSSKeyframesRule "CSSKeyframesRule"

foreign import javascript unsafe "window[\"CSSKeyframesRule\"]" gTypeCSSKeyframesRule :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSMediaRule".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSRule"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSMediaRule Mozilla CSSMediaRule documentation>
newtype CSSMediaRule = CSSMediaRule { unCSSMediaRule :: JSRef }

instance Eq (CSSMediaRule) where
  (CSSMediaRule a) == (CSSMediaRule b) = js_eq a b

instance PToJSRef CSSMediaRule where
  pToJSRef = unCSSMediaRule
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSMediaRule where
  pFromJSRef = CSSMediaRule
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSMediaRule where
  toJSRef = return . unCSSMediaRule
  {-# INLINE toJSRef #-}

instance FromJSRef CSSMediaRule where
  fromJSRef = return . fmap CSSMediaRule . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCSSRule CSSMediaRule
instance IsGObject CSSMediaRule where
  toGObject = GObject . unCSSMediaRule
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSMediaRule . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSMediaRule :: IsGObject obj => obj -> CSSMediaRule
castToCSSMediaRule = castTo gTypeCSSMediaRule "CSSMediaRule"

foreign import javascript unsafe "window[\"CSSMediaRule\"]" gTypeCSSMediaRule :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSPageRule".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSRule"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSPageRule Mozilla CSSPageRule documentation>
newtype CSSPageRule = CSSPageRule { unCSSPageRule :: JSRef }

instance Eq (CSSPageRule) where
  (CSSPageRule a) == (CSSPageRule b) = js_eq a b

instance PToJSRef CSSPageRule where
  pToJSRef = unCSSPageRule
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSPageRule where
  pFromJSRef = CSSPageRule
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSPageRule where
  toJSRef = return . unCSSPageRule
  {-# INLINE toJSRef #-}

instance FromJSRef CSSPageRule where
  fromJSRef = return . fmap CSSPageRule . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCSSRule CSSPageRule
instance IsGObject CSSPageRule where
  toGObject = GObject . unCSSPageRule
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSPageRule . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSPageRule :: IsGObject obj => obj -> CSSPageRule
castToCSSPageRule = castTo gTypeCSSPageRule "CSSPageRule"

foreign import javascript unsafe "window[\"CSSPageRule\"]" gTypeCSSPageRule :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSPrimitiveValue".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSValue"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSPrimitiveValue Mozilla CSSPrimitiveValue documentation>
newtype CSSPrimitiveValue = CSSPrimitiveValue { unCSSPrimitiveValue :: JSRef }

instance Eq (CSSPrimitiveValue) where
  (CSSPrimitiveValue a) == (CSSPrimitiveValue b) = js_eq a b

instance PToJSRef CSSPrimitiveValue where
  pToJSRef = unCSSPrimitiveValue
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSPrimitiveValue where
  pFromJSRef = CSSPrimitiveValue
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSPrimitiveValue where
  toJSRef = return . unCSSPrimitiveValue
  {-# INLINE toJSRef #-}

instance FromJSRef CSSPrimitiveValue where
  fromJSRef = return . fmap CSSPrimitiveValue . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCSSValue CSSPrimitiveValue
instance IsGObject CSSPrimitiveValue where
  toGObject = GObject . unCSSPrimitiveValue
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSPrimitiveValue . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSPrimitiveValue :: IsGObject obj => obj -> CSSPrimitiveValue
castToCSSPrimitiveValue = castTo gTypeCSSPrimitiveValue "CSSPrimitiveValue"

foreign import javascript unsafe "window[\"CSSPrimitiveValue\"]" gTypeCSSPrimitiveValue :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSRule".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSRule Mozilla CSSRule documentation>
newtype CSSRule = CSSRule { unCSSRule :: JSRef }

instance Eq (CSSRule) where
  (CSSRule a) == (CSSRule b) = js_eq a b

instance PToJSRef CSSRule where
  pToJSRef = unCSSRule
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSRule where
  pFromJSRef = CSSRule
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSRule where
  toJSRef = return . unCSSRule
  {-# INLINE toJSRef #-}

instance FromJSRef CSSRule where
  fromJSRef = return . fmap CSSRule . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsCSSRule o
toCSSRule :: IsCSSRule o => o -> CSSRule
toCSSRule = unsafeCastGObject . toGObject

instance IsCSSRule CSSRule
instance IsGObject CSSRule where
  toGObject = GObject . unCSSRule
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSRule . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSRule :: IsGObject obj => obj -> CSSRule
castToCSSRule = castTo gTypeCSSRule "CSSRule"

foreign import javascript unsafe "window[\"CSSRule\"]" gTypeCSSRule :: GType
#else
type IsCSSRule o = CSSRuleClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSRuleList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSRuleList Mozilla CSSRuleList documentation>
newtype CSSRuleList = CSSRuleList { unCSSRuleList :: JSRef }

instance Eq (CSSRuleList) where
  (CSSRuleList a) == (CSSRuleList b) = js_eq a b

instance PToJSRef CSSRuleList where
  pToJSRef = unCSSRuleList
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSRuleList where
  pFromJSRef = CSSRuleList
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSRuleList where
  toJSRef = return . unCSSRuleList
  {-# INLINE toJSRef #-}

instance FromJSRef CSSRuleList where
  fromJSRef = return . fmap CSSRuleList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject CSSRuleList where
  toGObject = GObject . unCSSRuleList
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSRuleList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSRuleList :: IsGObject obj => obj -> CSSRuleList
castToCSSRuleList = castTo gTypeCSSRuleList "CSSRuleList"

foreign import javascript unsafe "window[\"CSSRuleList\"]" gTypeCSSRuleList :: GType
#else
type IsCSSRuleList o = CSSRuleListClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSStyleDeclaration".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSStyleDeclaration Mozilla CSSStyleDeclaration documentation>
newtype CSSStyleDeclaration = CSSStyleDeclaration { unCSSStyleDeclaration :: JSRef }

instance Eq (CSSStyleDeclaration) where
  (CSSStyleDeclaration a) == (CSSStyleDeclaration b) = js_eq a b

instance PToJSRef CSSStyleDeclaration where
  pToJSRef = unCSSStyleDeclaration
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSStyleDeclaration where
  pFromJSRef = CSSStyleDeclaration
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSStyleDeclaration where
  toJSRef = return . unCSSStyleDeclaration
  {-# INLINE toJSRef #-}

instance FromJSRef CSSStyleDeclaration where
  fromJSRef = return . fmap CSSStyleDeclaration . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject CSSStyleDeclaration where
  toGObject = GObject . unCSSStyleDeclaration
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSStyleDeclaration . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSStyleDeclaration :: IsGObject obj => obj -> CSSStyleDeclaration
castToCSSStyleDeclaration = castTo gTypeCSSStyleDeclaration "CSSStyleDeclaration"

foreign import javascript unsafe "window[\"CSSStyleDeclaration\"]" gTypeCSSStyleDeclaration :: GType
#else
type IsCSSStyleDeclaration o = CSSStyleDeclarationClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSStyleRule".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSRule"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSStyleRule Mozilla CSSStyleRule documentation>
newtype CSSStyleRule = CSSStyleRule { unCSSStyleRule :: JSRef }

instance Eq (CSSStyleRule) where
  (CSSStyleRule a) == (CSSStyleRule b) = js_eq a b

instance PToJSRef CSSStyleRule where
  pToJSRef = unCSSStyleRule
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSStyleRule where
  pFromJSRef = CSSStyleRule
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSStyleRule where
  toJSRef = return . unCSSStyleRule
  {-# INLINE toJSRef #-}

instance FromJSRef CSSStyleRule where
  fromJSRef = return . fmap CSSStyleRule . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCSSRule CSSStyleRule
instance IsGObject CSSStyleRule where
  toGObject = GObject . unCSSStyleRule
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSStyleRule . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSStyleRule :: IsGObject obj => obj -> CSSStyleRule
castToCSSStyleRule = castTo gTypeCSSStyleRule "CSSStyleRule"

foreign import javascript unsafe "window[\"CSSStyleRule\"]" gTypeCSSStyleRule :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSStyleSheet".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.StyleSheet"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSStyleSheet Mozilla CSSStyleSheet documentation>
newtype CSSStyleSheet = CSSStyleSheet { unCSSStyleSheet :: JSRef }

instance Eq (CSSStyleSheet) where
  (CSSStyleSheet a) == (CSSStyleSheet b) = js_eq a b

instance PToJSRef CSSStyleSheet where
  pToJSRef = unCSSStyleSheet
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSStyleSheet where
  pFromJSRef = CSSStyleSheet
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSStyleSheet where
  toJSRef = return . unCSSStyleSheet
  {-# INLINE toJSRef #-}

instance FromJSRef CSSStyleSheet where
  fromJSRef = return . fmap CSSStyleSheet . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsStyleSheet CSSStyleSheet
instance IsGObject CSSStyleSheet where
  toGObject = GObject . unCSSStyleSheet
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSStyleSheet . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSStyleSheet :: IsGObject obj => obj -> CSSStyleSheet
castToCSSStyleSheet = castTo gTypeCSSStyleSheet "CSSStyleSheet"

foreign import javascript unsafe "window[\"CSSStyleSheet\"]" gTypeCSSStyleSheet :: GType
#else
type IsCSSStyleSheet o = CSSStyleSheetClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSSupportsRule".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSRule"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSSupportsRule Mozilla CSSSupportsRule documentation>
newtype CSSSupportsRule = CSSSupportsRule { unCSSSupportsRule :: JSRef }

instance Eq (CSSSupportsRule) where
  (CSSSupportsRule a) == (CSSSupportsRule b) = js_eq a b

instance PToJSRef CSSSupportsRule where
  pToJSRef = unCSSSupportsRule
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSSupportsRule where
  pFromJSRef = CSSSupportsRule
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSSupportsRule where
  toJSRef = return . unCSSSupportsRule
  {-# INLINE toJSRef #-}

instance FromJSRef CSSSupportsRule where
  fromJSRef = return . fmap CSSSupportsRule . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCSSRule CSSSupportsRule
instance IsGObject CSSSupportsRule where
  toGObject = GObject . unCSSSupportsRule
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSSupportsRule . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSSupportsRule :: IsGObject obj => obj -> CSSSupportsRule
castToCSSSupportsRule = castTo gTypeCSSSupportsRule "CSSSupportsRule"

foreign import javascript unsafe "window[\"CSSSupportsRule\"]" gTypeCSSSupportsRule :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSUnknownRule".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSRule"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSUnknownRule Mozilla CSSUnknownRule documentation>
newtype CSSUnknownRule = CSSUnknownRule { unCSSUnknownRule :: JSRef }

instance Eq (CSSUnknownRule) where
  (CSSUnknownRule a) == (CSSUnknownRule b) = js_eq a b

instance PToJSRef CSSUnknownRule where
  pToJSRef = unCSSUnknownRule
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSUnknownRule where
  pFromJSRef = CSSUnknownRule
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSUnknownRule where
  toJSRef = return . unCSSUnknownRule
  {-# INLINE toJSRef #-}

instance FromJSRef CSSUnknownRule where
  fromJSRef = return . fmap CSSUnknownRule . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCSSRule CSSUnknownRule
instance IsGObject CSSUnknownRule where
  toGObject = GObject . unCSSUnknownRule
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSUnknownRule . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSUnknownRule :: IsGObject obj => obj -> CSSUnknownRule
castToCSSUnknownRule = castTo gTypeCSSUnknownRule "CSSUnknownRule"

foreign import javascript unsafe "window[\"CSSUnknownRule\"]" gTypeCSSUnknownRule :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSValue".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSValue Mozilla CSSValue documentation>
newtype CSSValue = CSSValue { unCSSValue :: JSRef }

instance Eq (CSSValue) where
  (CSSValue a) == (CSSValue b) = js_eq a b

instance PToJSRef CSSValue where
  pToJSRef = unCSSValue
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSValue where
  pFromJSRef = CSSValue
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSValue where
  toJSRef = return . unCSSValue
  {-# INLINE toJSRef #-}

instance FromJSRef CSSValue where
  fromJSRef = return . fmap CSSValue . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsCSSValue o
toCSSValue :: IsCSSValue o => o -> CSSValue
toCSSValue = unsafeCastGObject . toGObject

instance IsCSSValue CSSValue
instance IsGObject CSSValue where
  toGObject = GObject . unCSSValue
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSValue . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSValue :: IsGObject obj => obj -> CSSValue
castToCSSValue = castTo gTypeCSSValue "CSSValue"

foreign import javascript unsafe "window[\"CSSValue\"]" gTypeCSSValue :: GType
#else
type IsCSSValue o = CSSValueClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CSSValueList".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSValue"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CSSValueList Mozilla CSSValueList documentation>
newtype CSSValueList = CSSValueList { unCSSValueList :: JSRef }

instance Eq (CSSValueList) where
  (CSSValueList a) == (CSSValueList b) = js_eq a b

instance PToJSRef CSSValueList where
  pToJSRef = unCSSValueList
  {-# INLINE pToJSRef #-}

instance PFromJSRef CSSValueList where
  pFromJSRef = CSSValueList
  {-# INLINE pFromJSRef #-}

instance ToJSRef CSSValueList where
  toJSRef = return . unCSSValueList
  {-# INLINE toJSRef #-}

instance FromJSRef CSSValueList where
  fromJSRef = return . fmap CSSValueList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsCSSValue o => IsCSSValueList o
toCSSValueList :: IsCSSValueList o => o -> CSSValueList
toCSSValueList = unsafeCastGObject . toGObject

instance IsCSSValueList CSSValueList
instance IsCSSValue CSSValueList
instance IsGObject CSSValueList where
  toGObject = GObject . unCSSValueList
  {-# INLINE toGObject #-}
  unsafeCastGObject = CSSValueList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCSSValueList :: IsGObject obj => obj -> CSSValueList
castToCSSValueList = castTo gTypeCSSValueList "CSSValueList"

foreign import javascript unsafe "window[\"CSSValueList\"]" gTypeCSSValueList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CanvasGradient".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CanvasGradient Mozilla CanvasGradient documentation>
newtype CanvasGradient = CanvasGradient { unCanvasGradient :: JSRef }

instance Eq (CanvasGradient) where
  (CanvasGradient a) == (CanvasGradient b) = js_eq a b

instance PToJSRef CanvasGradient where
  pToJSRef = unCanvasGradient
  {-# INLINE pToJSRef #-}

instance PFromJSRef CanvasGradient where
  pFromJSRef = CanvasGradient
  {-# INLINE pFromJSRef #-}

instance ToJSRef CanvasGradient where
  toJSRef = return . unCanvasGradient
  {-# INLINE toJSRef #-}

instance FromJSRef CanvasGradient where
  fromJSRef = return . fmap CanvasGradient . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject CanvasGradient where
  toGObject = GObject . unCanvasGradient
  {-# INLINE toGObject #-}
  unsafeCastGObject = CanvasGradient . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCanvasGradient :: IsGObject obj => obj -> CanvasGradient
castToCanvasGradient = castTo gTypeCanvasGradient "CanvasGradient"

foreign import javascript unsafe "window[\"CanvasGradient\"]" gTypeCanvasGradient :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CanvasPattern".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CanvasPattern Mozilla CanvasPattern documentation>
newtype CanvasPattern = CanvasPattern { unCanvasPattern :: JSRef }

instance Eq (CanvasPattern) where
  (CanvasPattern a) == (CanvasPattern b) = js_eq a b

instance PToJSRef CanvasPattern where
  pToJSRef = unCanvasPattern
  {-# INLINE pToJSRef #-}

instance PFromJSRef CanvasPattern where
  pFromJSRef = CanvasPattern
  {-# INLINE pFromJSRef #-}

instance ToJSRef CanvasPattern where
  toJSRef = return . unCanvasPattern
  {-# INLINE toJSRef #-}

instance FromJSRef CanvasPattern where
  fromJSRef = return . fmap CanvasPattern . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject CanvasPattern where
  toGObject = GObject . unCanvasPattern
  {-# INLINE toGObject #-}
  unsafeCastGObject = CanvasPattern . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCanvasPattern :: IsGObject obj => obj -> CanvasPattern
castToCanvasPattern = castTo gTypeCanvasPattern "CanvasPattern"

foreign import javascript unsafe "window[\"CanvasPattern\"]" gTypeCanvasPattern :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CanvasProxy".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CanvasProxy Mozilla CanvasProxy documentation>
newtype CanvasProxy = CanvasProxy { unCanvasProxy :: JSRef }

instance Eq (CanvasProxy) where
  (CanvasProxy a) == (CanvasProxy b) = js_eq a b

instance PToJSRef CanvasProxy where
  pToJSRef = unCanvasProxy
  {-# INLINE pToJSRef #-}

instance PFromJSRef CanvasProxy where
  pFromJSRef = CanvasProxy
  {-# INLINE pFromJSRef #-}

instance ToJSRef CanvasProxy where
  toJSRef = return . unCanvasProxy
  {-# INLINE toJSRef #-}

instance FromJSRef CanvasProxy where
  fromJSRef = return . fmap CanvasProxy . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject CanvasProxy where
  toGObject = GObject . unCanvasProxy
  {-# INLINE toGObject #-}
  unsafeCastGObject = CanvasProxy . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCanvasProxy :: IsGObject obj => obj -> CanvasProxy
castToCanvasProxy = castTo gTypeCanvasProxy "CanvasProxy"

foreign import javascript unsafe "window[\"CanvasProxy\"]" gTypeCanvasProxy :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CanvasRenderingContext".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext Mozilla CanvasRenderingContext documentation>
newtype CanvasRenderingContext = CanvasRenderingContext { unCanvasRenderingContext :: JSRef }

instance Eq (CanvasRenderingContext) where
  (CanvasRenderingContext a) == (CanvasRenderingContext b) = js_eq a b

instance PToJSRef CanvasRenderingContext where
  pToJSRef = unCanvasRenderingContext
  {-# INLINE pToJSRef #-}

instance PFromJSRef CanvasRenderingContext where
  pFromJSRef = CanvasRenderingContext
  {-# INLINE pFromJSRef #-}

instance ToJSRef CanvasRenderingContext where
  toJSRef = return . unCanvasRenderingContext
  {-# INLINE toJSRef #-}

instance FromJSRef CanvasRenderingContext where
  fromJSRef = return . fmap CanvasRenderingContext . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsCanvasRenderingContext o
toCanvasRenderingContext :: IsCanvasRenderingContext o => o -> CanvasRenderingContext
toCanvasRenderingContext = unsafeCastGObject . toGObject

instance IsCanvasRenderingContext CanvasRenderingContext
instance IsGObject CanvasRenderingContext where
  toGObject = GObject . unCanvasRenderingContext
  {-# INLINE toGObject #-}
  unsafeCastGObject = CanvasRenderingContext . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCanvasRenderingContext :: IsGObject obj => obj -> CanvasRenderingContext
castToCanvasRenderingContext = castTo gTypeCanvasRenderingContext "CanvasRenderingContext"

foreign import javascript unsafe "window[\"CanvasRenderingContext\"]" gTypeCanvasRenderingContext :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CanvasRenderingContext2D".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CanvasRenderingContext"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D Mozilla CanvasRenderingContext2D documentation>
newtype CanvasRenderingContext2D = CanvasRenderingContext2D { unCanvasRenderingContext2D :: JSRef }

instance Eq (CanvasRenderingContext2D) where
  (CanvasRenderingContext2D a) == (CanvasRenderingContext2D b) = js_eq a b

instance PToJSRef CanvasRenderingContext2D where
  pToJSRef = unCanvasRenderingContext2D
  {-# INLINE pToJSRef #-}

instance PFromJSRef CanvasRenderingContext2D where
  pFromJSRef = CanvasRenderingContext2D
  {-# INLINE pFromJSRef #-}

instance ToJSRef CanvasRenderingContext2D where
  toJSRef = return . unCanvasRenderingContext2D
  {-# INLINE toJSRef #-}

instance FromJSRef CanvasRenderingContext2D where
  fromJSRef = return . fmap CanvasRenderingContext2D . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCanvasRenderingContext CanvasRenderingContext2D
instance IsGObject CanvasRenderingContext2D where
  toGObject = GObject . unCanvasRenderingContext2D
  {-# INLINE toGObject #-}
  unsafeCastGObject = CanvasRenderingContext2D . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCanvasRenderingContext2D :: IsGObject obj => obj -> CanvasRenderingContext2D
castToCanvasRenderingContext2D = castTo gTypeCanvasRenderingContext2D "CanvasRenderingContext2D"

foreign import javascript unsafe "window[\"CanvasRenderingContext2D\"]" gTypeCanvasRenderingContext2D :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CapabilityRange".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CapabilityRange Mozilla CapabilityRange documentation>
newtype CapabilityRange = CapabilityRange { unCapabilityRange :: JSRef }

instance Eq (CapabilityRange) where
  (CapabilityRange a) == (CapabilityRange b) = js_eq a b

instance PToJSRef CapabilityRange where
  pToJSRef = unCapabilityRange
  {-# INLINE pToJSRef #-}

instance PFromJSRef CapabilityRange where
  pFromJSRef = CapabilityRange
  {-# INLINE pFromJSRef #-}

instance ToJSRef CapabilityRange where
  toJSRef = return . unCapabilityRange
  {-# INLINE toJSRef #-}

instance FromJSRef CapabilityRange where
  fromJSRef = return . fmap CapabilityRange . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject CapabilityRange where
  toGObject = GObject . unCapabilityRange
  {-# INLINE toGObject #-}
  unsafeCastGObject = CapabilityRange . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCapabilityRange :: IsGObject obj => obj -> CapabilityRange
castToCapabilityRange = castTo gTypeCapabilityRange "CapabilityRange"

foreign import javascript unsafe "window[\"CapabilityRange\"]" gTypeCapabilityRange :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ChannelMergerNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ChannelMergerNode Mozilla ChannelMergerNode documentation>
newtype ChannelMergerNode = ChannelMergerNode { unChannelMergerNode :: JSRef }

instance Eq (ChannelMergerNode) where
  (ChannelMergerNode a) == (ChannelMergerNode b) = js_eq a b

instance PToJSRef ChannelMergerNode where
  pToJSRef = unChannelMergerNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef ChannelMergerNode where
  pFromJSRef = ChannelMergerNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef ChannelMergerNode where
  toJSRef = return . unChannelMergerNode
  {-# INLINE toJSRef #-}

instance FromJSRef ChannelMergerNode where
  fromJSRef = return . fmap ChannelMergerNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode ChannelMergerNode
instance IsEventTarget ChannelMergerNode
instance IsGObject ChannelMergerNode where
  toGObject = GObject . unChannelMergerNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = ChannelMergerNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToChannelMergerNode :: IsGObject obj => obj -> ChannelMergerNode
castToChannelMergerNode = castTo gTypeChannelMergerNode "ChannelMergerNode"

foreign import javascript unsafe "window[\"ChannelMergerNode\"]" gTypeChannelMergerNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ChannelSplitterNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ChannelSplitterNode Mozilla ChannelSplitterNode documentation>
newtype ChannelSplitterNode = ChannelSplitterNode { unChannelSplitterNode :: JSRef }

instance Eq (ChannelSplitterNode) where
  (ChannelSplitterNode a) == (ChannelSplitterNode b) = js_eq a b

instance PToJSRef ChannelSplitterNode where
  pToJSRef = unChannelSplitterNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef ChannelSplitterNode where
  pFromJSRef = ChannelSplitterNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef ChannelSplitterNode where
  toJSRef = return . unChannelSplitterNode
  {-# INLINE toJSRef #-}

instance FromJSRef ChannelSplitterNode where
  fromJSRef = return . fmap ChannelSplitterNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode ChannelSplitterNode
instance IsEventTarget ChannelSplitterNode
instance IsGObject ChannelSplitterNode where
  toGObject = GObject . unChannelSplitterNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = ChannelSplitterNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToChannelSplitterNode :: IsGObject obj => obj -> ChannelSplitterNode
castToChannelSplitterNode = castTo gTypeChannelSplitterNode "ChannelSplitterNode"

foreign import javascript unsafe "window[\"ChannelSplitterNode\"]" gTypeChannelSplitterNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CharacterData".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CharacterData Mozilla CharacterData documentation>
newtype CharacterData = CharacterData { unCharacterData :: JSRef }

instance Eq (CharacterData) where
  (CharacterData a) == (CharacterData b) = js_eq a b

instance PToJSRef CharacterData where
  pToJSRef = unCharacterData
  {-# INLINE pToJSRef #-}

instance PFromJSRef CharacterData where
  pFromJSRef = CharacterData
  {-# INLINE pFromJSRef #-}

instance ToJSRef CharacterData where
  toJSRef = return . unCharacterData
  {-# INLINE toJSRef #-}

instance FromJSRef CharacterData where
  fromJSRef = return . fmap CharacterData . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsNode o => IsCharacterData o
toCharacterData :: IsCharacterData o => o -> CharacterData
toCharacterData = unsafeCastGObject . toGObject

instance IsCharacterData CharacterData
instance IsNode CharacterData
instance IsEventTarget CharacterData
instance IsGObject CharacterData where
  toGObject = GObject . unCharacterData
  {-# INLINE toGObject #-}
  unsafeCastGObject = CharacterData . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCharacterData :: IsGObject obj => obj -> CharacterData
castToCharacterData = castTo gTypeCharacterData "CharacterData"

foreign import javascript unsafe "window[\"CharacterData\"]" gTypeCharacterData :: GType
#else
type IsCharacterData o = CharacterDataClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ChildNode".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ChildNode Mozilla ChildNode documentation>
newtype ChildNode = ChildNode { unChildNode :: JSRef }

instance Eq (ChildNode) where
  (ChildNode a) == (ChildNode b) = js_eq a b

instance PToJSRef ChildNode where
  pToJSRef = unChildNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef ChildNode where
  pFromJSRef = ChildNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef ChildNode where
  toJSRef = return . unChildNode
  {-# INLINE toJSRef #-}

instance FromJSRef ChildNode where
  fromJSRef = return . fmap ChildNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject ChildNode where
  toGObject = GObject . unChildNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = ChildNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToChildNode :: IsGObject obj => obj -> ChildNode
castToChildNode = castTo gTypeChildNode "ChildNode"

foreign import javascript unsafe "window[\"ChildNode\"]" gTypeChildNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ClientRect".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ClientRect Mozilla ClientRect documentation>
newtype ClientRect = ClientRect { unClientRect :: JSRef }

instance Eq (ClientRect) where
  (ClientRect a) == (ClientRect b) = js_eq a b

instance PToJSRef ClientRect where
  pToJSRef = unClientRect
  {-# INLINE pToJSRef #-}

instance PFromJSRef ClientRect where
  pFromJSRef = ClientRect
  {-# INLINE pFromJSRef #-}

instance ToJSRef ClientRect where
  toJSRef = return . unClientRect
  {-# INLINE toJSRef #-}

instance FromJSRef ClientRect where
  fromJSRef = return . fmap ClientRect . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject ClientRect where
  toGObject = GObject . unClientRect
  {-# INLINE toGObject #-}
  unsafeCastGObject = ClientRect . unGObject
  {-# INLINE unsafeCastGObject #-}

castToClientRect :: IsGObject obj => obj -> ClientRect
castToClientRect = castTo gTypeClientRect "ClientRect"

foreign import javascript unsafe "window[\"ClientRect\"]" gTypeClientRect :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ClientRectList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ClientRectList Mozilla ClientRectList documentation>
newtype ClientRectList = ClientRectList { unClientRectList :: JSRef }

instance Eq (ClientRectList) where
  (ClientRectList a) == (ClientRectList b) = js_eq a b

instance PToJSRef ClientRectList where
  pToJSRef = unClientRectList
  {-# INLINE pToJSRef #-}

instance PFromJSRef ClientRectList where
  pFromJSRef = ClientRectList
  {-# INLINE pFromJSRef #-}

instance ToJSRef ClientRectList where
  toJSRef = return . unClientRectList
  {-# INLINE toJSRef #-}

instance FromJSRef ClientRectList where
  fromJSRef = return . fmap ClientRectList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject ClientRectList where
  toGObject = GObject . unClientRectList
  {-# INLINE toGObject #-}
  unsafeCastGObject = ClientRectList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToClientRectList :: IsGObject obj => obj -> ClientRectList
castToClientRectList = castTo gTypeClientRectList "ClientRectList"

foreign import javascript unsafe "window[\"ClientRectList\"]" gTypeClientRectList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CloseEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CloseEvent Mozilla CloseEvent documentation>
newtype CloseEvent = CloseEvent { unCloseEvent :: JSRef }

instance Eq (CloseEvent) where
  (CloseEvent a) == (CloseEvent b) = js_eq a b

instance PToJSRef CloseEvent where
  pToJSRef = unCloseEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef CloseEvent where
  pFromJSRef = CloseEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef CloseEvent where
  toJSRef = return . unCloseEvent
  {-# INLINE toJSRef #-}

instance FromJSRef CloseEvent where
  fromJSRef = return . fmap CloseEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent CloseEvent
instance IsGObject CloseEvent where
  toGObject = GObject . unCloseEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = CloseEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCloseEvent :: IsGObject obj => obj -> CloseEvent
castToCloseEvent = castTo gTypeCloseEvent "CloseEvent"

foreign import javascript unsafe "window[\"CloseEvent\"]" gTypeCloseEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CommandLineAPIHost".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CommandLineAPIHost Mozilla CommandLineAPIHost documentation>
newtype CommandLineAPIHost = CommandLineAPIHost { unCommandLineAPIHost :: JSRef }

instance Eq (CommandLineAPIHost) where
  (CommandLineAPIHost a) == (CommandLineAPIHost b) = js_eq a b

instance PToJSRef CommandLineAPIHost where
  pToJSRef = unCommandLineAPIHost
  {-# INLINE pToJSRef #-}

instance PFromJSRef CommandLineAPIHost where
  pFromJSRef = CommandLineAPIHost
  {-# INLINE pFromJSRef #-}

instance ToJSRef CommandLineAPIHost where
  toJSRef = return . unCommandLineAPIHost
  {-# INLINE toJSRef #-}

instance FromJSRef CommandLineAPIHost where
  fromJSRef = return . fmap CommandLineAPIHost . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject CommandLineAPIHost where
  toGObject = GObject . unCommandLineAPIHost
  {-# INLINE toGObject #-}
  unsafeCastGObject = CommandLineAPIHost . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCommandLineAPIHost :: IsGObject obj => obj -> CommandLineAPIHost
castToCommandLineAPIHost = castTo gTypeCommandLineAPIHost "CommandLineAPIHost"

foreign import javascript unsafe "window[\"CommandLineAPIHost\"]" gTypeCommandLineAPIHost :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Comment".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CharacterData"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Comment Mozilla Comment documentation>
newtype Comment = Comment { unComment :: JSRef }

instance Eq (Comment) where
  (Comment a) == (Comment b) = js_eq a b

instance PToJSRef Comment where
  pToJSRef = unComment
  {-# INLINE pToJSRef #-}

instance PFromJSRef Comment where
  pFromJSRef = Comment
  {-# INLINE pFromJSRef #-}

instance ToJSRef Comment where
  toJSRef = return . unComment
  {-# INLINE toJSRef #-}

instance FromJSRef Comment where
  fromJSRef = return . fmap Comment . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCharacterData Comment
instance IsNode Comment
instance IsEventTarget Comment
instance IsGObject Comment where
  toGObject = GObject . unComment
  {-# INLINE toGObject #-}
  unsafeCastGObject = Comment . unGObject
  {-# INLINE unsafeCastGObject #-}

castToComment :: IsGObject obj => obj -> Comment
castToComment = castTo gTypeComment "Comment"

foreign import javascript unsafe "window[\"Comment\"]" gTypeComment :: GType
#else
type IsComment o = CommentClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CompositionEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.UIEvent"
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CompositionEvent Mozilla CompositionEvent documentation>
newtype CompositionEvent = CompositionEvent { unCompositionEvent :: JSRef }

instance Eq (CompositionEvent) where
  (CompositionEvent a) == (CompositionEvent b) = js_eq a b

instance PToJSRef CompositionEvent where
  pToJSRef = unCompositionEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef CompositionEvent where
  pFromJSRef = CompositionEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef CompositionEvent where
  toJSRef = return . unCompositionEvent
  {-# INLINE toJSRef #-}

instance FromJSRef CompositionEvent where
  fromJSRef = return . fmap CompositionEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsUIEvent CompositionEvent
instance IsEvent CompositionEvent
instance IsGObject CompositionEvent where
  toGObject = GObject . unCompositionEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = CompositionEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCompositionEvent :: IsGObject obj => obj -> CompositionEvent
castToCompositionEvent = castTo gTypeCompositionEvent "CompositionEvent"

foreign import javascript unsafe "window[\"CompositionEvent\"]" gTypeCompositionEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ConvolverNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ConvolverNode Mozilla ConvolverNode documentation>
newtype ConvolverNode = ConvolverNode { unConvolverNode :: JSRef }

instance Eq (ConvolverNode) where
  (ConvolverNode a) == (ConvolverNode b) = js_eq a b

instance PToJSRef ConvolverNode where
  pToJSRef = unConvolverNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef ConvolverNode where
  pFromJSRef = ConvolverNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef ConvolverNode where
  toJSRef = return . unConvolverNode
  {-# INLINE toJSRef #-}

instance FromJSRef ConvolverNode where
  fromJSRef = return . fmap ConvolverNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode ConvolverNode
instance IsEventTarget ConvolverNode
instance IsGObject ConvolverNode where
  toGObject = GObject . unConvolverNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = ConvolverNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToConvolverNode :: IsGObject obj => obj -> ConvolverNode
castToConvolverNode = castTo gTypeConvolverNode "ConvolverNode"

foreign import javascript unsafe "window[\"ConvolverNode\"]" gTypeConvolverNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Coordinates".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Coordinates Mozilla Coordinates documentation>
newtype Coordinates = Coordinates { unCoordinates :: JSRef }

instance Eq (Coordinates) where
  (Coordinates a) == (Coordinates b) = js_eq a b

instance PToJSRef Coordinates where
  pToJSRef = unCoordinates
  {-# INLINE pToJSRef #-}

instance PFromJSRef Coordinates where
  pFromJSRef = Coordinates
  {-# INLINE pFromJSRef #-}

instance ToJSRef Coordinates where
  toJSRef = return . unCoordinates
  {-# INLINE toJSRef #-}

instance FromJSRef Coordinates where
  fromJSRef = return . fmap Coordinates . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Coordinates where
  toGObject = GObject . unCoordinates
  {-# INLINE toGObject #-}
  unsafeCastGObject = Coordinates . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCoordinates :: IsGObject obj => obj -> Coordinates
castToCoordinates = castTo gTypeCoordinates "Coordinates"

foreign import javascript unsafe "window[\"Coordinates\"]" gTypeCoordinates :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Counter".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Counter Mozilla Counter documentation>
newtype Counter = Counter { unCounter :: JSRef }

instance Eq (Counter) where
  (Counter a) == (Counter b) = js_eq a b

instance PToJSRef Counter where
  pToJSRef = unCounter
  {-# INLINE pToJSRef #-}

instance PFromJSRef Counter where
  pFromJSRef = Counter
  {-# INLINE pFromJSRef #-}

instance ToJSRef Counter where
  toJSRef = return . unCounter
  {-# INLINE toJSRef #-}

instance FromJSRef Counter where
  fromJSRef = return . fmap Counter . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Counter where
  toGObject = GObject . unCounter
  {-# INLINE toGObject #-}
  unsafeCastGObject = Counter . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCounter :: IsGObject obj => obj -> Counter
castToCounter = castTo gTypeCounter "Counter"

foreign import javascript unsafe "window[\"Counter\"]" gTypeCounter :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Crypto".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Crypto Mozilla Crypto documentation>
newtype Crypto = Crypto { unCrypto :: JSRef }

instance Eq (Crypto) where
  (Crypto a) == (Crypto b) = js_eq a b

instance PToJSRef Crypto where
  pToJSRef = unCrypto
  {-# INLINE pToJSRef #-}

instance PFromJSRef Crypto where
  pFromJSRef = Crypto
  {-# INLINE pFromJSRef #-}

instance ToJSRef Crypto where
  toJSRef = return . unCrypto
  {-# INLINE toJSRef #-}

instance FromJSRef Crypto where
  fromJSRef = return . fmap Crypto . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Crypto where
  toGObject = GObject . unCrypto
  {-# INLINE toGObject #-}
  unsafeCastGObject = Crypto . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCrypto :: IsGObject obj => obj -> Crypto
castToCrypto = castTo gTypeCrypto "Crypto"

foreign import javascript unsafe "window[\"Crypto\"]" gTypeCrypto :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CryptoKey".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CryptoKey Mozilla CryptoKey documentation>
newtype CryptoKey = CryptoKey { unCryptoKey :: JSRef }

instance Eq (CryptoKey) where
  (CryptoKey a) == (CryptoKey b) = js_eq a b

instance PToJSRef CryptoKey where
  pToJSRef = unCryptoKey
  {-# INLINE pToJSRef #-}

instance PFromJSRef CryptoKey where
  pFromJSRef = CryptoKey
  {-# INLINE pFromJSRef #-}

instance ToJSRef CryptoKey where
  toJSRef = return . unCryptoKey
  {-# INLINE toJSRef #-}

instance FromJSRef CryptoKey where
  fromJSRef = return . fmap CryptoKey . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject CryptoKey where
  toGObject = GObject . unCryptoKey
  {-# INLINE toGObject #-}
  unsafeCastGObject = CryptoKey . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCryptoKey :: IsGObject obj => obj -> CryptoKey
castToCryptoKey = castTo gTypeCryptoKey "CryptoKey"

foreign import javascript unsafe "window[\"CryptoKey\"]" gTypeCryptoKey :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CryptoKeyPair".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CryptoKeyPair Mozilla CryptoKeyPair documentation>
newtype CryptoKeyPair = CryptoKeyPair { unCryptoKeyPair :: JSRef }

instance Eq (CryptoKeyPair) where
  (CryptoKeyPair a) == (CryptoKeyPair b) = js_eq a b

instance PToJSRef CryptoKeyPair where
  pToJSRef = unCryptoKeyPair
  {-# INLINE pToJSRef #-}

instance PFromJSRef CryptoKeyPair where
  pFromJSRef = CryptoKeyPair
  {-# INLINE pFromJSRef #-}

instance ToJSRef CryptoKeyPair where
  toJSRef = return . unCryptoKeyPair
  {-# INLINE toJSRef #-}

instance FromJSRef CryptoKeyPair where
  fromJSRef = return . fmap CryptoKeyPair . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject CryptoKeyPair where
  toGObject = GObject . unCryptoKeyPair
  {-# INLINE toGObject #-}
  unsafeCastGObject = CryptoKeyPair . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCryptoKeyPair :: IsGObject obj => obj -> CryptoKeyPair
castToCryptoKeyPair = castTo gTypeCryptoKeyPair "CryptoKeyPair"

foreign import javascript unsafe "window[\"CryptoKeyPair\"]" gTypeCryptoKeyPair :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.CustomEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent Mozilla CustomEvent documentation>
newtype CustomEvent = CustomEvent { unCustomEvent :: JSRef }

instance Eq (CustomEvent) where
  (CustomEvent a) == (CustomEvent b) = js_eq a b

instance PToJSRef CustomEvent where
  pToJSRef = unCustomEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef CustomEvent where
  pFromJSRef = CustomEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef CustomEvent where
  toJSRef = return . unCustomEvent
  {-# INLINE toJSRef #-}

instance FromJSRef CustomEvent where
  fromJSRef = return . fmap CustomEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent CustomEvent
instance IsGObject CustomEvent where
  toGObject = GObject . unCustomEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = CustomEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToCustomEvent :: IsGObject obj => obj -> CustomEvent
castToCustomEvent = castTo gTypeCustomEvent "CustomEvent"

foreign import javascript unsafe "window[\"CustomEvent\"]" gTypeCustomEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DOMError".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DOMError Mozilla DOMError documentation>
newtype DOMError = DOMError { unDOMError :: JSRef }

instance Eq (DOMError) where
  (DOMError a) == (DOMError b) = js_eq a b

instance PToJSRef DOMError where
  pToJSRef = unDOMError
  {-# INLINE pToJSRef #-}

instance PFromJSRef DOMError where
  pFromJSRef = DOMError
  {-# INLINE pFromJSRef #-}

instance ToJSRef DOMError where
  toJSRef = return . unDOMError
  {-# INLINE toJSRef #-}

instance FromJSRef DOMError where
  fromJSRef = return . fmap DOMError . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsDOMError o
toDOMError :: IsDOMError o => o -> DOMError
toDOMError = unsafeCastGObject . toGObject

instance IsDOMError DOMError
instance IsGObject DOMError where
  toGObject = GObject . unDOMError
  {-# INLINE toGObject #-}
  unsafeCastGObject = DOMError . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDOMError :: IsGObject obj => obj -> DOMError
castToDOMError = castTo gTypeDOMError "DOMError"

foreign import javascript unsafe "window[\"DOMError\"]" gTypeDOMError :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DOMImplementation".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DOMImplementation Mozilla DOMImplementation documentation>
newtype DOMImplementation = DOMImplementation { unDOMImplementation :: JSRef }

instance Eq (DOMImplementation) where
  (DOMImplementation a) == (DOMImplementation b) = js_eq a b

instance PToJSRef DOMImplementation where
  pToJSRef = unDOMImplementation
  {-# INLINE pToJSRef #-}

instance PFromJSRef DOMImplementation where
  pFromJSRef = DOMImplementation
  {-# INLINE pFromJSRef #-}

instance ToJSRef DOMImplementation where
  toJSRef = return . unDOMImplementation
  {-# INLINE toJSRef #-}

instance FromJSRef DOMImplementation where
  fromJSRef = return . fmap DOMImplementation . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject DOMImplementation where
  toGObject = GObject . unDOMImplementation
  {-# INLINE toGObject #-}
  unsafeCastGObject = DOMImplementation . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDOMImplementation :: IsGObject obj => obj -> DOMImplementation
castToDOMImplementation = castTo gTypeDOMImplementation "DOMImplementation"

foreign import javascript unsafe "window[\"DOMImplementation\"]" gTypeDOMImplementation :: GType
#else
type IsDOMImplementation o = DOMImplementationClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DOMNamedFlowCollection".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitNamedFlowCollection Mozilla WebKitNamedFlowCollection documentation>
newtype DOMNamedFlowCollection = DOMNamedFlowCollection { unDOMNamedFlowCollection :: JSRef }

instance Eq (DOMNamedFlowCollection) where
  (DOMNamedFlowCollection a) == (DOMNamedFlowCollection b) = js_eq a b

instance PToJSRef DOMNamedFlowCollection where
  pToJSRef = unDOMNamedFlowCollection
  {-# INLINE pToJSRef #-}

instance PFromJSRef DOMNamedFlowCollection where
  pFromJSRef = DOMNamedFlowCollection
  {-# INLINE pFromJSRef #-}

instance ToJSRef DOMNamedFlowCollection where
  toJSRef = return . unDOMNamedFlowCollection
  {-# INLINE toJSRef #-}

instance FromJSRef DOMNamedFlowCollection where
  fromJSRef = return . fmap DOMNamedFlowCollection . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject DOMNamedFlowCollection where
  toGObject = GObject . unDOMNamedFlowCollection
  {-# INLINE toGObject #-}
  unsafeCastGObject = DOMNamedFlowCollection . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDOMNamedFlowCollection :: IsGObject obj => obj -> DOMNamedFlowCollection
castToDOMNamedFlowCollection = castTo gTypeDOMNamedFlowCollection "DOMNamedFlowCollection"

foreign import javascript unsafe "window[\"WebKitNamedFlowCollection\"]" gTypeDOMNamedFlowCollection :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsDOMNamedFlowCollection o = DOMNamedFlowCollectionClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DOMParser".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DOMParser Mozilla DOMParser documentation>
newtype DOMParser = DOMParser { unDOMParser :: JSRef }

instance Eq (DOMParser) where
  (DOMParser a) == (DOMParser b) = js_eq a b

instance PToJSRef DOMParser where
  pToJSRef = unDOMParser
  {-# INLINE pToJSRef #-}

instance PFromJSRef DOMParser where
  pFromJSRef = DOMParser
  {-# INLINE pFromJSRef #-}

instance ToJSRef DOMParser where
  toJSRef = return . unDOMParser
  {-# INLINE toJSRef #-}

instance FromJSRef DOMParser where
  fromJSRef = return . fmap DOMParser . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject DOMParser where
  toGObject = GObject . unDOMParser
  {-# INLINE toGObject #-}
  unsafeCastGObject = DOMParser . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDOMParser :: IsGObject obj => obj -> DOMParser
castToDOMParser = castTo gTypeDOMParser "DOMParser"

foreign import javascript unsafe "window[\"DOMParser\"]" gTypeDOMParser :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DOMSettableTokenList".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.DOMTokenList"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DOMSettableTokenList Mozilla DOMSettableTokenList documentation>
newtype DOMSettableTokenList = DOMSettableTokenList { unDOMSettableTokenList :: JSRef }

instance Eq (DOMSettableTokenList) where
  (DOMSettableTokenList a) == (DOMSettableTokenList b) = js_eq a b

instance PToJSRef DOMSettableTokenList where
  pToJSRef = unDOMSettableTokenList
  {-# INLINE pToJSRef #-}

instance PFromJSRef DOMSettableTokenList where
  pFromJSRef = DOMSettableTokenList
  {-# INLINE pFromJSRef #-}

instance ToJSRef DOMSettableTokenList where
  toJSRef = return . unDOMSettableTokenList
  {-# INLINE toJSRef #-}

instance FromJSRef DOMSettableTokenList where
  fromJSRef = return . fmap DOMSettableTokenList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsDOMTokenList DOMSettableTokenList
instance IsGObject DOMSettableTokenList where
  toGObject = GObject . unDOMSettableTokenList
  {-# INLINE toGObject #-}
  unsafeCastGObject = DOMSettableTokenList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDOMSettableTokenList :: IsGObject obj => obj -> DOMSettableTokenList
castToDOMSettableTokenList = castTo gTypeDOMSettableTokenList "DOMSettableTokenList"

foreign import javascript unsafe "window[\"DOMSettableTokenList\"]" gTypeDOMSettableTokenList :: GType
#else
type IsDOMSettableTokenList o = DOMSettableTokenListClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DOMStringList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DOMStringList Mozilla DOMStringList documentation>
newtype DOMStringList = DOMStringList { unDOMStringList :: JSRef }

instance Eq (DOMStringList) where
  (DOMStringList a) == (DOMStringList b) = js_eq a b

instance PToJSRef DOMStringList where
  pToJSRef = unDOMStringList
  {-# INLINE pToJSRef #-}

instance PFromJSRef DOMStringList where
  pFromJSRef = DOMStringList
  {-# INLINE pFromJSRef #-}

instance ToJSRef DOMStringList where
  toJSRef = return . unDOMStringList
  {-# INLINE toJSRef #-}

instance FromJSRef DOMStringList where
  fromJSRef = return . fmap DOMStringList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject DOMStringList where
  toGObject = GObject . unDOMStringList
  {-# INLINE toGObject #-}
  unsafeCastGObject = DOMStringList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDOMStringList :: IsGObject obj => obj -> DOMStringList
castToDOMStringList = castTo gTypeDOMStringList "DOMStringList"

foreign import javascript unsafe "window[\"DOMStringList\"]" gTypeDOMStringList :: GType
#else
type IsDOMStringList o = DOMStringListClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DOMStringMap".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DOMStringMap Mozilla DOMStringMap documentation>
newtype DOMStringMap = DOMStringMap { unDOMStringMap :: JSRef }

instance Eq (DOMStringMap) where
  (DOMStringMap a) == (DOMStringMap b) = js_eq a b

instance PToJSRef DOMStringMap where
  pToJSRef = unDOMStringMap
  {-# INLINE pToJSRef #-}

instance PFromJSRef DOMStringMap where
  pFromJSRef = DOMStringMap
  {-# INLINE pFromJSRef #-}

instance ToJSRef DOMStringMap where
  toJSRef = return . unDOMStringMap
  {-# INLINE toJSRef #-}

instance FromJSRef DOMStringMap where
  fromJSRef = return . fmap DOMStringMap . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject DOMStringMap where
  toGObject = GObject . unDOMStringMap
  {-# INLINE toGObject #-}
  unsafeCastGObject = DOMStringMap . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDOMStringMap :: IsGObject obj => obj -> DOMStringMap
castToDOMStringMap = castTo gTypeDOMStringMap "DOMStringMap"

foreign import javascript unsafe "window[\"DOMStringMap\"]" gTypeDOMStringMap :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DOMTokenList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList Mozilla DOMTokenList documentation>
newtype DOMTokenList = DOMTokenList { unDOMTokenList :: JSRef }

instance Eq (DOMTokenList) where
  (DOMTokenList a) == (DOMTokenList b) = js_eq a b

instance PToJSRef DOMTokenList where
  pToJSRef = unDOMTokenList
  {-# INLINE pToJSRef #-}

instance PFromJSRef DOMTokenList where
  pFromJSRef = DOMTokenList
  {-# INLINE pFromJSRef #-}

instance ToJSRef DOMTokenList where
  toJSRef = return . unDOMTokenList
  {-# INLINE toJSRef #-}

instance FromJSRef DOMTokenList where
  fromJSRef = return . fmap DOMTokenList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsDOMTokenList o
toDOMTokenList :: IsDOMTokenList o => o -> DOMTokenList
toDOMTokenList = unsafeCastGObject . toGObject

instance IsDOMTokenList DOMTokenList
instance IsGObject DOMTokenList where
  toGObject = GObject . unDOMTokenList
  {-# INLINE toGObject #-}
  unsafeCastGObject = DOMTokenList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDOMTokenList :: IsGObject obj => obj -> DOMTokenList
castToDOMTokenList = castTo gTypeDOMTokenList "DOMTokenList"

foreign import javascript unsafe "window[\"DOMTokenList\"]" gTypeDOMTokenList :: GType
#else
type IsDOMTokenList o = DOMTokenListClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DataCue".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.TextTrackCue"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitDataCue Mozilla WebKitDataCue documentation>
newtype DataCue = DataCue { unDataCue :: JSRef }

instance Eq (DataCue) where
  (DataCue a) == (DataCue b) = js_eq a b

instance PToJSRef DataCue where
  pToJSRef = unDataCue
  {-# INLINE pToJSRef #-}

instance PFromJSRef DataCue where
  pFromJSRef = DataCue
  {-# INLINE pFromJSRef #-}

instance ToJSRef DataCue where
  toJSRef = return . unDataCue
  {-# INLINE toJSRef #-}

instance FromJSRef DataCue where
  fromJSRef = return . fmap DataCue . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsTextTrackCue DataCue
instance IsEventTarget DataCue
instance IsGObject DataCue where
  toGObject = GObject . unDataCue
  {-# INLINE toGObject #-}
  unsafeCastGObject = DataCue . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDataCue :: IsGObject obj => obj -> DataCue
castToDataCue = castTo gTypeDataCue "DataCue"

foreign import javascript unsafe "window[\"WebKitDataCue\"]" gTypeDataCue :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DataTransfer".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DataTransfer Mozilla DataTransfer documentation>
newtype DataTransfer = DataTransfer { unDataTransfer :: JSRef }

instance Eq (DataTransfer) where
  (DataTransfer a) == (DataTransfer b) = js_eq a b

instance PToJSRef DataTransfer where
  pToJSRef = unDataTransfer
  {-# INLINE pToJSRef #-}

instance PFromJSRef DataTransfer where
  pFromJSRef = DataTransfer
  {-# INLINE pFromJSRef #-}

instance ToJSRef DataTransfer where
  toJSRef = return . unDataTransfer
  {-# INLINE toJSRef #-}

instance FromJSRef DataTransfer where
  fromJSRef = return . fmap DataTransfer . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject DataTransfer where
  toGObject = GObject . unDataTransfer
  {-# INLINE toGObject #-}
  unsafeCastGObject = DataTransfer . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDataTransfer :: IsGObject obj => obj -> DataTransfer
castToDataTransfer = castTo gTypeDataTransfer "DataTransfer"

foreign import javascript unsafe "window[\"DataTransfer\"]" gTypeDataTransfer :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DataTransferItem".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DataTransferItem Mozilla DataTransferItem documentation>
newtype DataTransferItem = DataTransferItem { unDataTransferItem :: JSRef }

instance Eq (DataTransferItem) where
  (DataTransferItem a) == (DataTransferItem b) = js_eq a b

instance PToJSRef DataTransferItem where
  pToJSRef = unDataTransferItem
  {-# INLINE pToJSRef #-}

instance PFromJSRef DataTransferItem where
  pFromJSRef = DataTransferItem
  {-# INLINE pFromJSRef #-}

instance ToJSRef DataTransferItem where
  toJSRef = return . unDataTransferItem
  {-# INLINE toJSRef #-}

instance FromJSRef DataTransferItem where
  fromJSRef = return . fmap DataTransferItem . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject DataTransferItem where
  toGObject = GObject . unDataTransferItem
  {-# INLINE toGObject #-}
  unsafeCastGObject = DataTransferItem . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDataTransferItem :: IsGObject obj => obj -> DataTransferItem
castToDataTransferItem = castTo gTypeDataTransferItem "DataTransferItem"

foreign import javascript unsafe "window[\"DataTransferItem\"]" gTypeDataTransferItem :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DataTransferItemList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DataTransferItemList Mozilla DataTransferItemList documentation>
newtype DataTransferItemList = DataTransferItemList { unDataTransferItemList :: JSRef }

instance Eq (DataTransferItemList) where
  (DataTransferItemList a) == (DataTransferItemList b) = js_eq a b

instance PToJSRef DataTransferItemList where
  pToJSRef = unDataTransferItemList
  {-# INLINE pToJSRef #-}

instance PFromJSRef DataTransferItemList where
  pFromJSRef = DataTransferItemList
  {-# INLINE pFromJSRef #-}

instance ToJSRef DataTransferItemList where
  toJSRef = return . unDataTransferItemList
  {-# INLINE toJSRef #-}

instance FromJSRef DataTransferItemList where
  fromJSRef = return . fmap DataTransferItemList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject DataTransferItemList where
  toGObject = GObject . unDataTransferItemList
  {-# INLINE toGObject #-}
  unsafeCastGObject = DataTransferItemList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDataTransferItemList :: IsGObject obj => obj -> DataTransferItemList
castToDataTransferItemList = castTo gTypeDataTransferItemList "DataTransferItemList"

foreign import javascript unsafe "window[\"DataTransferItemList\"]" gTypeDataTransferItemList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Database".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Database Mozilla Database documentation>
newtype Database = Database { unDatabase :: JSRef }

instance Eq (Database) where
  (Database a) == (Database b) = js_eq a b

instance PToJSRef Database where
  pToJSRef = unDatabase
  {-# INLINE pToJSRef #-}

instance PFromJSRef Database where
  pFromJSRef = Database
  {-# INLINE pFromJSRef #-}

instance ToJSRef Database where
  toJSRef = return . unDatabase
  {-# INLINE toJSRef #-}

instance FromJSRef Database where
  fromJSRef = return . fmap Database . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Database where
  toGObject = GObject . unDatabase
  {-# INLINE toGObject #-}
  unsafeCastGObject = Database . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDatabase :: IsGObject obj => obj -> Database
castToDatabase = castTo gTypeDatabase "Database"

foreign import javascript unsafe "window[\"Database\"]" gTypeDatabase :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DedicatedWorkerGlobalScope".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.WorkerGlobalScope"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DedicatedWorkerGlobalScope Mozilla DedicatedWorkerGlobalScope documentation>
newtype DedicatedWorkerGlobalScope = DedicatedWorkerGlobalScope { unDedicatedWorkerGlobalScope :: JSRef }

instance Eq (DedicatedWorkerGlobalScope) where
  (DedicatedWorkerGlobalScope a) == (DedicatedWorkerGlobalScope b) = js_eq a b

instance PToJSRef DedicatedWorkerGlobalScope where
  pToJSRef = unDedicatedWorkerGlobalScope
  {-# INLINE pToJSRef #-}

instance PFromJSRef DedicatedWorkerGlobalScope where
  pFromJSRef = DedicatedWorkerGlobalScope
  {-# INLINE pFromJSRef #-}

instance ToJSRef DedicatedWorkerGlobalScope where
  toJSRef = return . unDedicatedWorkerGlobalScope
  {-# INLINE toJSRef #-}

instance FromJSRef DedicatedWorkerGlobalScope where
  fromJSRef = return . fmap DedicatedWorkerGlobalScope . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsWorkerGlobalScope DedicatedWorkerGlobalScope
instance IsEventTarget DedicatedWorkerGlobalScope
instance IsGObject DedicatedWorkerGlobalScope where
  toGObject = GObject . unDedicatedWorkerGlobalScope
  {-# INLINE toGObject #-}
  unsafeCastGObject = DedicatedWorkerGlobalScope . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDedicatedWorkerGlobalScope :: IsGObject obj => obj -> DedicatedWorkerGlobalScope
castToDedicatedWorkerGlobalScope = castTo gTypeDedicatedWorkerGlobalScope "DedicatedWorkerGlobalScope"

foreign import javascript unsafe "window[\"DedicatedWorkerGlobalScope\"]" gTypeDedicatedWorkerGlobalScope :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DelayNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DelayNode Mozilla DelayNode documentation>
newtype DelayNode = DelayNode { unDelayNode :: JSRef }

instance Eq (DelayNode) where
  (DelayNode a) == (DelayNode b) = js_eq a b

instance PToJSRef DelayNode where
  pToJSRef = unDelayNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef DelayNode where
  pFromJSRef = DelayNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef DelayNode where
  toJSRef = return . unDelayNode
  {-# INLINE toJSRef #-}

instance FromJSRef DelayNode where
  fromJSRef = return . fmap DelayNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode DelayNode
instance IsEventTarget DelayNode
instance IsGObject DelayNode where
  toGObject = GObject . unDelayNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = DelayNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDelayNode :: IsGObject obj => obj -> DelayNode
castToDelayNode = castTo gTypeDelayNode "DelayNode"

foreign import javascript unsafe "window[\"DelayNode\"]" gTypeDelayNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DeviceMotionEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DeviceMotionEvent Mozilla DeviceMotionEvent documentation>
newtype DeviceMotionEvent = DeviceMotionEvent { unDeviceMotionEvent :: JSRef }

instance Eq (DeviceMotionEvent) where
  (DeviceMotionEvent a) == (DeviceMotionEvent b) = js_eq a b

instance PToJSRef DeviceMotionEvent where
  pToJSRef = unDeviceMotionEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef DeviceMotionEvent where
  pFromJSRef = DeviceMotionEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef DeviceMotionEvent where
  toJSRef = return . unDeviceMotionEvent
  {-# INLINE toJSRef #-}

instance FromJSRef DeviceMotionEvent where
  fromJSRef = return . fmap DeviceMotionEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent DeviceMotionEvent
instance IsGObject DeviceMotionEvent where
  toGObject = GObject . unDeviceMotionEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = DeviceMotionEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDeviceMotionEvent :: IsGObject obj => obj -> DeviceMotionEvent
castToDeviceMotionEvent = castTo gTypeDeviceMotionEvent "DeviceMotionEvent"

foreign import javascript unsafe "window[\"DeviceMotionEvent\"]" gTypeDeviceMotionEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DeviceOrientationEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DeviceOrientationEvent Mozilla DeviceOrientationEvent documentation>
newtype DeviceOrientationEvent = DeviceOrientationEvent { unDeviceOrientationEvent :: JSRef }

instance Eq (DeviceOrientationEvent) where
  (DeviceOrientationEvent a) == (DeviceOrientationEvent b) = js_eq a b

instance PToJSRef DeviceOrientationEvent where
  pToJSRef = unDeviceOrientationEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef DeviceOrientationEvent where
  pFromJSRef = DeviceOrientationEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef DeviceOrientationEvent where
  toJSRef = return . unDeviceOrientationEvent
  {-# INLINE toJSRef #-}

instance FromJSRef DeviceOrientationEvent where
  fromJSRef = return . fmap DeviceOrientationEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent DeviceOrientationEvent
instance IsGObject DeviceOrientationEvent where
  toGObject = GObject . unDeviceOrientationEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = DeviceOrientationEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDeviceOrientationEvent :: IsGObject obj => obj -> DeviceOrientationEvent
castToDeviceOrientationEvent = castTo gTypeDeviceOrientationEvent "DeviceOrientationEvent"

foreign import javascript unsafe "window[\"DeviceOrientationEvent\"]" gTypeDeviceOrientationEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DeviceProximityEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DeviceProximityEvent Mozilla DeviceProximityEvent documentation>
newtype DeviceProximityEvent = DeviceProximityEvent { unDeviceProximityEvent :: JSRef }

instance Eq (DeviceProximityEvent) where
  (DeviceProximityEvent a) == (DeviceProximityEvent b) = js_eq a b

instance PToJSRef DeviceProximityEvent where
  pToJSRef = unDeviceProximityEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef DeviceProximityEvent where
  pFromJSRef = DeviceProximityEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef DeviceProximityEvent where
  toJSRef = return . unDeviceProximityEvent
  {-# INLINE toJSRef #-}

instance FromJSRef DeviceProximityEvent where
  fromJSRef = return . fmap DeviceProximityEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent DeviceProximityEvent
instance IsGObject DeviceProximityEvent where
  toGObject = GObject . unDeviceProximityEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = DeviceProximityEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDeviceProximityEvent :: IsGObject obj => obj -> DeviceProximityEvent
castToDeviceProximityEvent = castTo gTypeDeviceProximityEvent "DeviceProximityEvent"

foreign import javascript unsafe "window[\"DeviceProximityEvent\"]" gTypeDeviceProximityEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Document".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Document Mozilla Document documentation>
newtype Document = Document { unDocument :: JSRef }

instance Eq (Document) where
  (Document a) == (Document b) = js_eq a b

instance PToJSRef Document where
  pToJSRef = unDocument
  {-# INLINE pToJSRef #-}

instance PFromJSRef Document where
  pFromJSRef = Document
  {-# INLINE pFromJSRef #-}

instance ToJSRef Document where
  toJSRef = return . unDocument
  {-# INLINE toJSRef #-}

instance FromJSRef Document where
  fromJSRef = return . fmap Document . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsNode o => IsDocument o
toDocument :: IsDocument o => o -> Document
toDocument = unsafeCastGObject . toGObject

instance IsDocument Document
instance IsNode Document
instance IsEventTarget Document
instance IsGObject Document where
  toGObject = GObject . unDocument
  {-# INLINE toGObject #-}
  unsafeCastGObject = Document . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDocument :: IsGObject obj => obj -> Document
castToDocument = castTo gTypeDocument "Document"

foreign import javascript unsafe "window[\"Document\"]" gTypeDocument :: GType
#else
type IsDocument o = DocumentClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DocumentFragment".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment Mozilla DocumentFragment documentation>
newtype DocumentFragment = DocumentFragment { unDocumentFragment :: JSRef }

instance Eq (DocumentFragment) where
  (DocumentFragment a) == (DocumentFragment b) = js_eq a b

instance PToJSRef DocumentFragment where
  pToJSRef = unDocumentFragment
  {-# INLINE pToJSRef #-}

instance PFromJSRef DocumentFragment where
  pFromJSRef = DocumentFragment
  {-# INLINE pFromJSRef #-}

instance ToJSRef DocumentFragment where
  toJSRef = return . unDocumentFragment
  {-# INLINE toJSRef #-}

instance FromJSRef DocumentFragment where
  fromJSRef = return . fmap DocumentFragment . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsNode DocumentFragment
instance IsEventTarget DocumentFragment
instance IsGObject DocumentFragment where
  toGObject = GObject . unDocumentFragment
  {-# INLINE toGObject #-}
  unsafeCastGObject = DocumentFragment . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDocumentFragment :: IsGObject obj => obj -> DocumentFragment
castToDocumentFragment = castTo gTypeDocumentFragment "DocumentFragment"

foreign import javascript unsafe "window[\"DocumentFragment\"]" gTypeDocumentFragment :: GType
#else
type IsDocumentFragment o = DocumentFragmentClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DocumentType".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DocumentType Mozilla DocumentType documentation>
newtype DocumentType = DocumentType { unDocumentType :: JSRef }

instance Eq (DocumentType) where
  (DocumentType a) == (DocumentType b) = js_eq a b

instance PToJSRef DocumentType where
  pToJSRef = unDocumentType
  {-# INLINE pToJSRef #-}

instance PFromJSRef DocumentType where
  pFromJSRef = DocumentType
  {-# INLINE pFromJSRef #-}

instance ToJSRef DocumentType where
  toJSRef = return . unDocumentType
  {-# INLINE toJSRef #-}

instance FromJSRef DocumentType where
  fromJSRef = return . fmap DocumentType . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsNode DocumentType
instance IsEventTarget DocumentType
instance IsGObject DocumentType where
  toGObject = GObject . unDocumentType
  {-# INLINE toGObject #-}
  unsafeCastGObject = DocumentType . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDocumentType :: IsGObject obj => obj -> DocumentType
castToDocumentType = castTo gTypeDocumentType "DocumentType"

foreign import javascript unsafe "window[\"DocumentType\"]" gTypeDocumentType :: GType
#else
type IsDocumentType o = DocumentTypeClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.DynamicsCompressorNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/DynamicsCompressorNode Mozilla DynamicsCompressorNode documentation>
newtype DynamicsCompressorNode = DynamicsCompressorNode { unDynamicsCompressorNode :: JSRef }

instance Eq (DynamicsCompressorNode) where
  (DynamicsCompressorNode a) == (DynamicsCompressorNode b) = js_eq a b

instance PToJSRef DynamicsCompressorNode where
  pToJSRef = unDynamicsCompressorNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef DynamicsCompressorNode where
  pFromJSRef = DynamicsCompressorNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef DynamicsCompressorNode where
  toJSRef = return . unDynamicsCompressorNode
  {-# INLINE toJSRef #-}

instance FromJSRef DynamicsCompressorNode where
  fromJSRef = return . fmap DynamicsCompressorNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode DynamicsCompressorNode
instance IsEventTarget DynamicsCompressorNode
instance IsGObject DynamicsCompressorNode where
  toGObject = GObject . unDynamicsCompressorNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = DynamicsCompressorNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToDynamicsCompressorNode :: IsGObject obj => obj -> DynamicsCompressorNode
castToDynamicsCompressorNode = castTo gTypeDynamicsCompressorNode "DynamicsCompressorNode"

foreign import javascript unsafe "window[\"DynamicsCompressorNode\"]" gTypeDynamicsCompressorNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.EXTBlendMinMax".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/EXTBlendMinMax Mozilla EXTBlendMinMax documentation>
newtype EXTBlendMinMax = EXTBlendMinMax { unEXTBlendMinMax :: JSRef }

instance Eq (EXTBlendMinMax) where
  (EXTBlendMinMax a) == (EXTBlendMinMax b) = js_eq a b

instance PToJSRef EXTBlendMinMax where
  pToJSRef = unEXTBlendMinMax
  {-# INLINE pToJSRef #-}

instance PFromJSRef EXTBlendMinMax where
  pFromJSRef = EXTBlendMinMax
  {-# INLINE pFromJSRef #-}

instance ToJSRef EXTBlendMinMax where
  toJSRef = return . unEXTBlendMinMax
  {-# INLINE toJSRef #-}

instance FromJSRef EXTBlendMinMax where
  fromJSRef = return . fmap EXTBlendMinMax . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject EXTBlendMinMax where
  toGObject = GObject . unEXTBlendMinMax
  {-# INLINE toGObject #-}
  unsafeCastGObject = EXTBlendMinMax . unGObject
  {-# INLINE unsafeCastGObject #-}

castToEXTBlendMinMax :: IsGObject obj => obj -> EXTBlendMinMax
castToEXTBlendMinMax = castTo gTypeEXTBlendMinMax "EXTBlendMinMax"

foreign import javascript unsafe "window[\"EXTBlendMinMax\"]" gTypeEXTBlendMinMax :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.EXTFragDepth".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/EXTFragDepth Mozilla EXTFragDepth documentation>
newtype EXTFragDepth = EXTFragDepth { unEXTFragDepth :: JSRef }

instance Eq (EXTFragDepth) where
  (EXTFragDepth a) == (EXTFragDepth b) = js_eq a b

instance PToJSRef EXTFragDepth where
  pToJSRef = unEXTFragDepth
  {-# INLINE pToJSRef #-}

instance PFromJSRef EXTFragDepth where
  pFromJSRef = EXTFragDepth
  {-# INLINE pFromJSRef #-}

instance ToJSRef EXTFragDepth where
  toJSRef = return . unEXTFragDepth
  {-# INLINE toJSRef #-}

instance FromJSRef EXTFragDepth where
  fromJSRef = return . fmap EXTFragDepth . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject EXTFragDepth where
  toGObject = GObject . unEXTFragDepth
  {-# INLINE toGObject #-}
  unsafeCastGObject = EXTFragDepth . unGObject
  {-# INLINE unsafeCastGObject #-}

castToEXTFragDepth :: IsGObject obj => obj -> EXTFragDepth
castToEXTFragDepth = castTo gTypeEXTFragDepth "EXTFragDepth"

foreign import javascript unsafe "window[\"EXTFragDepth\"]" gTypeEXTFragDepth :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.EXTShaderTextureLOD".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/EXTShaderTextureLOD Mozilla EXTShaderTextureLOD documentation>
newtype EXTShaderTextureLOD = EXTShaderTextureLOD { unEXTShaderTextureLOD :: JSRef }

instance Eq (EXTShaderTextureLOD) where
  (EXTShaderTextureLOD a) == (EXTShaderTextureLOD b) = js_eq a b

instance PToJSRef EXTShaderTextureLOD where
  pToJSRef = unEXTShaderTextureLOD
  {-# INLINE pToJSRef #-}

instance PFromJSRef EXTShaderTextureLOD where
  pFromJSRef = EXTShaderTextureLOD
  {-# INLINE pFromJSRef #-}

instance ToJSRef EXTShaderTextureLOD where
  toJSRef = return . unEXTShaderTextureLOD
  {-# INLINE toJSRef #-}

instance FromJSRef EXTShaderTextureLOD where
  fromJSRef = return . fmap EXTShaderTextureLOD . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject EXTShaderTextureLOD where
  toGObject = GObject . unEXTShaderTextureLOD
  {-# INLINE toGObject #-}
  unsafeCastGObject = EXTShaderTextureLOD . unGObject
  {-# INLINE unsafeCastGObject #-}

castToEXTShaderTextureLOD :: IsGObject obj => obj -> EXTShaderTextureLOD
castToEXTShaderTextureLOD = castTo gTypeEXTShaderTextureLOD "EXTShaderTextureLOD"

foreign import javascript unsafe "window[\"EXTShaderTextureLOD\"]" gTypeEXTShaderTextureLOD :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.EXTTextureFilterAnisotropic".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/EXTTextureFilterAnisotropic Mozilla EXTTextureFilterAnisotropic documentation>
newtype EXTTextureFilterAnisotropic = EXTTextureFilterAnisotropic { unEXTTextureFilterAnisotropic :: JSRef }

instance Eq (EXTTextureFilterAnisotropic) where
  (EXTTextureFilterAnisotropic a) == (EXTTextureFilterAnisotropic b) = js_eq a b

instance PToJSRef EXTTextureFilterAnisotropic where
  pToJSRef = unEXTTextureFilterAnisotropic
  {-# INLINE pToJSRef #-}

instance PFromJSRef EXTTextureFilterAnisotropic where
  pFromJSRef = EXTTextureFilterAnisotropic
  {-# INLINE pFromJSRef #-}

instance ToJSRef EXTTextureFilterAnisotropic where
  toJSRef = return . unEXTTextureFilterAnisotropic
  {-# INLINE toJSRef #-}

instance FromJSRef EXTTextureFilterAnisotropic where
  fromJSRef = return . fmap EXTTextureFilterAnisotropic . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject EXTTextureFilterAnisotropic where
  toGObject = GObject . unEXTTextureFilterAnisotropic
  {-# INLINE toGObject #-}
  unsafeCastGObject = EXTTextureFilterAnisotropic . unGObject
  {-# INLINE unsafeCastGObject #-}

castToEXTTextureFilterAnisotropic :: IsGObject obj => obj -> EXTTextureFilterAnisotropic
castToEXTTextureFilterAnisotropic = castTo gTypeEXTTextureFilterAnisotropic "EXTTextureFilterAnisotropic"

foreign import javascript unsafe "window[\"EXTTextureFilterAnisotropic\"]" gTypeEXTTextureFilterAnisotropic :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.EXTsRGB".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/EXTsRGB Mozilla EXTsRGB documentation>
newtype EXTsRGB = EXTsRGB { unEXTsRGB :: JSRef }

instance Eq (EXTsRGB) where
  (EXTsRGB a) == (EXTsRGB b) = js_eq a b

instance PToJSRef EXTsRGB where
  pToJSRef = unEXTsRGB
  {-# INLINE pToJSRef #-}

instance PFromJSRef EXTsRGB where
  pFromJSRef = EXTsRGB
  {-# INLINE pFromJSRef #-}

instance ToJSRef EXTsRGB where
  toJSRef = return . unEXTsRGB
  {-# INLINE toJSRef #-}

instance FromJSRef EXTsRGB where
  fromJSRef = return . fmap EXTsRGB . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject EXTsRGB where
  toGObject = GObject . unEXTsRGB
  {-# INLINE toGObject #-}
  unsafeCastGObject = EXTsRGB . unGObject
  {-# INLINE unsafeCastGObject #-}

castToEXTsRGB :: IsGObject obj => obj -> EXTsRGB
castToEXTsRGB = castTo gTypeEXTsRGB "EXTsRGB"

foreign import javascript unsafe "window[\"EXTsRGB\"]" gTypeEXTsRGB :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Element".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Element Mozilla Element documentation>
newtype Element = Element { unElement :: JSRef }

instance Eq (Element) where
  (Element a) == (Element b) = js_eq a b

instance PToJSRef Element where
  pToJSRef = unElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef Element where
  pFromJSRef = Element
  {-# INLINE pFromJSRef #-}

instance ToJSRef Element where
  toJSRef = return . unElement
  {-# INLINE toJSRef #-}

instance FromJSRef Element where
  fromJSRef = return . fmap Element . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsNode o => IsElement o
toElement :: IsElement o => o -> Element
toElement = unsafeCastGObject . toGObject

instance IsElement Element
instance IsNode Element
instance IsEventTarget Element
instance IsGObject Element where
  toGObject = GObject . unElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = Element . unGObject
  {-# INLINE unsafeCastGObject #-}

castToElement :: IsGObject obj => obj -> Element
castToElement = castTo gTypeElement "Element"

foreign import javascript unsafe "window[\"Element\"]" gTypeElement :: GType
#else
type IsElement o = ElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Entity".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Entity Mozilla Entity documentation>
newtype Entity = Entity { unEntity :: JSRef }

instance Eq (Entity) where
  (Entity a) == (Entity b) = js_eq a b

instance PToJSRef Entity where
  pToJSRef = unEntity
  {-# INLINE pToJSRef #-}

instance PFromJSRef Entity where
  pFromJSRef = Entity
  {-# INLINE pFromJSRef #-}

instance ToJSRef Entity where
  toJSRef = return . unEntity
  {-# INLINE toJSRef #-}

instance FromJSRef Entity where
  fromJSRef = return . fmap Entity . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsNode Entity
instance IsEventTarget Entity
instance IsGObject Entity where
  toGObject = GObject . unEntity
  {-# INLINE toGObject #-}
  unsafeCastGObject = Entity . unGObject
  {-# INLINE unsafeCastGObject #-}

castToEntity :: IsGObject obj => obj -> Entity
castToEntity = castTo gTypeEntity "Entity"

foreign import javascript unsafe "window[\"Entity\"]" gTypeEntity :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.EntityReference".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/EntityReference Mozilla EntityReference documentation>
newtype EntityReference = EntityReference { unEntityReference :: JSRef }

instance Eq (EntityReference) where
  (EntityReference a) == (EntityReference b) = js_eq a b

instance PToJSRef EntityReference where
  pToJSRef = unEntityReference
  {-# INLINE pToJSRef #-}

instance PFromJSRef EntityReference where
  pFromJSRef = EntityReference
  {-# INLINE pFromJSRef #-}

instance ToJSRef EntityReference where
  toJSRef = return . unEntityReference
  {-# INLINE toJSRef #-}

instance FromJSRef EntityReference where
  fromJSRef = return . fmap EntityReference . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsNode EntityReference
instance IsEventTarget EntityReference
instance IsGObject EntityReference where
  toGObject = GObject . unEntityReference
  {-# INLINE toGObject #-}
  unsafeCastGObject = EntityReference . unGObject
  {-# INLINE unsafeCastGObject #-}

castToEntityReference :: IsGObject obj => obj -> EntityReference
castToEntityReference = castTo gTypeEntityReference "EntityReference"

foreign import javascript unsafe "window[\"EntityReference\"]" gTypeEntityReference :: GType
#else
type IsEntityReference o = EntityReferenceClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ErrorEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ErrorEvent Mozilla ErrorEvent documentation>
newtype ErrorEvent = ErrorEvent { unErrorEvent :: JSRef }

instance Eq (ErrorEvent) where
  (ErrorEvent a) == (ErrorEvent b) = js_eq a b

instance PToJSRef ErrorEvent where
  pToJSRef = unErrorEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef ErrorEvent where
  pFromJSRef = ErrorEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef ErrorEvent where
  toJSRef = return . unErrorEvent
  {-# INLINE toJSRef #-}

instance FromJSRef ErrorEvent where
  fromJSRef = return . fmap ErrorEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent ErrorEvent
instance IsGObject ErrorEvent where
  toGObject = GObject . unErrorEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = ErrorEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToErrorEvent :: IsGObject obj => obj -> ErrorEvent
castToErrorEvent = castTo gTypeErrorEvent "ErrorEvent"

foreign import javascript unsafe "window[\"ErrorEvent\"]" gTypeErrorEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Event".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Event Mozilla Event documentation>
newtype Event = Event { unEvent :: JSRef }

instance Eq (Event) where
  (Event a) == (Event b) = js_eq a b

instance PToJSRef Event where
  pToJSRef = unEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef Event where
  pFromJSRef = Event
  {-# INLINE pFromJSRef #-}

instance ToJSRef Event where
  toJSRef = return . unEvent
  {-# INLINE toJSRef #-}

instance FromJSRef Event where
  fromJSRef = return . fmap Event . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsEvent o
toEvent :: IsEvent o => o -> Event
toEvent = unsafeCastGObject . toGObject

instance IsEvent Event
instance IsGObject Event where
  toGObject = GObject . unEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = Event . unGObject
  {-# INLINE unsafeCastGObject #-}

castToEvent :: IsGObject obj => obj -> Event
castToEvent = castTo gTypeEvent "Event"

foreign import javascript unsafe "window[\"Event\"]" gTypeEvent :: GType
#else
type IsEvent o = EventClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.EventListener".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/EventListener Mozilla EventListener documentation>
newtype EventListener = EventListener { unEventListener :: JSRef }

instance Eq (EventListener) where
  (EventListener a) == (EventListener b) = js_eq a b

instance PToJSRef EventListener where
  pToJSRef = unEventListener
  {-# INLINE pToJSRef #-}

instance PFromJSRef EventListener where
  pFromJSRef = EventListener
  {-# INLINE pFromJSRef #-}

instance ToJSRef EventListener where
  toJSRef = return . unEventListener
  {-# INLINE toJSRef #-}

instance FromJSRef EventListener where
  fromJSRef = return . fmap EventListener . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject EventListener where
  toGObject = GObject . unEventListener
  {-# INLINE toGObject #-}
  unsafeCastGObject = EventListener . unGObject
  {-# INLINE unsafeCastGObject #-}

castToEventListener :: IsGObject obj => obj -> EventListener
castToEventListener = castTo gTypeEventListener "EventListener"

foreign import javascript unsafe "window[\"EventListener\"]" gTypeEventListener :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.EventSource".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/EventSource Mozilla EventSource documentation>
newtype EventSource = EventSource { unEventSource :: JSRef }

instance Eq (EventSource) where
  (EventSource a) == (EventSource b) = js_eq a b

instance PToJSRef EventSource where
  pToJSRef = unEventSource
  {-# INLINE pToJSRef #-}

instance PFromJSRef EventSource where
  pFromJSRef = EventSource
  {-# INLINE pFromJSRef #-}

instance ToJSRef EventSource where
  toJSRef = return . unEventSource
  {-# INLINE toJSRef #-}

instance FromJSRef EventSource where
  fromJSRef = return . fmap EventSource . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget EventSource
instance IsGObject EventSource where
  toGObject = GObject . unEventSource
  {-# INLINE toGObject #-}
  unsafeCastGObject = EventSource . unGObject
  {-# INLINE unsafeCastGObject #-}

castToEventSource :: IsGObject obj => obj -> EventSource
castToEventSource = castTo gTypeEventSource "EventSource"

foreign import javascript unsafe "window[\"EventSource\"]" gTypeEventSource :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.EventTarget".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/EventTarget Mozilla EventTarget documentation>
newtype EventTarget = EventTarget { unEventTarget :: JSRef }

instance Eq (EventTarget) where
  (EventTarget a) == (EventTarget b) = js_eq a b

instance PToJSRef EventTarget where
  pToJSRef = unEventTarget
  {-# INLINE pToJSRef #-}

instance PFromJSRef EventTarget where
  pFromJSRef = EventTarget
  {-# INLINE pFromJSRef #-}

instance ToJSRef EventTarget where
  toJSRef = return . unEventTarget
  {-# INLINE toJSRef #-}

instance FromJSRef EventTarget where
  fromJSRef = return . fmap EventTarget . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsEventTarget o
toEventTarget :: IsEventTarget o => o -> EventTarget
toEventTarget = unsafeCastGObject . toGObject

instance IsEventTarget EventTarget
instance IsGObject EventTarget where
  toGObject = GObject . unEventTarget
  {-# INLINE toGObject #-}
  unsafeCastGObject = EventTarget . unGObject
  {-# INLINE unsafeCastGObject #-}

castToEventTarget :: IsGObject obj => obj -> EventTarget
castToEventTarget = castTo gTypeEventTarget "EventTarget"

foreign import javascript unsafe "window[\"EventTarget\"]" gTypeEventTarget :: GType
#else
type IsEventTarget o = EventTargetClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.File".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Blob"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/File Mozilla File documentation>
newtype File = File { unFile :: JSRef }

instance Eq (File) where
  (File a) == (File b) = js_eq a b

instance PToJSRef File where
  pToJSRef = unFile
  {-# INLINE pToJSRef #-}

instance PFromJSRef File where
  pFromJSRef = File
  {-# INLINE pFromJSRef #-}

instance ToJSRef File where
  toJSRef = return . unFile
  {-# INLINE toJSRef #-}

instance FromJSRef File where
  fromJSRef = return . fmap File . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsBlob File
instance IsGObject File where
  toGObject = GObject . unFile
  {-# INLINE toGObject #-}
  unsafeCastGObject = File . unGObject
  {-# INLINE unsafeCastGObject #-}

castToFile :: IsGObject obj => obj -> File
castToFile = castTo gTypeFile "File"

foreign import javascript unsafe "window[\"File\"]" gTypeFile :: GType
#else
type IsFile o = FileClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.FileError".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/FileError Mozilla FileError documentation>
newtype FileError = FileError { unFileError :: JSRef }

instance Eq (FileError) where
  (FileError a) == (FileError b) = js_eq a b

instance PToJSRef FileError where
  pToJSRef = unFileError
  {-# INLINE pToJSRef #-}

instance PFromJSRef FileError where
  pFromJSRef = FileError
  {-# INLINE pFromJSRef #-}

instance ToJSRef FileError where
  toJSRef = return . unFileError
  {-# INLINE toJSRef #-}

instance FromJSRef FileError where
  fromJSRef = return . fmap FileError . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject FileError where
  toGObject = GObject . unFileError
  {-# INLINE toGObject #-}
  unsafeCastGObject = FileError . unGObject
  {-# INLINE unsafeCastGObject #-}

castToFileError :: IsGObject obj => obj -> FileError
castToFileError = castTo gTypeFileError "FileError"

foreign import javascript unsafe "window[\"FileError\"]" gTypeFileError :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.FileList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/FileList Mozilla FileList documentation>
newtype FileList = FileList { unFileList :: JSRef }

instance Eq (FileList) where
  (FileList a) == (FileList b) = js_eq a b

instance PToJSRef FileList where
  pToJSRef = unFileList
  {-# INLINE pToJSRef #-}

instance PFromJSRef FileList where
  pFromJSRef = FileList
  {-# INLINE pFromJSRef #-}

instance ToJSRef FileList where
  toJSRef = return . unFileList
  {-# INLINE toJSRef #-}

instance FromJSRef FileList where
  fromJSRef = return . fmap FileList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject FileList where
  toGObject = GObject . unFileList
  {-# INLINE toGObject #-}
  unsafeCastGObject = FileList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToFileList :: IsGObject obj => obj -> FileList
castToFileList = castTo gTypeFileList "FileList"

foreign import javascript unsafe "window[\"FileList\"]" gTypeFileList :: GType
#else
type IsFileList o = FileListClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.FileReader".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/FileReader Mozilla FileReader documentation>
newtype FileReader = FileReader { unFileReader :: JSRef }

instance Eq (FileReader) where
  (FileReader a) == (FileReader b) = js_eq a b

instance PToJSRef FileReader where
  pToJSRef = unFileReader
  {-# INLINE pToJSRef #-}

instance PFromJSRef FileReader where
  pFromJSRef = FileReader
  {-# INLINE pFromJSRef #-}

instance ToJSRef FileReader where
  toJSRef = return . unFileReader
  {-# INLINE toJSRef #-}

instance FromJSRef FileReader where
  fromJSRef = return . fmap FileReader . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget FileReader
instance IsGObject FileReader where
  toGObject = GObject . unFileReader
  {-# INLINE toGObject #-}
  unsafeCastGObject = FileReader . unGObject
  {-# INLINE unsafeCastGObject #-}

castToFileReader :: IsGObject obj => obj -> FileReader
castToFileReader = castTo gTypeFileReader "FileReader"

foreign import javascript unsafe "window[\"FileReader\"]" gTypeFileReader :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.FileReaderSync".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/FileReaderSync Mozilla FileReaderSync documentation>
newtype FileReaderSync = FileReaderSync { unFileReaderSync :: JSRef }

instance Eq (FileReaderSync) where
  (FileReaderSync a) == (FileReaderSync b) = js_eq a b

instance PToJSRef FileReaderSync where
  pToJSRef = unFileReaderSync
  {-# INLINE pToJSRef #-}

instance PFromJSRef FileReaderSync where
  pFromJSRef = FileReaderSync
  {-# INLINE pFromJSRef #-}

instance ToJSRef FileReaderSync where
  toJSRef = return . unFileReaderSync
  {-# INLINE toJSRef #-}

instance FromJSRef FileReaderSync where
  fromJSRef = return . fmap FileReaderSync . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject FileReaderSync where
  toGObject = GObject . unFileReaderSync
  {-# INLINE toGObject #-}
  unsafeCastGObject = FileReaderSync . unGObject
  {-# INLINE unsafeCastGObject #-}

castToFileReaderSync :: IsGObject obj => obj -> FileReaderSync
castToFileReaderSync = castTo gTypeFileReaderSync "FileReaderSync"

foreign import javascript unsafe "window[\"FileReaderSync\"]" gTypeFileReaderSync :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.FocusEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.UIEvent"
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/FocusEvent Mozilla FocusEvent documentation>
newtype FocusEvent = FocusEvent { unFocusEvent :: JSRef }

instance Eq (FocusEvent) where
  (FocusEvent a) == (FocusEvent b) = js_eq a b

instance PToJSRef FocusEvent where
  pToJSRef = unFocusEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef FocusEvent where
  pFromJSRef = FocusEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef FocusEvent where
  toJSRef = return . unFocusEvent
  {-# INLINE toJSRef #-}

instance FromJSRef FocusEvent where
  fromJSRef = return . fmap FocusEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsUIEvent FocusEvent
instance IsEvent FocusEvent
instance IsGObject FocusEvent where
  toGObject = GObject . unFocusEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = FocusEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToFocusEvent :: IsGObject obj => obj -> FocusEvent
castToFocusEvent = castTo gTypeFocusEvent "FocusEvent"

foreign import javascript unsafe "window[\"FocusEvent\"]" gTypeFocusEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.FontLoader".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/FontLoader Mozilla FontLoader documentation>
newtype FontLoader = FontLoader { unFontLoader :: JSRef }

instance Eq (FontLoader) where
  (FontLoader a) == (FontLoader b) = js_eq a b

instance PToJSRef FontLoader where
  pToJSRef = unFontLoader
  {-# INLINE pToJSRef #-}

instance PFromJSRef FontLoader where
  pFromJSRef = FontLoader
  {-# INLINE pFromJSRef #-}

instance ToJSRef FontLoader where
  toJSRef = return . unFontLoader
  {-# INLINE toJSRef #-}

instance FromJSRef FontLoader where
  fromJSRef = return . fmap FontLoader . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget FontLoader
instance IsGObject FontLoader where
  toGObject = GObject . unFontLoader
  {-# INLINE toGObject #-}
  unsafeCastGObject = FontLoader . unGObject
  {-# INLINE unsafeCastGObject #-}

castToFontLoader :: IsGObject obj => obj -> FontLoader
castToFontLoader = castTo gTypeFontLoader "FontLoader"

foreign import javascript unsafe "window[\"FontLoader\"]" gTypeFontLoader :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.FormData".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/FormData Mozilla FormData documentation>
newtype FormData = FormData { unFormData :: JSRef }

instance Eq (FormData) where
  (FormData a) == (FormData b) = js_eq a b

instance PToJSRef FormData where
  pToJSRef = unFormData
  {-# INLINE pToJSRef #-}

instance PFromJSRef FormData where
  pFromJSRef = FormData
  {-# INLINE pFromJSRef #-}

instance ToJSRef FormData where
  toJSRef = return . unFormData
  {-# INLINE toJSRef #-}

instance FromJSRef FormData where
  fromJSRef = return . fmap FormData . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject FormData where
  toGObject = GObject . unFormData
  {-# INLINE toGObject #-}
  unsafeCastGObject = FormData . unGObject
  {-# INLINE unsafeCastGObject #-}

castToFormData :: IsGObject obj => obj -> FormData
castToFormData = castTo gTypeFormData "FormData"

foreign import javascript unsafe "window[\"FormData\"]" gTypeFormData :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.GainNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/GainNode Mozilla GainNode documentation>
newtype GainNode = GainNode { unGainNode :: JSRef }

instance Eq (GainNode) where
  (GainNode a) == (GainNode b) = js_eq a b

instance PToJSRef GainNode where
  pToJSRef = unGainNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef GainNode where
  pFromJSRef = GainNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef GainNode where
  toJSRef = return . unGainNode
  {-# INLINE toJSRef #-}

instance FromJSRef GainNode where
  fromJSRef = return . fmap GainNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode GainNode
instance IsEventTarget GainNode
instance IsGObject GainNode where
  toGObject = GObject . unGainNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = GainNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToGainNode :: IsGObject obj => obj -> GainNode
castToGainNode = castTo gTypeGainNode "GainNode"

foreign import javascript unsafe "window[\"GainNode\"]" gTypeGainNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Gamepad".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Gamepad Mozilla Gamepad documentation>
newtype Gamepad = Gamepad { unGamepad :: JSRef }

instance Eq (Gamepad) where
  (Gamepad a) == (Gamepad b) = js_eq a b

instance PToJSRef Gamepad where
  pToJSRef = unGamepad
  {-# INLINE pToJSRef #-}

instance PFromJSRef Gamepad where
  pFromJSRef = Gamepad
  {-# INLINE pFromJSRef #-}

instance ToJSRef Gamepad where
  toJSRef = return . unGamepad
  {-# INLINE toJSRef #-}

instance FromJSRef Gamepad where
  fromJSRef = return . fmap Gamepad . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Gamepad where
  toGObject = GObject . unGamepad
  {-# INLINE toGObject #-}
  unsafeCastGObject = Gamepad . unGObject
  {-# INLINE unsafeCastGObject #-}

castToGamepad :: IsGObject obj => obj -> Gamepad
castToGamepad = castTo gTypeGamepad "Gamepad"

foreign import javascript unsafe "window[\"Gamepad\"]" gTypeGamepad :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.GamepadButton".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/GamepadButton Mozilla GamepadButton documentation>
newtype GamepadButton = GamepadButton { unGamepadButton :: JSRef }

instance Eq (GamepadButton) where
  (GamepadButton a) == (GamepadButton b) = js_eq a b

instance PToJSRef GamepadButton where
  pToJSRef = unGamepadButton
  {-# INLINE pToJSRef #-}

instance PFromJSRef GamepadButton where
  pFromJSRef = GamepadButton
  {-# INLINE pFromJSRef #-}

instance ToJSRef GamepadButton where
  toJSRef = return . unGamepadButton
  {-# INLINE toJSRef #-}

instance FromJSRef GamepadButton where
  fromJSRef = return . fmap GamepadButton . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject GamepadButton where
  toGObject = GObject . unGamepadButton
  {-# INLINE toGObject #-}
  unsafeCastGObject = GamepadButton . unGObject
  {-# INLINE unsafeCastGObject #-}

castToGamepadButton :: IsGObject obj => obj -> GamepadButton
castToGamepadButton = castTo gTypeGamepadButton "GamepadButton"

foreign import javascript unsafe "window[\"GamepadButton\"]" gTypeGamepadButton :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.GamepadEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/GamepadEvent Mozilla GamepadEvent documentation>
newtype GamepadEvent = GamepadEvent { unGamepadEvent :: JSRef }

instance Eq (GamepadEvent) where
  (GamepadEvent a) == (GamepadEvent b) = js_eq a b

instance PToJSRef GamepadEvent where
  pToJSRef = unGamepadEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef GamepadEvent where
  pFromJSRef = GamepadEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef GamepadEvent where
  toJSRef = return . unGamepadEvent
  {-# INLINE toJSRef #-}

instance FromJSRef GamepadEvent where
  fromJSRef = return . fmap GamepadEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent GamepadEvent
instance IsGObject GamepadEvent where
  toGObject = GObject . unGamepadEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = GamepadEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToGamepadEvent :: IsGObject obj => obj -> GamepadEvent
castToGamepadEvent = castTo gTypeGamepadEvent "GamepadEvent"

foreign import javascript unsafe "window[\"GamepadEvent\"]" gTypeGamepadEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Geolocation".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Geolocation Mozilla Geolocation documentation>
newtype Geolocation = Geolocation { unGeolocation :: JSRef }

instance Eq (Geolocation) where
  (Geolocation a) == (Geolocation b) = js_eq a b

instance PToJSRef Geolocation where
  pToJSRef = unGeolocation
  {-# INLINE pToJSRef #-}

instance PFromJSRef Geolocation where
  pFromJSRef = Geolocation
  {-# INLINE pFromJSRef #-}

instance ToJSRef Geolocation where
  toJSRef = return . unGeolocation
  {-# INLINE toJSRef #-}

instance FromJSRef Geolocation where
  fromJSRef = return . fmap Geolocation . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Geolocation where
  toGObject = GObject . unGeolocation
  {-# INLINE toGObject #-}
  unsafeCastGObject = Geolocation . unGObject
  {-# INLINE unsafeCastGObject #-}

castToGeolocation :: IsGObject obj => obj -> Geolocation
castToGeolocation = castTo gTypeGeolocation "Geolocation"

foreign import javascript unsafe "window[\"Geolocation\"]" gTypeGeolocation :: GType
#else
type IsGeolocation o = GeolocationClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Geoposition".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Geoposition Mozilla Geoposition documentation>
newtype Geoposition = Geoposition { unGeoposition :: JSRef }

instance Eq (Geoposition) where
  (Geoposition a) == (Geoposition b) = js_eq a b

instance PToJSRef Geoposition where
  pToJSRef = unGeoposition
  {-# INLINE pToJSRef #-}

instance PFromJSRef Geoposition where
  pFromJSRef = Geoposition
  {-# INLINE pFromJSRef #-}

instance ToJSRef Geoposition where
  toJSRef = return . unGeoposition
  {-# INLINE toJSRef #-}

instance FromJSRef Geoposition where
  fromJSRef = return . fmap Geoposition . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Geoposition where
  toGObject = GObject . unGeoposition
  {-# INLINE toGObject #-}
  unsafeCastGObject = Geoposition . unGObject
  {-# INLINE unsafeCastGObject #-}

castToGeoposition :: IsGObject obj => obj -> Geoposition
castToGeoposition = castTo gTypeGeoposition "Geoposition"

foreign import javascript unsafe "window[\"Geoposition\"]" gTypeGeoposition :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLAllCollection".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLAllCollection Mozilla HTMLAllCollection documentation>
newtype HTMLAllCollection = HTMLAllCollection { unHTMLAllCollection :: JSRef }

instance Eq (HTMLAllCollection) where
  (HTMLAllCollection a) == (HTMLAllCollection b) = js_eq a b

instance PToJSRef HTMLAllCollection where
  pToJSRef = unHTMLAllCollection
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLAllCollection where
  pFromJSRef = HTMLAllCollection
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLAllCollection where
  toJSRef = return . unHTMLAllCollection
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLAllCollection where
  fromJSRef = return . fmap HTMLAllCollection . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject HTMLAllCollection where
  toGObject = GObject . unHTMLAllCollection
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLAllCollection . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLAllCollection :: IsGObject obj => obj -> HTMLAllCollection
castToHTMLAllCollection = castTo gTypeHTMLAllCollection "HTMLAllCollection"

foreign import javascript unsafe "window[\"HTMLAllCollection\"]" gTypeHTMLAllCollection :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLAnchorElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLAnchorElement Mozilla HTMLAnchorElement documentation>
newtype HTMLAnchorElement = HTMLAnchorElement { unHTMLAnchorElement :: JSRef }

instance Eq (HTMLAnchorElement) where
  (HTMLAnchorElement a) == (HTMLAnchorElement b) = js_eq a b

instance PToJSRef HTMLAnchorElement where
  pToJSRef = unHTMLAnchorElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLAnchorElement where
  pFromJSRef = HTMLAnchorElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLAnchorElement where
  toJSRef = return . unHTMLAnchorElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLAnchorElement where
  fromJSRef = return . fmap HTMLAnchorElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLAnchorElement
instance IsElement HTMLAnchorElement
instance IsNode HTMLAnchorElement
instance IsEventTarget HTMLAnchorElement
instance IsGObject HTMLAnchorElement where
  toGObject = GObject . unHTMLAnchorElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLAnchorElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLAnchorElement :: IsGObject obj => obj -> HTMLAnchorElement
castToHTMLAnchorElement = castTo gTypeHTMLAnchorElement "HTMLAnchorElement"

foreign import javascript unsafe "window[\"HTMLAnchorElement\"]" gTypeHTMLAnchorElement :: GType
#else
type IsHTMLAnchorElement o = HTMLAnchorElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLAppletElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLAppletElement Mozilla HTMLAppletElement documentation>
newtype HTMLAppletElement = HTMLAppletElement { unHTMLAppletElement :: JSRef }

instance Eq (HTMLAppletElement) where
  (HTMLAppletElement a) == (HTMLAppletElement b) = js_eq a b

instance PToJSRef HTMLAppletElement where
  pToJSRef = unHTMLAppletElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLAppletElement where
  pFromJSRef = HTMLAppletElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLAppletElement where
  toJSRef = return . unHTMLAppletElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLAppletElement where
  fromJSRef = return . fmap HTMLAppletElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLAppletElement
instance IsElement HTMLAppletElement
instance IsNode HTMLAppletElement
instance IsEventTarget HTMLAppletElement
instance IsGObject HTMLAppletElement where
  toGObject = GObject . unHTMLAppletElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLAppletElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLAppletElement :: IsGObject obj => obj -> HTMLAppletElement
castToHTMLAppletElement = castTo gTypeHTMLAppletElement "HTMLAppletElement"

foreign import javascript unsafe "window[\"HTMLAppletElement\"]" gTypeHTMLAppletElement :: GType
#else
type IsHTMLAppletElement o = HTMLAppletElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLAreaElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLAreaElement Mozilla HTMLAreaElement documentation>
newtype HTMLAreaElement = HTMLAreaElement { unHTMLAreaElement :: JSRef }

instance Eq (HTMLAreaElement) where
  (HTMLAreaElement a) == (HTMLAreaElement b) = js_eq a b

instance PToJSRef HTMLAreaElement where
  pToJSRef = unHTMLAreaElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLAreaElement where
  pFromJSRef = HTMLAreaElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLAreaElement where
  toJSRef = return . unHTMLAreaElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLAreaElement where
  fromJSRef = return . fmap HTMLAreaElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLAreaElement
instance IsElement HTMLAreaElement
instance IsNode HTMLAreaElement
instance IsEventTarget HTMLAreaElement
instance IsGObject HTMLAreaElement where
  toGObject = GObject . unHTMLAreaElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLAreaElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLAreaElement :: IsGObject obj => obj -> HTMLAreaElement
castToHTMLAreaElement = castTo gTypeHTMLAreaElement "HTMLAreaElement"

foreign import javascript unsafe "window[\"HTMLAreaElement\"]" gTypeHTMLAreaElement :: GType
#else
type IsHTMLAreaElement o = HTMLAreaElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLAudioElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLMediaElement"
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLAudioElement Mozilla HTMLAudioElement documentation>
newtype HTMLAudioElement = HTMLAudioElement { unHTMLAudioElement :: JSRef }

instance Eq (HTMLAudioElement) where
  (HTMLAudioElement a) == (HTMLAudioElement b) = js_eq a b

instance PToJSRef HTMLAudioElement where
  pToJSRef = unHTMLAudioElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLAudioElement where
  pFromJSRef = HTMLAudioElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLAudioElement where
  toJSRef = return . unHTMLAudioElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLAudioElement where
  fromJSRef = return . fmap HTMLAudioElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLMediaElement HTMLAudioElement
instance IsHTMLElement HTMLAudioElement
instance IsElement HTMLAudioElement
instance IsNode HTMLAudioElement
instance IsEventTarget HTMLAudioElement
instance IsGObject HTMLAudioElement where
  toGObject = GObject . unHTMLAudioElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLAudioElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLAudioElement :: IsGObject obj => obj -> HTMLAudioElement
castToHTMLAudioElement = castTo gTypeHTMLAudioElement "HTMLAudioElement"

foreign import javascript unsafe "window[\"HTMLAudioElement\"]" gTypeHTMLAudioElement :: GType
#else
type IsHTMLAudioElement o = HTMLAudioElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLBRElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLBRElement Mozilla HTMLBRElement documentation>
newtype HTMLBRElement = HTMLBRElement { unHTMLBRElement :: JSRef }

instance Eq (HTMLBRElement) where
  (HTMLBRElement a) == (HTMLBRElement b) = js_eq a b

instance PToJSRef HTMLBRElement where
  pToJSRef = unHTMLBRElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLBRElement where
  pFromJSRef = HTMLBRElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLBRElement where
  toJSRef = return . unHTMLBRElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLBRElement where
  fromJSRef = return . fmap HTMLBRElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLBRElement
instance IsElement HTMLBRElement
instance IsNode HTMLBRElement
instance IsEventTarget HTMLBRElement
instance IsGObject HTMLBRElement where
  toGObject = GObject . unHTMLBRElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLBRElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLBRElement :: IsGObject obj => obj -> HTMLBRElement
castToHTMLBRElement = castTo gTypeHTMLBRElement "HTMLBRElement"

foreign import javascript unsafe "window[\"HTMLBRElement\"]" gTypeHTMLBRElement :: GType
#else
type IsHTMLBRElement o = HTMLBRElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLBaseElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLBaseElement Mozilla HTMLBaseElement documentation>
newtype HTMLBaseElement = HTMLBaseElement { unHTMLBaseElement :: JSRef }

instance Eq (HTMLBaseElement) where
  (HTMLBaseElement a) == (HTMLBaseElement b) = js_eq a b

instance PToJSRef HTMLBaseElement where
  pToJSRef = unHTMLBaseElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLBaseElement where
  pFromJSRef = HTMLBaseElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLBaseElement where
  toJSRef = return . unHTMLBaseElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLBaseElement where
  fromJSRef = return . fmap HTMLBaseElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLBaseElement
instance IsElement HTMLBaseElement
instance IsNode HTMLBaseElement
instance IsEventTarget HTMLBaseElement
instance IsGObject HTMLBaseElement where
  toGObject = GObject . unHTMLBaseElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLBaseElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLBaseElement :: IsGObject obj => obj -> HTMLBaseElement
castToHTMLBaseElement = castTo gTypeHTMLBaseElement "HTMLBaseElement"

foreign import javascript unsafe "window[\"HTMLBaseElement\"]" gTypeHTMLBaseElement :: GType
#else
type IsHTMLBaseElement o = HTMLBaseElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLBaseFontElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLBaseFontElement Mozilla HTMLBaseFontElement documentation>
newtype HTMLBaseFontElement = HTMLBaseFontElement { unHTMLBaseFontElement :: JSRef }

instance Eq (HTMLBaseFontElement) where
  (HTMLBaseFontElement a) == (HTMLBaseFontElement b) = js_eq a b

instance PToJSRef HTMLBaseFontElement where
  pToJSRef = unHTMLBaseFontElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLBaseFontElement where
  pFromJSRef = HTMLBaseFontElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLBaseFontElement where
  toJSRef = return . unHTMLBaseFontElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLBaseFontElement where
  fromJSRef = return . fmap HTMLBaseFontElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLBaseFontElement
instance IsElement HTMLBaseFontElement
instance IsNode HTMLBaseFontElement
instance IsEventTarget HTMLBaseFontElement
instance IsGObject HTMLBaseFontElement where
  toGObject = GObject . unHTMLBaseFontElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLBaseFontElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLBaseFontElement :: IsGObject obj => obj -> HTMLBaseFontElement
castToHTMLBaseFontElement = castTo gTypeHTMLBaseFontElement "HTMLBaseFontElement"

foreign import javascript unsafe "window[\"HTMLBaseFontElement\"]" gTypeHTMLBaseFontElement :: GType
#else
type IsHTMLBaseFontElement o = HTMLBaseFontElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLBodyElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLBodyElement Mozilla HTMLBodyElement documentation>
newtype HTMLBodyElement = HTMLBodyElement { unHTMLBodyElement :: JSRef }

instance Eq (HTMLBodyElement) where
  (HTMLBodyElement a) == (HTMLBodyElement b) = js_eq a b

instance PToJSRef HTMLBodyElement where
  pToJSRef = unHTMLBodyElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLBodyElement where
  pFromJSRef = HTMLBodyElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLBodyElement where
  toJSRef = return . unHTMLBodyElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLBodyElement where
  fromJSRef = return . fmap HTMLBodyElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLBodyElement
instance IsElement HTMLBodyElement
instance IsNode HTMLBodyElement
instance IsEventTarget HTMLBodyElement
instance IsGObject HTMLBodyElement where
  toGObject = GObject . unHTMLBodyElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLBodyElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLBodyElement :: IsGObject obj => obj -> HTMLBodyElement
castToHTMLBodyElement = castTo gTypeHTMLBodyElement "HTMLBodyElement"

foreign import javascript unsafe "window[\"HTMLBodyElement\"]" gTypeHTMLBodyElement :: GType
#else
type IsHTMLBodyElement o = HTMLBodyElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLButtonElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLButtonElement Mozilla HTMLButtonElement documentation>
newtype HTMLButtonElement = HTMLButtonElement { unHTMLButtonElement :: JSRef }

instance Eq (HTMLButtonElement) where
  (HTMLButtonElement a) == (HTMLButtonElement b) = js_eq a b

instance PToJSRef HTMLButtonElement where
  pToJSRef = unHTMLButtonElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLButtonElement where
  pFromJSRef = HTMLButtonElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLButtonElement where
  toJSRef = return . unHTMLButtonElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLButtonElement where
  fromJSRef = return . fmap HTMLButtonElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLButtonElement
instance IsElement HTMLButtonElement
instance IsNode HTMLButtonElement
instance IsEventTarget HTMLButtonElement
instance IsGObject HTMLButtonElement where
  toGObject = GObject . unHTMLButtonElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLButtonElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLButtonElement :: IsGObject obj => obj -> HTMLButtonElement
castToHTMLButtonElement = castTo gTypeHTMLButtonElement "HTMLButtonElement"

foreign import javascript unsafe "window[\"HTMLButtonElement\"]" gTypeHTMLButtonElement :: GType
#else
type IsHTMLButtonElement o = HTMLButtonElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLCanvasElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLCanvasElement Mozilla HTMLCanvasElement documentation>
newtype HTMLCanvasElement = HTMLCanvasElement { unHTMLCanvasElement :: JSRef }

instance Eq (HTMLCanvasElement) where
  (HTMLCanvasElement a) == (HTMLCanvasElement b) = js_eq a b

instance PToJSRef HTMLCanvasElement where
  pToJSRef = unHTMLCanvasElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLCanvasElement where
  pFromJSRef = HTMLCanvasElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLCanvasElement where
  toJSRef = return . unHTMLCanvasElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLCanvasElement where
  fromJSRef = return . fmap HTMLCanvasElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLCanvasElement
instance IsElement HTMLCanvasElement
instance IsNode HTMLCanvasElement
instance IsEventTarget HTMLCanvasElement
instance IsGObject HTMLCanvasElement where
  toGObject = GObject . unHTMLCanvasElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLCanvasElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLCanvasElement :: IsGObject obj => obj -> HTMLCanvasElement
castToHTMLCanvasElement = castTo gTypeHTMLCanvasElement "HTMLCanvasElement"

foreign import javascript unsafe "window[\"HTMLCanvasElement\"]" gTypeHTMLCanvasElement :: GType
#else
type IsHTMLCanvasElement o = HTMLCanvasElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLCollection".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLCollection Mozilla HTMLCollection documentation>
newtype HTMLCollection = HTMLCollection { unHTMLCollection :: JSRef }

instance Eq (HTMLCollection) where
  (HTMLCollection a) == (HTMLCollection b) = js_eq a b

instance PToJSRef HTMLCollection where
  pToJSRef = unHTMLCollection
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLCollection where
  pFromJSRef = HTMLCollection
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLCollection where
  toJSRef = return . unHTMLCollection
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLCollection where
  fromJSRef = return . fmap HTMLCollection . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsHTMLCollection o
toHTMLCollection :: IsHTMLCollection o => o -> HTMLCollection
toHTMLCollection = unsafeCastGObject . toGObject

instance IsHTMLCollection HTMLCollection
instance IsGObject HTMLCollection where
  toGObject = GObject . unHTMLCollection
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLCollection . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLCollection :: IsGObject obj => obj -> HTMLCollection
castToHTMLCollection = castTo gTypeHTMLCollection "HTMLCollection"

foreign import javascript unsafe "window[\"HTMLCollection\"]" gTypeHTMLCollection :: GType
#else
type IsHTMLCollection o = HTMLCollectionClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLDListElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLDListElement Mozilla HTMLDListElement documentation>
newtype HTMLDListElement = HTMLDListElement { unHTMLDListElement :: JSRef }

instance Eq (HTMLDListElement) where
  (HTMLDListElement a) == (HTMLDListElement b) = js_eq a b

instance PToJSRef HTMLDListElement where
  pToJSRef = unHTMLDListElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLDListElement where
  pFromJSRef = HTMLDListElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLDListElement where
  toJSRef = return . unHTMLDListElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLDListElement where
  fromJSRef = return . fmap HTMLDListElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLDListElement
instance IsElement HTMLDListElement
instance IsNode HTMLDListElement
instance IsEventTarget HTMLDListElement
instance IsGObject HTMLDListElement where
  toGObject = GObject . unHTMLDListElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLDListElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLDListElement :: IsGObject obj => obj -> HTMLDListElement
castToHTMLDListElement = castTo gTypeHTMLDListElement "HTMLDListElement"

foreign import javascript unsafe "window[\"HTMLDListElement\"]" gTypeHTMLDListElement :: GType
#else
type IsHTMLDListElement o = HTMLDListElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLDataListElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLDataListElement Mozilla HTMLDataListElement documentation>
newtype HTMLDataListElement = HTMLDataListElement { unHTMLDataListElement :: JSRef }

instance Eq (HTMLDataListElement) where
  (HTMLDataListElement a) == (HTMLDataListElement b) = js_eq a b

instance PToJSRef HTMLDataListElement where
  pToJSRef = unHTMLDataListElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLDataListElement where
  pFromJSRef = HTMLDataListElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLDataListElement where
  toJSRef = return . unHTMLDataListElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLDataListElement where
  fromJSRef = return . fmap HTMLDataListElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLDataListElement
instance IsElement HTMLDataListElement
instance IsNode HTMLDataListElement
instance IsEventTarget HTMLDataListElement
instance IsGObject HTMLDataListElement where
  toGObject = GObject . unHTMLDataListElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLDataListElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLDataListElement :: IsGObject obj => obj -> HTMLDataListElement
castToHTMLDataListElement = castTo gTypeHTMLDataListElement "HTMLDataListElement"

foreign import javascript unsafe "window[\"HTMLDataListElement\"]" gTypeHTMLDataListElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLDetailsElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLDetailsElement Mozilla HTMLDetailsElement documentation>
newtype HTMLDetailsElement = HTMLDetailsElement { unHTMLDetailsElement :: JSRef }

instance Eq (HTMLDetailsElement) where
  (HTMLDetailsElement a) == (HTMLDetailsElement b) = js_eq a b

instance PToJSRef HTMLDetailsElement where
  pToJSRef = unHTMLDetailsElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLDetailsElement where
  pFromJSRef = HTMLDetailsElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLDetailsElement where
  toJSRef = return . unHTMLDetailsElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLDetailsElement where
  fromJSRef = return . fmap HTMLDetailsElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLDetailsElement
instance IsElement HTMLDetailsElement
instance IsNode HTMLDetailsElement
instance IsEventTarget HTMLDetailsElement
instance IsGObject HTMLDetailsElement where
  toGObject = GObject . unHTMLDetailsElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLDetailsElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLDetailsElement :: IsGObject obj => obj -> HTMLDetailsElement
castToHTMLDetailsElement = castTo gTypeHTMLDetailsElement "HTMLDetailsElement"

foreign import javascript unsafe "window[\"HTMLDetailsElement\"]" gTypeHTMLDetailsElement :: GType
#else
type IsHTMLDetailsElement o = HTMLDetailsElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLDirectoryElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLDirectoryElement Mozilla HTMLDirectoryElement documentation>
newtype HTMLDirectoryElement = HTMLDirectoryElement { unHTMLDirectoryElement :: JSRef }

instance Eq (HTMLDirectoryElement) where
  (HTMLDirectoryElement a) == (HTMLDirectoryElement b) = js_eq a b

instance PToJSRef HTMLDirectoryElement where
  pToJSRef = unHTMLDirectoryElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLDirectoryElement where
  pFromJSRef = HTMLDirectoryElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLDirectoryElement where
  toJSRef = return . unHTMLDirectoryElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLDirectoryElement where
  fromJSRef = return . fmap HTMLDirectoryElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLDirectoryElement
instance IsElement HTMLDirectoryElement
instance IsNode HTMLDirectoryElement
instance IsEventTarget HTMLDirectoryElement
instance IsGObject HTMLDirectoryElement where
  toGObject = GObject . unHTMLDirectoryElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLDirectoryElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLDirectoryElement :: IsGObject obj => obj -> HTMLDirectoryElement
castToHTMLDirectoryElement = castTo gTypeHTMLDirectoryElement "HTMLDirectoryElement"

foreign import javascript unsafe "window[\"HTMLDirectoryElement\"]" gTypeHTMLDirectoryElement :: GType
#else
type IsHTMLDirectoryElement o = HTMLDirectoryElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLDivElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLDivElement Mozilla HTMLDivElement documentation>
newtype HTMLDivElement = HTMLDivElement { unHTMLDivElement :: JSRef }

instance Eq (HTMLDivElement) where
  (HTMLDivElement a) == (HTMLDivElement b) = js_eq a b

instance PToJSRef HTMLDivElement where
  pToJSRef = unHTMLDivElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLDivElement where
  pFromJSRef = HTMLDivElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLDivElement where
  toJSRef = return . unHTMLDivElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLDivElement where
  fromJSRef = return . fmap HTMLDivElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLDivElement
instance IsElement HTMLDivElement
instance IsNode HTMLDivElement
instance IsEventTarget HTMLDivElement
instance IsGObject HTMLDivElement where
  toGObject = GObject . unHTMLDivElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLDivElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLDivElement :: IsGObject obj => obj -> HTMLDivElement
castToHTMLDivElement = castTo gTypeHTMLDivElement "HTMLDivElement"

foreign import javascript unsafe "window[\"HTMLDivElement\"]" gTypeHTMLDivElement :: GType
#else
type IsHTMLDivElement o = HTMLDivElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLDocument".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Document"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLDocument Mozilla HTMLDocument documentation>
newtype HTMLDocument = HTMLDocument { unHTMLDocument :: JSRef }

instance Eq (HTMLDocument) where
  (HTMLDocument a) == (HTMLDocument b) = js_eq a b

instance PToJSRef HTMLDocument where
  pToJSRef = unHTMLDocument
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLDocument where
  pFromJSRef = HTMLDocument
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLDocument where
  toJSRef = return . unHTMLDocument
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLDocument where
  fromJSRef = return . fmap HTMLDocument . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsDocument HTMLDocument
instance IsNode HTMLDocument
instance IsEventTarget HTMLDocument
instance IsGObject HTMLDocument where
  toGObject = GObject . unHTMLDocument
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLDocument . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLDocument :: IsGObject obj => obj -> HTMLDocument
castToHTMLDocument = castTo gTypeHTMLDocument "HTMLDocument"

foreign import javascript unsafe "window[\"HTMLDocument\"]" gTypeHTMLDocument :: GType
#else
type IsHTMLDocument o = HTMLDocumentClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement Mozilla HTMLElement documentation>
newtype HTMLElement = HTMLElement { unHTMLElement :: JSRef }

instance Eq (HTMLElement) where
  (HTMLElement a) == (HTMLElement b) = js_eq a b

instance PToJSRef HTMLElement where
  pToJSRef = unHTMLElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLElement where
  pFromJSRef = HTMLElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLElement where
  toJSRef = return . unHTMLElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLElement where
  fromJSRef = return . fmap HTMLElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsElement o => IsHTMLElement o
toHTMLElement :: IsHTMLElement o => o -> HTMLElement
toHTMLElement = unsafeCastGObject . toGObject

instance IsHTMLElement HTMLElement
instance IsElement HTMLElement
instance IsNode HTMLElement
instance IsEventTarget HTMLElement
instance IsGObject HTMLElement where
  toGObject = GObject . unHTMLElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLElement :: IsGObject obj => obj -> HTMLElement
castToHTMLElement = castTo gTypeHTMLElement "HTMLElement"

foreign import javascript unsafe "window[\"HTMLElement\"]" gTypeHTMLElement :: GType
#else
type IsHTMLElement o = HTMLElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLEmbedElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLEmbedElement Mozilla HTMLEmbedElement documentation>
newtype HTMLEmbedElement = HTMLEmbedElement { unHTMLEmbedElement :: JSRef }

instance Eq (HTMLEmbedElement) where
  (HTMLEmbedElement a) == (HTMLEmbedElement b) = js_eq a b

instance PToJSRef HTMLEmbedElement where
  pToJSRef = unHTMLEmbedElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLEmbedElement where
  pFromJSRef = HTMLEmbedElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLEmbedElement where
  toJSRef = return . unHTMLEmbedElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLEmbedElement where
  fromJSRef = return . fmap HTMLEmbedElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLEmbedElement
instance IsElement HTMLEmbedElement
instance IsNode HTMLEmbedElement
instance IsEventTarget HTMLEmbedElement
instance IsGObject HTMLEmbedElement where
  toGObject = GObject . unHTMLEmbedElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLEmbedElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLEmbedElement :: IsGObject obj => obj -> HTMLEmbedElement
castToHTMLEmbedElement = castTo gTypeHTMLEmbedElement "HTMLEmbedElement"

foreign import javascript unsafe "window[\"HTMLEmbedElement\"]" gTypeHTMLEmbedElement :: GType
#else
type IsHTMLEmbedElement o = HTMLEmbedElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLFieldSetElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLFieldSetElement Mozilla HTMLFieldSetElement documentation>
newtype HTMLFieldSetElement = HTMLFieldSetElement { unHTMLFieldSetElement :: JSRef }

instance Eq (HTMLFieldSetElement) where
  (HTMLFieldSetElement a) == (HTMLFieldSetElement b) = js_eq a b

instance PToJSRef HTMLFieldSetElement where
  pToJSRef = unHTMLFieldSetElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLFieldSetElement where
  pFromJSRef = HTMLFieldSetElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLFieldSetElement where
  toJSRef = return . unHTMLFieldSetElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLFieldSetElement where
  fromJSRef = return . fmap HTMLFieldSetElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLFieldSetElement
instance IsElement HTMLFieldSetElement
instance IsNode HTMLFieldSetElement
instance IsEventTarget HTMLFieldSetElement
instance IsGObject HTMLFieldSetElement where
  toGObject = GObject . unHTMLFieldSetElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLFieldSetElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLFieldSetElement :: IsGObject obj => obj -> HTMLFieldSetElement
castToHTMLFieldSetElement = castTo gTypeHTMLFieldSetElement "HTMLFieldSetElement"

foreign import javascript unsafe "window[\"HTMLFieldSetElement\"]" gTypeHTMLFieldSetElement :: GType
#else
type IsHTMLFieldSetElement o = HTMLFieldSetElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLFontElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLFontElement Mozilla HTMLFontElement documentation>
newtype HTMLFontElement = HTMLFontElement { unHTMLFontElement :: JSRef }

instance Eq (HTMLFontElement) where
  (HTMLFontElement a) == (HTMLFontElement b) = js_eq a b

instance PToJSRef HTMLFontElement where
  pToJSRef = unHTMLFontElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLFontElement where
  pFromJSRef = HTMLFontElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLFontElement where
  toJSRef = return . unHTMLFontElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLFontElement where
  fromJSRef = return . fmap HTMLFontElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLFontElement
instance IsElement HTMLFontElement
instance IsNode HTMLFontElement
instance IsEventTarget HTMLFontElement
instance IsGObject HTMLFontElement where
  toGObject = GObject . unHTMLFontElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLFontElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLFontElement :: IsGObject obj => obj -> HTMLFontElement
castToHTMLFontElement = castTo gTypeHTMLFontElement "HTMLFontElement"

foreign import javascript unsafe "window[\"HTMLFontElement\"]" gTypeHTMLFontElement :: GType
#else
type IsHTMLFontElement o = HTMLFontElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLFormControlsCollection".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLCollection"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLFormControlsCollection Mozilla HTMLFormControlsCollection documentation>
newtype HTMLFormControlsCollection = HTMLFormControlsCollection { unHTMLFormControlsCollection :: JSRef }

instance Eq (HTMLFormControlsCollection) where
  (HTMLFormControlsCollection a) == (HTMLFormControlsCollection b) = js_eq a b

instance PToJSRef HTMLFormControlsCollection where
  pToJSRef = unHTMLFormControlsCollection
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLFormControlsCollection where
  pFromJSRef = HTMLFormControlsCollection
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLFormControlsCollection where
  toJSRef = return . unHTMLFormControlsCollection
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLFormControlsCollection where
  fromJSRef = return . fmap HTMLFormControlsCollection . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLCollection HTMLFormControlsCollection
instance IsGObject HTMLFormControlsCollection where
  toGObject = GObject . unHTMLFormControlsCollection
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLFormControlsCollection . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLFormControlsCollection :: IsGObject obj => obj -> HTMLFormControlsCollection
castToHTMLFormControlsCollection = castTo gTypeHTMLFormControlsCollection "HTMLFormControlsCollection"

foreign import javascript unsafe "window[\"HTMLFormControlsCollection\"]" gTypeHTMLFormControlsCollection :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLFormElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLFormElement Mozilla HTMLFormElement documentation>
newtype HTMLFormElement = HTMLFormElement { unHTMLFormElement :: JSRef }

instance Eq (HTMLFormElement) where
  (HTMLFormElement a) == (HTMLFormElement b) = js_eq a b

instance PToJSRef HTMLFormElement where
  pToJSRef = unHTMLFormElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLFormElement where
  pFromJSRef = HTMLFormElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLFormElement where
  toJSRef = return . unHTMLFormElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLFormElement where
  fromJSRef = return . fmap HTMLFormElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLFormElement
instance IsElement HTMLFormElement
instance IsNode HTMLFormElement
instance IsEventTarget HTMLFormElement
instance IsGObject HTMLFormElement where
  toGObject = GObject . unHTMLFormElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLFormElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLFormElement :: IsGObject obj => obj -> HTMLFormElement
castToHTMLFormElement = castTo gTypeHTMLFormElement "HTMLFormElement"

foreign import javascript unsafe "window[\"HTMLFormElement\"]" gTypeHTMLFormElement :: GType
#else
type IsHTMLFormElement o = HTMLFormElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLFrameElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLFrameElement Mozilla HTMLFrameElement documentation>
newtype HTMLFrameElement = HTMLFrameElement { unHTMLFrameElement :: JSRef }

instance Eq (HTMLFrameElement) where
  (HTMLFrameElement a) == (HTMLFrameElement b) = js_eq a b

instance PToJSRef HTMLFrameElement where
  pToJSRef = unHTMLFrameElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLFrameElement where
  pFromJSRef = HTMLFrameElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLFrameElement where
  toJSRef = return . unHTMLFrameElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLFrameElement where
  fromJSRef = return . fmap HTMLFrameElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLFrameElement
instance IsElement HTMLFrameElement
instance IsNode HTMLFrameElement
instance IsEventTarget HTMLFrameElement
instance IsGObject HTMLFrameElement where
  toGObject = GObject . unHTMLFrameElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLFrameElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLFrameElement :: IsGObject obj => obj -> HTMLFrameElement
castToHTMLFrameElement = castTo gTypeHTMLFrameElement "HTMLFrameElement"

foreign import javascript unsafe "window[\"HTMLFrameElement\"]" gTypeHTMLFrameElement :: GType
#else
type IsHTMLFrameElement o = HTMLFrameElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLFrameSetElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLFrameSetElement Mozilla HTMLFrameSetElement documentation>
newtype HTMLFrameSetElement = HTMLFrameSetElement { unHTMLFrameSetElement :: JSRef }

instance Eq (HTMLFrameSetElement) where
  (HTMLFrameSetElement a) == (HTMLFrameSetElement b) = js_eq a b

instance PToJSRef HTMLFrameSetElement where
  pToJSRef = unHTMLFrameSetElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLFrameSetElement where
  pFromJSRef = HTMLFrameSetElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLFrameSetElement where
  toJSRef = return . unHTMLFrameSetElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLFrameSetElement where
  fromJSRef = return . fmap HTMLFrameSetElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLFrameSetElement
instance IsElement HTMLFrameSetElement
instance IsNode HTMLFrameSetElement
instance IsEventTarget HTMLFrameSetElement
instance IsGObject HTMLFrameSetElement where
  toGObject = GObject . unHTMLFrameSetElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLFrameSetElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLFrameSetElement :: IsGObject obj => obj -> HTMLFrameSetElement
castToHTMLFrameSetElement = castTo gTypeHTMLFrameSetElement "HTMLFrameSetElement"

foreign import javascript unsafe "window[\"HTMLFrameSetElement\"]" gTypeHTMLFrameSetElement :: GType
#else
type IsHTMLFrameSetElement o = HTMLFrameSetElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLHRElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLHRElement Mozilla HTMLHRElement documentation>
newtype HTMLHRElement = HTMLHRElement { unHTMLHRElement :: JSRef }

instance Eq (HTMLHRElement) where
  (HTMLHRElement a) == (HTMLHRElement b) = js_eq a b

instance PToJSRef HTMLHRElement where
  pToJSRef = unHTMLHRElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLHRElement where
  pFromJSRef = HTMLHRElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLHRElement where
  toJSRef = return . unHTMLHRElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLHRElement where
  fromJSRef = return . fmap HTMLHRElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLHRElement
instance IsElement HTMLHRElement
instance IsNode HTMLHRElement
instance IsEventTarget HTMLHRElement
instance IsGObject HTMLHRElement where
  toGObject = GObject . unHTMLHRElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLHRElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLHRElement :: IsGObject obj => obj -> HTMLHRElement
castToHTMLHRElement = castTo gTypeHTMLHRElement "HTMLHRElement"

foreign import javascript unsafe "window[\"HTMLHRElement\"]" gTypeHTMLHRElement :: GType
#else
type IsHTMLHRElement o = HTMLHRElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLHeadElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLHeadElement Mozilla HTMLHeadElement documentation>
newtype HTMLHeadElement = HTMLHeadElement { unHTMLHeadElement :: JSRef }

instance Eq (HTMLHeadElement) where
  (HTMLHeadElement a) == (HTMLHeadElement b) = js_eq a b

instance PToJSRef HTMLHeadElement where
  pToJSRef = unHTMLHeadElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLHeadElement where
  pFromJSRef = HTMLHeadElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLHeadElement where
  toJSRef = return . unHTMLHeadElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLHeadElement where
  fromJSRef = return . fmap HTMLHeadElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLHeadElement
instance IsElement HTMLHeadElement
instance IsNode HTMLHeadElement
instance IsEventTarget HTMLHeadElement
instance IsGObject HTMLHeadElement where
  toGObject = GObject . unHTMLHeadElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLHeadElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLHeadElement :: IsGObject obj => obj -> HTMLHeadElement
castToHTMLHeadElement = castTo gTypeHTMLHeadElement "HTMLHeadElement"

foreign import javascript unsafe "window[\"HTMLHeadElement\"]" gTypeHTMLHeadElement :: GType
#else
type IsHTMLHeadElement o = HTMLHeadElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLHeadingElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLHeadingElement Mozilla HTMLHeadingElement documentation>
newtype HTMLHeadingElement = HTMLHeadingElement { unHTMLHeadingElement :: JSRef }

instance Eq (HTMLHeadingElement) where
  (HTMLHeadingElement a) == (HTMLHeadingElement b) = js_eq a b

instance PToJSRef HTMLHeadingElement where
  pToJSRef = unHTMLHeadingElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLHeadingElement where
  pFromJSRef = HTMLHeadingElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLHeadingElement where
  toJSRef = return . unHTMLHeadingElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLHeadingElement where
  fromJSRef = return . fmap HTMLHeadingElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLHeadingElement
instance IsElement HTMLHeadingElement
instance IsNode HTMLHeadingElement
instance IsEventTarget HTMLHeadingElement
instance IsGObject HTMLHeadingElement where
  toGObject = GObject . unHTMLHeadingElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLHeadingElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLHeadingElement :: IsGObject obj => obj -> HTMLHeadingElement
castToHTMLHeadingElement = castTo gTypeHTMLHeadingElement "HTMLHeadingElement"

foreign import javascript unsafe "window[\"HTMLHeadingElement\"]" gTypeHTMLHeadingElement :: GType
#else
type IsHTMLHeadingElement o = HTMLHeadingElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLHtmlElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLHtmlElement Mozilla HTMLHtmlElement documentation>
newtype HTMLHtmlElement = HTMLHtmlElement { unHTMLHtmlElement :: JSRef }

instance Eq (HTMLHtmlElement) where
  (HTMLHtmlElement a) == (HTMLHtmlElement b) = js_eq a b

instance PToJSRef HTMLHtmlElement where
  pToJSRef = unHTMLHtmlElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLHtmlElement where
  pFromJSRef = HTMLHtmlElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLHtmlElement where
  toJSRef = return . unHTMLHtmlElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLHtmlElement where
  fromJSRef = return . fmap HTMLHtmlElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLHtmlElement
instance IsElement HTMLHtmlElement
instance IsNode HTMLHtmlElement
instance IsEventTarget HTMLHtmlElement
instance IsGObject HTMLHtmlElement where
  toGObject = GObject . unHTMLHtmlElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLHtmlElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLHtmlElement :: IsGObject obj => obj -> HTMLHtmlElement
castToHTMLHtmlElement = castTo gTypeHTMLHtmlElement "HTMLHtmlElement"

foreign import javascript unsafe "window[\"HTMLHtmlElement\"]" gTypeHTMLHtmlElement :: GType
#else
type IsHTMLHtmlElement o = HTMLHtmlElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLIFrameElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLIFrameElement Mozilla HTMLIFrameElement documentation>
newtype HTMLIFrameElement = HTMLIFrameElement { unHTMLIFrameElement :: JSRef }

instance Eq (HTMLIFrameElement) where
  (HTMLIFrameElement a) == (HTMLIFrameElement b) = js_eq a b

instance PToJSRef HTMLIFrameElement where
  pToJSRef = unHTMLIFrameElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLIFrameElement where
  pFromJSRef = HTMLIFrameElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLIFrameElement where
  toJSRef = return . unHTMLIFrameElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLIFrameElement where
  fromJSRef = return . fmap HTMLIFrameElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLIFrameElement
instance IsElement HTMLIFrameElement
instance IsNode HTMLIFrameElement
instance IsEventTarget HTMLIFrameElement
instance IsGObject HTMLIFrameElement where
  toGObject = GObject . unHTMLIFrameElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLIFrameElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLIFrameElement :: IsGObject obj => obj -> HTMLIFrameElement
castToHTMLIFrameElement = castTo gTypeHTMLIFrameElement "HTMLIFrameElement"

foreign import javascript unsafe "window[\"HTMLIFrameElement\"]" gTypeHTMLIFrameElement :: GType
#else
type IsHTMLIFrameElement o = HTMLIFrameElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLImageElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement Mozilla HTMLImageElement documentation>
newtype HTMLImageElement = HTMLImageElement { unHTMLImageElement :: JSRef }

instance Eq (HTMLImageElement) where
  (HTMLImageElement a) == (HTMLImageElement b) = js_eq a b

instance PToJSRef HTMLImageElement where
  pToJSRef = unHTMLImageElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLImageElement where
  pFromJSRef = HTMLImageElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLImageElement where
  toJSRef = return . unHTMLImageElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLImageElement where
  fromJSRef = return . fmap HTMLImageElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLImageElement
instance IsElement HTMLImageElement
instance IsNode HTMLImageElement
instance IsEventTarget HTMLImageElement
instance IsGObject HTMLImageElement where
  toGObject = GObject . unHTMLImageElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLImageElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLImageElement :: IsGObject obj => obj -> HTMLImageElement
castToHTMLImageElement = castTo gTypeHTMLImageElement "HTMLImageElement"

foreign import javascript unsafe "window[\"HTMLImageElement\"]" gTypeHTMLImageElement :: GType
#else
type IsHTMLImageElement o = HTMLImageElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLInputElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLInputElement Mozilla HTMLInputElement documentation>
newtype HTMLInputElement = HTMLInputElement { unHTMLInputElement :: JSRef }

instance Eq (HTMLInputElement) where
  (HTMLInputElement a) == (HTMLInputElement b) = js_eq a b

instance PToJSRef HTMLInputElement where
  pToJSRef = unHTMLInputElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLInputElement where
  pFromJSRef = HTMLInputElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLInputElement where
  toJSRef = return . unHTMLInputElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLInputElement where
  fromJSRef = return . fmap HTMLInputElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLInputElement
instance IsElement HTMLInputElement
instance IsNode HTMLInputElement
instance IsEventTarget HTMLInputElement
instance IsGObject HTMLInputElement where
  toGObject = GObject . unHTMLInputElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLInputElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLInputElement :: IsGObject obj => obj -> HTMLInputElement
castToHTMLInputElement = castTo gTypeHTMLInputElement "HTMLInputElement"

foreign import javascript unsafe "window[\"HTMLInputElement\"]" gTypeHTMLInputElement :: GType
#else
type IsHTMLInputElement o = HTMLInputElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLKeygenElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLKeygenElement Mozilla HTMLKeygenElement documentation>
newtype HTMLKeygenElement = HTMLKeygenElement { unHTMLKeygenElement :: JSRef }

instance Eq (HTMLKeygenElement) where
  (HTMLKeygenElement a) == (HTMLKeygenElement b) = js_eq a b

instance PToJSRef HTMLKeygenElement where
  pToJSRef = unHTMLKeygenElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLKeygenElement where
  pFromJSRef = HTMLKeygenElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLKeygenElement where
  toJSRef = return . unHTMLKeygenElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLKeygenElement where
  fromJSRef = return . fmap HTMLKeygenElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLKeygenElement
instance IsElement HTMLKeygenElement
instance IsNode HTMLKeygenElement
instance IsEventTarget HTMLKeygenElement
instance IsGObject HTMLKeygenElement where
  toGObject = GObject . unHTMLKeygenElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLKeygenElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLKeygenElement :: IsGObject obj => obj -> HTMLKeygenElement
castToHTMLKeygenElement = castTo gTypeHTMLKeygenElement "HTMLKeygenElement"

foreign import javascript unsafe "window[\"HTMLKeygenElement\"]" gTypeHTMLKeygenElement :: GType
#else
type IsHTMLKeygenElement o = HTMLKeygenElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLLIElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLLIElement Mozilla HTMLLIElement documentation>
newtype HTMLLIElement = HTMLLIElement { unHTMLLIElement :: JSRef }

instance Eq (HTMLLIElement) where
  (HTMLLIElement a) == (HTMLLIElement b) = js_eq a b

instance PToJSRef HTMLLIElement where
  pToJSRef = unHTMLLIElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLLIElement where
  pFromJSRef = HTMLLIElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLLIElement where
  toJSRef = return . unHTMLLIElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLLIElement where
  fromJSRef = return . fmap HTMLLIElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLLIElement
instance IsElement HTMLLIElement
instance IsNode HTMLLIElement
instance IsEventTarget HTMLLIElement
instance IsGObject HTMLLIElement where
  toGObject = GObject . unHTMLLIElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLLIElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLLIElement :: IsGObject obj => obj -> HTMLLIElement
castToHTMLLIElement = castTo gTypeHTMLLIElement "HTMLLIElement"

foreign import javascript unsafe "window[\"HTMLLIElement\"]" gTypeHTMLLIElement :: GType
#else
type IsHTMLLIElement o = HTMLLIElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLLabelElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLLabelElement Mozilla HTMLLabelElement documentation>
newtype HTMLLabelElement = HTMLLabelElement { unHTMLLabelElement :: JSRef }

instance Eq (HTMLLabelElement) where
  (HTMLLabelElement a) == (HTMLLabelElement b) = js_eq a b

instance PToJSRef HTMLLabelElement where
  pToJSRef = unHTMLLabelElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLLabelElement where
  pFromJSRef = HTMLLabelElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLLabelElement where
  toJSRef = return . unHTMLLabelElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLLabelElement where
  fromJSRef = return . fmap HTMLLabelElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLLabelElement
instance IsElement HTMLLabelElement
instance IsNode HTMLLabelElement
instance IsEventTarget HTMLLabelElement
instance IsGObject HTMLLabelElement where
  toGObject = GObject . unHTMLLabelElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLLabelElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLLabelElement :: IsGObject obj => obj -> HTMLLabelElement
castToHTMLLabelElement = castTo gTypeHTMLLabelElement "HTMLLabelElement"

foreign import javascript unsafe "window[\"HTMLLabelElement\"]" gTypeHTMLLabelElement :: GType
#else
type IsHTMLLabelElement o = HTMLLabelElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLLegendElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLLegendElement Mozilla HTMLLegendElement documentation>
newtype HTMLLegendElement = HTMLLegendElement { unHTMLLegendElement :: JSRef }

instance Eq (HTMLLegendElement) where
  (HTMLLegendElement a) == (HTMLLegendElement b) = js_eq a b

instance PToJSRef HTMLLegendElement where
  pToJSRef = unHTMLLegendElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLLegendElement where
  pFromJSRef = HTMLLegendElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLLegendElement where
  toJSRef = return . unHTMLLegendElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLLegendElement where
  fromJSRef = return . fmap HTMLLegendElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLLegendElement
instance IsElement HTMLLegendElement
instance IsNode HTMLLegendElement
instance IsEventTarget HTMLLegendElement
instance IsGObject HTMLLegendElement where
  toGObject = GObject . unHTMLLegendElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLLegendElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLLegendElement :: IsGObject obj => obj -> HTMLLegendElement
castToHTMLLegendElement = castTo gTypeHTMLLegendElement "HTMLLegendElement"

foreign import javascript unsafe "window[\"HTMLLegendElement\"]" gTypeHTMLLegendElement :: GType
#else
type IsHTMLLegendElement o = HTMLLegendElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLLinkElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLLinkElement Mozilla HTMLLinkElement documentation>
newtype HTMLLinkElement = HTMLLinkElement { unHTMLLinkElement :: JSRef }

instance Eq (HTMLLinkElement) where
  (HTMLLinkElement a) == (HTMLLinkElement b) = js_eq a b

instance PToJSRef HTMLLinkElement where
  pToJSRef = unHTMLLinkElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLLinkElement where
  pFromJSRef = HTMLLinkElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLLinkElement where
  toJSRef = return . unHTMLLinkElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLLinkElement where
  fromJSRef = return . fmap HTMLLinkElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLLinkElement
instance IsElement HTMLLinkElement
instance IsNode HTMLLinkElement
instance IsEventTarget HTMLLinkElement
instance IsGObject HTMLLinkElement where
  toGObject = GObject . unHTMLLinkElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLLinkElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLLinkElement :: IsGObject obj => obj -> HTMLLinkElement
castToHTMLLinkElement = castTo gTypeHTMLLinkElement "HTMLLinkElement"

foreign import javascript unsafe "window[\"HTMLLinkElement\"]" gTypeHTMLLinkElement :: GType
#else
type IsHTMLLinkElement o = HTMLLinkElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLMapElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLMapElement Mozilla HTMLMapElement documentation>
newtype HTMLMapElement = HTMLMapElement { unHTMLMapElement :: JSRef }

instance Eq (HTMLMapElement) where
  (HTMLMapElement a) == (HTMLMapElement b) = js_eq a b

instance PToJSRef HTMLMapElement where
  pToJSRef = unHTMLMapElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLMapElement where
  pFromJSRef = HTMLMapElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLMapElement where
  toJSRef = return . unHTMLMapElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLMapElement where
  fromJSRef = return . fmap HTMLMapElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLMapElement
instance IsElement HTMLMapElement
instance IsNode HTMLMapElement
instance IsEventTarget HTMLMapElement
instance IsGObject HTMLMapElement where
  toGObject = GObject . unHTMLMapElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLMapElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLMapElement :: IsGObject obj => obj -> HTMLMapElement
castToHTMLMapElement = castTo gTypeHTMLMapElement "HTMLMapElement"

foreign import javascript unsafe "window[\"HTMLMapElement\"]" gTypeHTMLMapElement :: GType
#else
type IsHTMLMapElement o = HTMLMapElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLMarqueeElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLMarqueeElement Mozilla HTMLMarqueeElement documentation>
newtype HTMLMarqueeElement = HTMLMarqueeElement { unHTMLMarqueeElement :: JSRef }

instance Eq (HTMLMarqueeElement) where
  (HTMLMarqueeElement a) == (HTMLMarqueeElement b) = js_eq a b

instance PToJSRef HTMLMarqueeElement where
  pToJSRef = unHTMLMarqueeElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLMarqueeElement where
  pFromJSRef = HTMLMarqueeElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLMarqueeElement where
  toJSRef = return . unHTMLMarqueeElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLMarqueeElement where
  fromJSRef = return . fmap HTMLMarqueeElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLMarqueeElement
instance IsElement HTMLMarqueeElement
instance IsNode HTMLMarqueeElement
instance IsEventTarget HTMLMarqueeElement
instance IsGObject HTMLMarqueeElement where
  toGObject = GObject . unHTMLMarqueeElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLMarqueeElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLMarqueeElement :: IsGObject obj => obj -> HTMLMarqueeElement
castToHTMLMarqueeElement = castTo gTypeHTMLMarqueeElement "HTMLMarqueeElement"

foreign import javascript unsafe "window[\"HTMLMarqueeElement\"]" gTypeHTMLMarqueeElement :: GType
#else
type IsHTMLMarqueeElement o = HTMLMarqueeElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLMediaElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement Mozilla HTMLMediaElement documentation>
newtype HTMLMediaElement = HTMLMediaElement { unHTMLMediaElement :: JSRef }

instance Eq (HTMLMediaElement) where
  (HTMLMediaElement a) == (HTMLMediaElement b) = js_eq a b

instance PToJSRef HTMLMediaElement where
  pToJSRef = unHTMLMediaElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLMediaElement where
  pFromJSRef = HTMLMediaElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLMediaElement where
  toJSRef = return . unHTMLMediaElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLMediaElement where
  fromJSRef = return . fmap HTMLMediaElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsHTMLElement o => IsHTMLMediaElement o
toHTMLMediaElement :: IsHTMLMediaElement o => o -> HTMLMediaElement
toHTMLMediaElement = unsafeCastGObject . toGObject

instance IsHTMLMediaElement HTMLMediaElement
instance IsHTMLElement HTMLMediaElement
instance IsElement HTMLMediaElement
instance IsNode HTMLMediaElement
instance IsEventTarget HTMLMediaElement
instance IsGObject HTMLMediaElement where
  toGObject = GObject . unHTMLMediaElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLMediaElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLMediaElement :: IsGObject obj => obj -> HTMLMediaElement
castToHTMLMediaElement = castTo gTypeHTMLMediaElement "HTMLMediaElement"

foreign import javascript unsafe "window[\"HTMLMediaElement\"]" gTypeHTMLMediaElement :: GType
#else
type IsHTMLMediaElement o = HTMLMediaElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLMenuElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLMenuElement Mozilla HTMLMenuElement documentation>
newtype HTMLMenuElement = HTMLMenuElement { unHTMLMenuElement :: JSRef }

instance Eq (HTMLMenuElement) where
  (HTMLMenuElement a) == (HTMLMenuElement b) = js_eq a b

instance PToJSRef HTMLMenuElement where
  pToJSRef = unHTMLMenuElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLMenuElement where
  pFromJSRef = HTMLMenuElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLMenuElement where
  toJSRef = return . unHTMLMenuElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLMenuElement where
  fromJSRef = return . fmap HTMLMenuElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLMenuElement
instance IsElement HTMLMenuElement
instance IsNode HTMLMenuElement
instance IsEventTarget HTMLMenuElement
instance IsGObject HTMLMenuElement where
  toGObject = GObject . unHTMLMenuElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLMenuElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLMenuElement :: IsGObject obj => obj -> HTMLMenuElement
castToHTMLMenuElement = castTo gTypeHTMLMenuElement "HTMLMenuElement"

foreign import javascript unsafe "window[\"HTMLMenuElement\"]" gTypeHTMLMenuElement :: GType
#else
type IsHTMLMenuElement o = HTMLMenuElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLMetaElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLMetaElement Mozilla HTMLMetaElement documentation>
newtype HTMLMetaElement = HTMLMetaElement { unHTMLMetaElement :: JSRef }

instance Eq (HTMLMetaElement) where
  (HTMLMetaElement a) == (HTMLMetaElement b) = js_eq a b

instance PToJSRef HTMLMetaElement where
  pToJSRef = unHTMLMetaElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLMetaElement where
  pFromJSRef = HTMLMetaElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLMetaElement where
  toJSRef = return . unHTMLMetaElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLMetaElement where
  fromJSRef = return . fmap HTMLMetaElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLMetaElement
instance IsElement HTMLMetaElement
instance IsNode HTMLMetaElement
instance IsEventTarget HTMLMetaElement
instance IsGObject HTMLMetaElement where
  toGObject = GObject . unHTMLMetaElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLMetaElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLMetaElement :: IsGObject obj => obj -> HTMLMetaElement
castToHTMLMetaElement = castTo gTypeHTMLMetaElement "HTMLMetaElement"

foreign import javascript unsafe "window[\"HTMLMetaElement\"]" gTypeHTMLMetaElement :: GType
#else
type IsHTMLMetaElement o = HTMLMetaElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLMeterElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLMeterElement Mozilla HTMLMeterElement documentation>
newtype HTMLMeterElement = HTMLMeterElement { unHTMLMeterElement :: JSRef }

instance Eq (HTMLMeterElement) where
  (HTMLMeterElement a) == (HTMLMeterElement b) = js_eq a b

instance PToJSRef HTMLMeterElement where
  pToJSRef = unHTMLMeterElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLMeterElement where
  pFromJSRef = HTMLMeterElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLMeterElement where
  toJSRef = return . unHTMLMeterElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLMeterElement where
  fromJSRef = return . fmap HTMLMeterElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLMeterElement
instance IsElement HTMLMeterElement
instance IsNode HTMLMeterElement
instance IsEventTarget HTMLMeterElement
instance IsGObject HTMLMeterElement where
  toGObject = GObject . unHTMLMeterElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLMeterElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLMeterElement :: IsGObject obj => obj -> HTMLMeterElement
castToHTMLMeterElement = castTo gTypeHTMLMeterElement "HTMLMeterElement"

foreign import javascript unsafe "window[\"HTMLMeterElement\"]" gTypeHTMLMeterElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLModElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLModElement Mozilla HTMLModElement documentation>
newtype HTMLModElement = HTMLModElement { unHTMLModElement :: JSRef }

instance Eq (HTMLModElement) where
  (HTMLModElement a) == (HTMLModElement b) = js_eq a b

instance PToJSRef HTMLModElement where
  pToJSRef = unHTMLModElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLModElement where
  pFromJSRef = HTMLModElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLModElement where
  toJSRef = return . unHTMLModElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLModElement where
  fromJSRef = return . fmap HTMLModElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLModElement
instance IsElement HTMLModElement
instance IsNode HTMLModElement
instance IsEventTarget HTMLModElement
instance IsGObject HTMLModElement where
  toGObject = GObject . unHTMLModElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLModElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLModElement :: IsGObject obj => obj -> HTMLModElement
castToHTMLModElement = castTo gTypeHTMLModElement "HTMLModElement"

foreign import javascript unsafe "window[\"HTMLModElement\"]" gTypeHTMLModElement :: GType
#else
type IsHTMLModElement o = HTMLModElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLOListElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLOListElement Mozilla HTMLOListElement documentation>
newtype HTMLOListElement = HTMLOListElement { unHTMLOListElement :: JSRef }

instance Eq (HTMLOListElement) where
  (HTMLOListElement a) == (HTMLOListElement b) = js_eq a b

instance PToJSRef HTMLOListElement where
  pToJSRef = unHTMLOListElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLOListElement where
  pFromJSRef = HTMLOListElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLOListElement where
  toJSRef = return . unHTMLOListElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLOListElement where
  fromJSRef = return . fmap HTMLOListElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLOListElement
instance IsElement HTMLOListElement
instance IsNode HTMLOListElement
instance IsEventTarget HTMLOListElement
instance IsGObject HTMLOListElement where
  toGObject = GObject . unHTMLOListElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLOListElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLOListElement :: IsGObject obj => obj -> HTMLOListElement
castToHTMLOListElement = castTo gTypeHTMLOListElement "HTMLOListElement"

foreign import javascript unsafe "window[\"HTMLOListElement\"]" gTypeHTMLOListElement :: GType
#else
type IsHTMLOListElement o = HTMLOListElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLObjectElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLObjectElement Mozilla HTMLObjectElement documentation>
newtype HTMLObjectElement = HTMLObjectElement { unHTMLObjectElement :: JSRef }

instance Eq (HTMLObjectElement) where
  (HTMLObjectElement a) == (HTMLObjectElement b) = js_eq a b

instance PToJSRef HTMLObjectElement where
  pToJSRef = unHTMLObjectElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLObjectElement where
  pFromJSRef = HTMLObjectElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLObjectElement where
  toJSRef = return . unHTMLObjectElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLObjectElement where
  fromJSRef = return . fmap HTMLObjectElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLObjectElement
instance IsElement HTMLObjectElement
instance IsNode HTMLObjectElement
instance IsEventTarget HTMLObjectElement
instance IsGObject HTMLObjectElement where
  toGObject = GObject . unHTMLObjectElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLObjectElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLObjectElement :: IsGObject obj => obj -> HTMLObjectElement
castToHTMLObjectElement = castTo gTypeHTMLObjectElement "HTMLObjectElement"

foreign import javascript unsafe "window[\"HTMLObjectElement\"]" gTypeHTMLObjectElement :: GType
#else
type IsHTMLObjectElement o = HTMLObjectElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLOptGroupElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLOptGroupElement Mozilla HTMLOptGroupElement documentation>
newtype HTMLOptGroupElement = HTMLOptGroupElement { unHTMLOptGroupElement :: JSRef }

instance Eq (HTMLOptGroupElement) where
  (HTMLOptGroupElement a) == (HTMLOptGroupElement b) = js_eq a b

instance PToJSRef HTMLOptGroupElement where
  pToJSRef = unHTMLOptGroupElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLOptGroupElement where
  pFromJSRef = HTMLOptGroupElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLOptGroupElement where
  toJSRef = return . unHTMLOptGroupElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLOptGroupElement where
  fromJSRef = return . fmap HTMLOptGroupElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLOptGroupElement
instance IsElement HTMLOptGroupElement
instance IsNode HTMLOptGroupElement
instance IsEventTarget HTMLOptGroupElement
instance IsGObject HTMLOptGroupElement where
  toGObject = GObject . unHTMLOptGroupElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLOptGroupElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLOptGroupElement :: IsGObject obj => obj -> HTMLOptGroupElement
castToHTMLOptGroupElement = castTo gTypeHTMLOptGroupElement "HTMLOptGroupElement"

foreign import javascript unsafe "window[\"HTMLOptGroupElement\"]" gTypeHTMLOptGroupElement :: GType
#else
type IsHTMLOptGroupElement o = HTMLOptGroupElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLOptionElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLOptionElement Mozilla HTMLOptionElement documentation>
newtype HTMLOptionElement = HTMLOptionElement { unHTMLOptionElement :: JSRef }

instance Eq (HTMLOptionElement) where
  (HTMLOptionElement a) == (HTMLOptionElement b) = js_eq a b

instance PToJSRef HTMLOptionElement where
  pToJSRef = unHTMLOptionElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLOptionElement where
  pFromJSRef = HTMLOptionElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLOptionElement where
  toJSRef = return . unHTMLOptionElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLOptionElement where
  fromJSRef = return . fmap HTMLOptionElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLOptionElement
instance IsElement HTMLOptionElement
instance IsNode HTMLOptionElement
instance IsEventTarget HTMLOptionElement
instance IsGObject HTMLOptionElement where
  toGObject = GObject . unHTMLOptionElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLOptionElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLOptionElement :: IsGObject obj => obj -> HTMLOptionElement
castToHTMLOptionElement = castTo gTypeHTMLOptionElement "HTMLOptionElement"

foreign import javascript unsafe "window[\"HTMLOptionElement\"]" gTypeHTMLOptionElement :: GType
#else
type IsHTMLOptionElement o = HTMLOptionElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLOptionsCollection".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLCollection"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLOptionsCollection Mozilla HTMLOptionsCollection documentation>
newtype HTMLOptionsCollection = HTMLOptionsCollection { unHTMLOptionsCollection :: JSRef }

instance Eq (HTMLOptionsCollection) where
  (HTMLOptionsCollection a) == (HTMLOptionsCollection b) = js_eq a b

instance PToJSRef HTMLOptionsCollection where
  pToJSRef = unHTMLOptionsCollection
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLOptionsCollection where
  pFromJSRef = HTMLOptionsCollection
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLOptionsCollection where
  toJSRef = return . unHTMLOptionsCollection
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLOptionsCollection where
  fromJSRef = return . fmap HTMLOptionsCollection . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLCollection HTMLOptionsCollection
instance IsGObject HTMLOptionsCollection where
  toGObject = GObject . unHTMLOptionsCollection
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLOptionsCollection . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLOptionsCollection :: IsGObject obj => obj -> HTMLOptionsCollection
castToHTMLOptionsCollection = castTo gTypeHTMLOptionsCollection "HTMLOptionsCollection"

foreign import javascript unsafe "window[\"HTMLOptionsCollection\"]" gTypeHTMLOptionsCollection :: GType
#else
type IsHTMLOptionsCollection o = HTMLOptionsCollectionClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLOutputElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLOutputElement Mozilla HTMLOutputElement documentation>
newtype HTMLOutputElement = HTMLOutputElement { unHTMLOutputElement :: JSRef }

instance Eq (HTMLOutputElement) where
  (HTMLOutputElement a) == (HTMLOutputElement b) = js_eq a b

instance PToJSRef HTMLOutputElement where
  pToJSRef = unHTMLOutputElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLOutputElement where
  pFromJSRef = HTMLOutputElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLOutputElement where
  toJSRef = return . unHTMLOutputElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLOutputElement where
  fromJSRef = return . fmap HTMLOutputElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLOutputElement
instance IsElement HTMLOutputElement
instance IsNode HTMLOutputElement
instance IsEventTarget HTMLOutputElement
instance IsGObject HTMLOutputElement where
  toGObject = GObject . unHTMLOutputElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLOutputElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLOutputElement :: IsGObject obj => obj -> HTMLOutputElement
castToHTMLOutputElement = castTo gTypeHTMLOutputElement "HTMLOutputElement"

foreign import javascript unsafe "window[\"HTMLOutputElement\"]" gTypeHTMLOutputElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLParagraphElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLParagraphElement Mozilla HTMLParagraphElement documentation>
newtype HTMLParagraphElement = HTMLParagraphElement { unHTMLParagraphElement :: JSRef }

instance Eq (HTMLParagraphElement) where
  (HTMLParagraphElement a) == (HTMLParagraphElement b) = js_eq a b

instance PToJSRef HTMLParagraphElement where
  pToJSRef = unHTMLParagraphElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLParagraphElement where
  pFromJSRef = HTMLParagraphElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLParagraphElement where
  toJSRef = return . unHTMLParagraphElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLParagraphElement where
  fromJSRef = return . fmap HTMLParagraphElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLParagraphElement
instance IsElement HTMLParagraphElement
instance IsNode HTMLParagraphElement
instance IsEventTarget HTMLParagraphElement
instance IsGObject HTMLParagraphElement where
  toGObject = GObject . unHTMLParagraphElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLParagraphElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLParagraphElement :: IsGObject obj => obj -> HTMLParagraphElement
castToHTMLParagraphElement = castTo gTypeHTMLParagraphElement "HTMLParagraphElement"

foreign import javascript unsafe "window[\"HTMLParagraphElement\"]" gTypeHTMLParagraphElement :: GType
#else
type IsHTMLParagraphElement o = HTMLParagraphElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLParamElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLParamElement Mozilla HTMLParamElement documentation>
newtype HTMLParamElement = HTMLParamElement { unHTMLParamElement :: JSRef }

instance Eq (HTMLParamElement) where
  (HTMLParamElement a) == (HTMLParamElement b) = js_eq a b

instance PToJSRef HTMLParamElement where
  pToJSRef = unHTMLParamElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLParamElement where
  pFromJSRef = HTMLParamElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLParamElement where
  toJSRef = return . unHTMLParamElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLParamElement where
  fromJSRef = return . fmap HTMLParamElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLParamElement
instance IsElement HTMLParamElement
instance IsNode HTMLParamElement
instance IsEventTarget HTMLParamElement
instance IsGObject HTMLParamElement where
  toGObject = GObject . unHTMLParamElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLParamElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLParamElement :: IsGObject obj => obj -> HTMLParamElement
castToHTMLParamElement = castTo gTypeHTMLParamElement "HTMLParamElement"

foreign import javascript unsafe "window[\"HTMLParamElement\"]" gTypeHTMLParamElement :: GType
#else
type IsHTMLParamElement o = HTMLParamElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLPreElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLPreElement Mozilla HTMLPreElement documentation>
newtype HTMLPreElement = HTMLPreElement { unHTMLPreElement :: JSRef }

instance Eq (HTMLPreElement) where
  (HTMLPreElement a) == (HTMLPreElement b) = js_eq a b

instance PToJSRef HTMLPreElement where
  pToJSRef = unHTMLPreElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLPreElement where
  pFromJSRef = HTMLPreElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLPreElement where
  toJSRef = return . unHTMLPreElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLPreElement where
  fromJSRef = return . fmap HTMLPreElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLPreElement
instance IsElement HTMLPreElement
instance IsNode HTMLPreElement
instance IsEventTarget HTMLPreElement
instance IsGObject HTMLPreElement where
  toGObject = GObject . unHTMLPreElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLPreElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLPreElement :: IsGObject obj => obj -> HTMLPreElement
castToHTMLPreElement = castTo gTypeHTMLPreElement "HTMLPreElement"

foreign import javascript unsafe "window[\"HTMLPreElement\"]" gTypeHTMLPreElement :: GType
#else
type IsHTMLPreElement o = HTMLPreElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLProgressElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLProgressElement Mozilla HTMLProgressElement documentation>
newtype HTMLProgressElement = HTMLProgressElement { unHTMLProgressElement :: JSRef }

instance Eq (HTMLProgressElement) where
  (HTMLProgressElement a) == (HTMLProgressElement b) = js_eq a b

instance PToJSRef HTMLProgressElement where
  pToJSRef = unHTMLProgressElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLProgressElement where
  pFromJSRef = HTMLProgressElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLProgressElement where
  toJSRef = return . unHTMLProgressElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLProgressElement where
  fromJSRef = return . fmap HTMLProgressElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLProgressElement
instance IsElement HTMLProgressElement
instance IsNode HTMLProgressElement
instance IsEventTarget HTMLProgressElement
instance IsGObject HTMLProgressElement where
  toGObject = GObject . unHTMLProgressElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLProgressElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLProgressElement :: IsGObject obj => obj -> HTMLProgressElement
castToHTMLProgressElement = castTo gTypeHTMLProgressElement "HTMLProgressElement"

foreign import javascript unsafe "window[\"HTMLProgressElement\"]" gTypeHTMLProgressElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLQuoteElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLQuoteElement Mozilla HTMLQuoteElement documentation>
newtype HTMLQuoteElement = HTMLQuoteElement { unHTMLQuoteElement :: JSRef }

instance Eq (HTMLQuoteElement) where
  (HTMLQuoteElement a) == (HTMLQuoteElement b) = js_eq a b

instance PToJSRef HTMLQuoteElement where
  pToJSRef = unHTMLQuoteElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLQuoteElement where
  pFromJSRef = HTMLQuoteElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLQuoteElement where
  toJSRef = return . unHTMLQuoteElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLQuoteElement where
  fromJSRef = return . fmap HTMLQuoteElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLQuoteElement
instance IsElement HTMLQuoteElement
instance IsNode HTMLQuoteElement
instance IsEventTarget HTMLQuoteElement
instance IsGObject HTMLQuoteElement where
  toGObject = GObject . unHTMLQuoteElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLQuoteElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLQuoteElement :: IsGObject obj => obj -> HTMLQuoteElement
castToHTMLQuoteElement = castTo gTypeHTMLQuoteElement "HTMLQuoteElement"

foreign import javascript unsafe "window[\"HTMLQuoteElement\"]" gTypeHTMLQuoteElement :: GType
#else
type IsHTMLQuoteElement o = HTMLQuoteElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLScriptElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLScriptElement Mozilla HTMLScriptElement documentation>
newtype HTMLScriptElement = HTMLScriptElement { unHTMLScriptElement :: JSRef }

instance Eq (HTMLScriptElement) where
  (HTMLScriptElement a) == (HTMLScriptElement b) = js_eq a b

instance PToJSRef HTMLScriptElement where
  pToJSRef = unHTMLScriptElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLScriptElement where
  pFromJSRef = HTMLScriptElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLScriptElement where
  toJSRef = return . unHTMLScriptElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLScriptElement where
  fromJSRef = return . fmap HTMLScriptElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLScriptElement
instance IsElement HTMLScriptElement
instance IsNode HTMLScriptElement
instance IsEventTarget HTMLScriptElement
instance IsGObject HTMLScriptElement where
  toGObject = GObject . unHTMLScriptElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLScriptElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLScriptElement :: IsGObject obj => obj -> HTMLScriptElement
castToHTMLScriptElement = castTo gTypeHTMLScriptElement "HTMLScriptElement"

foreign import javascript unsafe "window[\"HTMLScriptElement\"]" gTypeHTMLScriptElement :: GType
#else
type IsHTMLScriptElement o = HTMLScriptElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLSelectElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLSelectElement Mozilla HTMLSelectElement documentation>
newtype HTMLSelectElement = HTMLSelectElement { unHTMLSelectElement :: JSRef }

instance Eq (HTMLSelectElement) where
  (HTMLSelectElement a) == (HTMLSelectElement b) = js_eq a b

instance PToJSRef HTMLSelectElement where
  pToJSRef = unHTMLSelectElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLSelectElement where
  pFromJSRef = HTMLSelectElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLSelectElement where
  toJSRef = return . unHTMLSelectElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLSelectElement where
  fromJSRef = return . fmap HTMLSelectElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLSelectElement
instance IsElement HTMLSelectElement
instance IsNode HTMLSelectElement
instance IsEventTarget HTMLSelectElement
instance IsGObject HTMLSelectElement where
  toGObject = GObject . unHTMLSelectElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLSelectElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLSelectElement :: IsGObject obj => obj -> HTMLSelectElement
castToHTMLSelectElement = castTo gTypeHTMLSelectElement "HTMLSelectElement"

foreign import javascript unsafe "window[\"HTMLSelectElement\"]" gTypeHTMLSelectElement :: GType
#else
type IsHTMLSelectElement o = HTMLSelectElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLSourceElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLSourceElement Mozilla HTMLSourceElement documentation>
newtype HTMLSourceElement = HTMLSourceElement { unHTMLSourceElement :: JSRef }

instance Eq (HTMLSourceElement) where
  (HTMLSourceElement a) == (HTMLSourceElement b) = js_eq a b

instance PToJSRef HTMLSourceElement where
  pToJSRef = unHTMLSourceElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLSourceElement where
  pFromJSRef = HTMLSourceElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLSourceElement where
  toJSRef = return . unHTMLSourceElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLSourceElement where
  fromJSRef = return . fmap HTMLSourceElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLSourceElement
instance IsElement HTMLSourceElement
instance IsNode HTMLSourceElement
instance IsEventTarget HTMLSourceElement
instance IsGObject HTMLSourceElement where
  toGObject = GObject . unHTMLSourceElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLSourceElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLSourceElement :: IsGObject obj => obj -> HTMLSourceElement
castToHTMLSourceElement = castTo gTypeHTMLSourceElement "HTMLSourceElement"

foreign import javascript unsafe "window[\"HTMLSourceElement\"]" gTypeHTMLSourceElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLSpanElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLSpanElement Mozilla HTMLSpanElement documentation>
newtype HTMLSpanElement = HTMLSpanElement { unHTMLSpanElement :: JSRef }

instance Eq (HTMLSpanElement) where
  (HTMLSpanElement a) == (HTMLSpanElement b) = js_eq a b

instance PToJSRef HTMLSpanElement where
  pToJSRef = unHTMLSpanElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLSpanElement where
  pFromJSRef = HTMLSpanElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLSpanElement where
  toJSRef = return . unHTMLSpanElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLSpanElement where
  fromJSRef = return . fmap HTMLSpanElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLSpanElement
instance IsElement HTMLSpanElement
instance IsNode HTMLSpanElement
instance IsEventTarget HTMLSpanElement
instance IsGObject HTMLSpanElement where
  toGObject = GObject . unHTMLSpanElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLSpanElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLSpanElement :: IsGObject obj => obj -> HTMLSpanElement
castToHTMLSpanElement = castTo gTypeHTMLSpanElement "HTMLSpanElement"

foreign import javascript unsafe "window[\"HTMLSpanElement\"]" gTypeHTMLSpanElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLStyleElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLStyleElement Mozilla HTMLStyleElement documentation>
newtype HTMLStyleElement = HTMLStyleElement { unHTMLStyleElement :: JSRef }

instance Eq (HTMLStyleElement) where
  (HTMLStyleElement a) == (HTMLStyleElement b) = js_eq a b

instance PToJSRef HTMLStyleElement where
  pToJSRef = unHTMLStyleElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLStyleElement where
  pFromJSRef = HTMLStyleElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLStyleElement where
  toJSRef = return . unHTMLStyleElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLStyleElement where
  fromJSRef = return . fmap HTMLStyleElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLStyleElement
instance IsElement HTMLStyleElement
instance IsNode HTMLStyleElement
instance IsEventTarget HTMLStyleElement
instance IsGObject HTMLStyleElement where
  toGObject = GObject . unHTMLStyleElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLStyleElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLStyleElement :: IsGObject obj => obj -> HTMLStyleElement
castToHTMLStyleElement = castTo gTypeHTMLStyleElement "HTMLStyleElement"

foreign import javascript unsafe "window[\"HTMLStyleElement\"]" gTypeHTMLStyleElement :: GType
#else
type IsHTMLStyleElement o = HTMLStyleElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLTableCaptionElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableCaptionElement Mozilla HTMLTableCaptionElement documentation>
newtype HTMLTableCaptionElement = HTMLTableCaptionElement { unHTMLTableCaptionElement :: JSRef }

instance Eq (HTMLTableCaptionElement) where
  (HTMLTableCaptionElement a) == (HTMLTableCaptionElement b) = js_eq a b

instance PToJSRef HTMLTableCaptionElement where
  pToJSRef = unHTMLTableCaptionElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLTableCaptionElement where
  pFromJSRef = HTMLTableCaptionElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLTableCaptionElement where
  toJSRef = return . unHTMLTableCaptionElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLTableCaptionElement where
  fromJSRef = return . fmap HTMLTableCaptionElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLTableCaptionElement
instance IsElement HTMLTableCaptionElement
instance IsNode HTMLTableCaptionElement
instance IsEventTarget HTMLTableCaptionElement
instance IsGObject HTMLTableCaptionElement where
  toGObject = GObject . unHTMLTableCaptionElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLTableCaptionElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLTableCaptionElement :: IsGObject obj => obj -> HTMLTableCaptionElement
castToHTMLTableCaptionElement = castTo gTypeHTMLTableCaptionElement "HTMLTableCaptionElement"

foreign import javascript unsafe "window[\"HTMLTableCaptionElement\"]" gTypeHTMLTableCaptionElement :: GType
#else
type IsHTMLTableCaptionElement o = HTMLTableCaptionElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLTableCellElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableCellElement Mozilla HTMLTableCellElement documentation>
newtype HTMLTableCellElement = HTMLTableCellElement { unHTMLTableCellElement :: JSRef }

instance Eq (HTMLTableCellElement) where
  (HTMLTableCellElement a) == (HTMLTableCellElement b) = js_eq a b

instance PToJSRef HTMLTableCellElement where
  pToJSRef = unHTMLTableCellElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLTableCellElement where
  pFromJSRef = HTMLTableCellElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLTableCellElement where
  toJSRef = return . unHTMLTableCellElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLTableCellElement where
  fromJSRef = return . fmap HTMLTableCellElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLTableCellElement
instance IsElement HTMLTableCellElement
instance IsNode HTMLTableCellElement
instance IsEventTarget HTMLTableCellElement
instance IsGObject HTMLTableCellElement where
  toGObject = GObject . unHTMLTableCellElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLTableCellElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLTableCellElement :: IsGObject obj => obj -> HTMLTableCellElement
castToHTMLTableCellElement = castTo gTypeHTMLTableCellElement "HTMLTableCellElement"

foreign import javascript unsafe "window[\"HTMLTableCellElement\"]" gTypeHTMLTableCellElement :: GType
#else
type IsHTMLTableCellElement o = HTMLTableCellElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLTableColElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableColElement Mozilla HTMLTableColElement documentation>
newtype HTMLTableColElement = HTMLTableColElement { unHTMLTableColElement :: JSRef }

instance Eq (HTMLTableColElement) where
  (HTMLTableColElement a) == (HTMLTableColElement b) = js_eq a b

instance PToJSRef HTMLTableColElement where
  pToJSRef = unHTMLTableColElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLTableColElement where
  pFromJSRef = HTMLTableColElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLTableColElement where
  toJSRef = return . unHTMLTableColElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLTableColElement where
  fromJSRef = return . fmap HTMLTableColElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLTableColElement
instance IsElement HTMLTableColElement
instance IsNode HTMLTableColElement
instance IsEventTarget HTMLTableColElement
instance IsGObject HTMLTableColElement where
  toGObject = GObject . unHTMLTableColElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLTableColElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLTableColElement :: IsGObject obj => obj -> HTMLTableColElement
castToHTMLTableColElement = castTo gTypeHTMLTableColElement "HTMLTableColElement"

foreign import javascript unsafe "window[\"HTMLTableColElement\"]" gTypeHTMLTableColElement :: GType
#else
type IsHTMLTableColElement o = HTMLTableColElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLTableElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableElement Mozilla HTMLTableElement documentation>
newtype HTMLTableElement = HTMLTableElement { unHTMLTableElement :: JSRef }

instance Eq (HTMLTableElement) where
  (HTMLTableElement a) == (HTMLTableElement b) = js_eq a b

instance PToJSRef HTMLTableElement where
  pToJSRef = unHTMLTableElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLTableElement where
  pFromJSRef = HTMLTableElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLTableElement where
  toJSRef = return . unHTMLTableElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLTableElement where
  fromJSRef = return . fmap HTMLTableElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLTableElement
instance IsElement HTMLTableElement
instance IsNode HTMLTableElement
instance IsEventTarget HTMLTableElement
instance IsGObject HTMLTableElement where
  toGObject = GObject . unHTMLTableElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLTableElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLTableElement :: IsGObject obj => obj -> HTMLTableElement
castToHTMLTableElement = castTo gTypeHTMLTableElement "HTMLTableElement"

foreign import javascript unsafe "window[\"HTMLTableElement\"]" gTypeHTMLTableElement :: GType
#else
type IsHTMLTableElement o = HTMLTableElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLTableRowElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableRowElement Mozilla HTMLTableRowElement documentation>
newtype HTMLTableRowElement = HTMLTableRowElement { unHTMLTableRowElement :: JSRef }

instance Eq (HTMLTableRowElement) where
  (HTMLTableRowElement a) == (HTMLTableRowElement b) = js_eq a b

instance PToJSRef HTMLTableRowElement where
  pToJSRef = unHTMLTableRowElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLTableRowElement where
  pFromJSRef = HTMLTableRowElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLTableRowElement where
  toJSRef = return . unHTMLTableRowElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLTableRowElement where
  fromJSRef = return . fmap HTMLTableRowElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLTableRowElement
instance IsElement HTMLTableRowElement
instance IsNode HTMLTableRowElement
instance IsEventTarget HTMLTableRowElement
instance IsGObject HTMLTableRowElement where
  toGObject = GObject . unHTMLTableRowElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLTableRowElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLTableRowElement :: IsGObject obj => obj -> HTMLTableRowElement
castToHTMLTableRowElement = castTo gTypeHTMLTableRowElement "HTMLTableRowElement"

foreign import javascript unsafe "window[\"HTMLTableRowElement\"]" gTypeHTMLTableRowElement :: GType
#else
type IsHTMLTableRowElement o = HTMLTableRowElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLTableSectionElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableSectionElement Mozilla HTMLTableSectionElement documentation>
newtype HTMLTableSectionElement = HTMLTableSectionElement { unHTMLTableSectionElement :: JSRef }

instance Eq (HTMLTableSectionElement) where
  (HTMLTableSectionElement a) == (HTMLTableSectionElement b) = js_eq a b

instance PToJSRef HTMLTableSectionElement where
  pToJSRef = unHTMLTableSectionElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLTableSectionElement where
  pFromJSRef = HTMLTableSectionElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLTableSectionElement where
  toJSRef = return . unHTMLTableSectionElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLTableSectionElement where
  fromJSRef = return . fmap HTMLTableSectionElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLTableSectionElement
instance IsElement HTMLTableSectionElement
instance IsNode HTMLTableSectionElement
instance IsEventTarget HTMLTableSectionElement
instance IsGObject HTMLTableSectionElement where
  toGObject = GObject . unHTMLTableSectionElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLTableSectionElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLTableSectionElement :: IsGObject obj => obj -> HTMLTableSectionElement
castToHTMLTableSectionElement = castTo gTypeHTMLTableSectionElement "HTMLTableSectionElement"

foreign import javascript unsafe "window[\"HTMLTableSectionElement\"]" gTypeHTMLTableSectionElement :: GType
#else
type IsHTMLTableSectionElement o = HTMLTableSectionElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLTemplateElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLTemplateElement Mozilla HTMLTemplateElement documentation>
newtype HTMLTemplateElement = HTMLTemplateElement { unHTMLTemplateElement :: JSRef }

instance Eq (HTMLTemplateElement) where
  (HTMLTemplateElement a) == (HTMLTemplateElement b) = js_eq a b

instance PToJSRef HTMLTemplateElement where
  pToJSRef = unHTMLTemplateElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLTemplateElement where
  pFromJSRef = HTMLTemplateElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLTemplateElement where
  toJSRef = return . unHTMLTemplateElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLTemplateElement where
  fromJSRef = return . fmap HTMLTemplateElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLTemplateElement
instance IsElement HTMLTemplateElement
instance IsNode HTMLTemplateElement
instance IsEventTarget HTMLTemplateElement
instance IsGObject HTMLTemplateElement where
  toGObject = GObject . unHTMLTemplateElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLTemplateElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLTemplateElement :: IsGObject obj => obj -> HTMLTemplateElement
castToHTMLTemplateElement = castTo gTypeHTMLTemplateElement "HTMLTemplateElement"

foreign import javascript unsafe "window[\"HTMLTemplateElement\"]" gTypeHTMLTemplateElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLTextAreaElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLTextAreaElement Mozilla HTMLTextAreaElement documentation>
newtype HTMLTextAreaElement = HTMLTextAreaElement { unHTMLTextAreaElement :: JSRef }

instance Eq (HTMLTextAreaElement) where
  (HTMLTextAreaElement a) == (HTMLTextAreaElement b) = js_eq a b

instance PToJSRef HTMLTextAreaElement where
  pToJSRef = unHTMLTextAreaElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLTextAreaElement where
  pFromJSRef = HTMLTextAreaElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLTextAreaElement where
  toJSRef = return . unHTMLTextAreaElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLTextAreaElement where
  fromJSRef = return . fmap HTMLTextAreaElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLTextAreaElement
instance IsElement HTMLTextAreaElement
instance IsNode HTMLTextAreaElement
instance IsEventTarget HTMLTextAreaElement
instance IsGObject HTMLTextAreaElement where
  toGObject = GObject . unHTMLTextAreaElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLTextAreaElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLTextAreaElement :: IsGObject obj => obj -> HTMLTextAreaElement
castToHTMLTextAreaElement = castTo gTypeHTMLTextAreaElement "HTMLTextAreaElement"

foreign import javascript unsafe "window[\"HTMLTextAreaElement\"]" gTypeHTMLTextAreaElement :: GType
#else
type IsHTMLTextAreaElement o = HTMLTextAreaElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLTitleElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLTitleElement Mozilla HTMLTitleElement documentation>
newtype HTMLTitleElement = HTMLTitleElement { unHTMLTitleElement :: JSRef }

instance Eq (HTMLTitleElement) where
  (HTMLTitleElement a) == (HTMLTitleElement b) = js_eq a b

instance PToJSRef HTMLTitleElement where
  pToJSRef = unHTMLTitleElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLTitleElement where
  pFromJSRef = HTMLTitleElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLTitleElement where
  toJSRef = return . unHTMLTitleElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLTitleElement where
  fromJSRef = return . fmap HTMLTitleElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLTitleElement
instance IsElement HTMLTitleElement
instance IsNode HTMLTitleElement
instance IsEventTarget HTMLTitleElement
instance IsGObject HTMLTitleElement where
  toGObject = GObject . unHTMLTitleElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLTitleElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLTitleElement :: IsGObject obj => obj -> HTMLTitleElement
castToHTMLTitleElement = castTo gTypeHTMLTitleElement "HTMLTitleElement"

foreign import javascript unsafe "window[\"HTMLTitleElement\"]" gTypeHTMLTitleElement :: GType
#else
type IsHTMLTitleElement o = HTMLTitleElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLTrackElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLTrackElement Mozilla HTMLTrackElement documentation>
newtype HTMLTrackElement = HTMLTrackElement { unHTMLTrackElement :: JSRef }

instance Eq (HTMLTrackElement) where
  (HTMLTrackElement a) == (HTMLTrackElement b) = js_eq a b

instance PToJSRef HTMLTrackElement where
  pToJSRef = unHTMLTrackElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLTrackElement where
  pFromJSRef = HTMLTrackElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLTrackElement where
  toJSRef = return . unHTMLTrackElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLTrackElement where
  fromJSRef = return . fmap HTMLTrackElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLTrackElement
instance IsElement HTMLTrackElement
instance IsNode HTMLTrackElement
instance IsEventTarget HTMLTrackElement
instance IsGObject HTMLTrackElement where
  toGObject = GObject . unHTMLTrackElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLTrackElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLTrackElement :: IsGObject obj => obj -> HTMLTrackElement
castToHTMLTrackElement = castTo gTypeHTMLTrackElement "HTMLTrackElement"

foreign import javascript unsafe "window[\"HTMLTrackElement\"]" gTypeHTMLTrackElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLUListElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLUListElement Mozilla HTMLUListElement documentation>
newtype HTMLUListElement = HTMLUListElement { unHTMLUListElement :: JSRef }

instance Eq (HTMLUListElement) where
  (HTMLUListElement a) == (HTMLUListElement b) = js_eq a b

instance PToJSRef HTMLUListElement where
  pToJSRef = unHTMLUListElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLUListElement where
  pFromJSRef = HTMLUListElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLUListElement where
  toJSRef = return . unHTMLUListElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLUListElement where
  fromJSRef = return . fmap HTMLUListElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLUListElement
instance IsElement HTMLUListElement
instance IsNode HTMLUListElement
instance IsEventTarget HTMLUListElement
instance IsGObject HTMLUListElement where
  toGObject = GObject . unHTMLUListElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLUListElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLUListElement :: IsGObject obj => obj -> HTMLUListElement
castToHTMLUListElement = castTo gTypeHTMLUListElement "HTMLUListElement"

foreign import javascript unsafe "window[\"HTMLUListElement\"]" gTypeHTMLUListElement :: GType
#else
type IsHTMLUListElement o = HTMLUListElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLUnknownElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLUnknownElement Mozilla HTMLUnknownElement documentation>
newtype HTMLUnknownElement = HTMLUnknownElement { unHTMLUnknownElement :: JSRef }

instance Eq (HTMLUnknownElement) where
  (HTMLUnknownElement a) == (HTMLUnknownElement b) = js_eq a b

instance PToJSRef HTMLUnknownElement where
  pToJSRef = unHTMLUnknownElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLUnknownElement where
  pFromJSRef = HTMLUnknownElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLUnknownElement where
  toJSRef = return . unHTMLUnknownElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLUnknownElement where
  fromJSRef = return . fmap HTMLUnknownElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLElement HTMLUnknownElement
instance IsElement HTMLUnknownElement
instance IsNode HTMLUnknownElement
instance IsEventTarget HTMLUnknownElement
instance IsGObject HTMLUnknownElement where
  toGObject = GObject . unHTMLUnknownElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLUnknownElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLUnknownElement :: IsGObject obj => obj -> HTMLUnknownElement
castToHTMLUnknownElement = castTo gTypeHTMLUnknownElement "HTMLUnknownElement"

foreign import javascript unsafe "window[\"HTMLUnknownElement\"]" gTypeHTMLUnknownElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HTMLVideoElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.HTMLMediaElement"
--     * "GHCJS.DOM.HTMLElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HTMLVideoElement Mozilla HTMLVideoElement documentation>
newtype HTMLVideoElement = HTMLVideoElement { unHTMLVideoElement :: JSRef }

instance Eq (HTMLVideoElement) where
  (HTMLVideoElement a) == (HTMLVideoElement b) = js_eq a b

instance PToJSRef HTMLVideoElement where
  pToJSRef = unHTMLVideoElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef HTMLVideoElement where
  pFromJSRef = HTMLVideoElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef HTMLVideoElement where
  toJSRef = return . unHTMLVideoElement
  {-# INLINE toJSRef #-}

instance FromJSRef HTMLVideoElement where
  fromJSRef = return . fmap HTMLVideoElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsHTMLMediaElement HTMLVideoElement
instance IsHTMLElement HTMLVideoElement
instance IsElement HTMLVideoElement
instance IsNode HTMLVideoElement
instance IsEventTarget HTMLVideoElement
instance IsGObject HTMLVideoElement where
  toGObject = GObject . unHTMLVideoElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = HTMLVideoElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHTMLVideoElement :: IsGObject obj => obj -> HTMLVideoElement
castToHTMLVideoElement = castTo gTypeHTMLVideoElement "HTMLVideoElement"

foreign import javascript unsafe "window[\"HTMLVideoElement\"]" gTypeHTMLVideoElement :: GType
#else
type IsHTMLVideoElement o = HTMLVideoElementClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.HashChangeEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/HashChangeEvent Mozilla HashChangeEvent documentation>
newtype HashChangeEvent = HashChangeEvent { unHashChangeEvent :: JSRef }

instance Eq (HashChangeEvent) where
  (HashChangeEvent a) == (HashChangeEvent b) = js_eq a b

instance PToJSRef HashChangeEvent where
  pToJSRef = unHashChangeEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef HashChangeEvent where
  pFromJSRef = HashChangeEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef HashChangeEvent where
  toJSRef = return . unHashChangeEvent
  {-# INLINE toJSRef #-}

instance FromJSRef HashChangeEvent where
  fromJSRef = return . fmap HashChangeEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent HashChangeEvent
instance IsGObject HashChangeEvent where
  toGObject = GObject . unHashChangeEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = HashChangeEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHashChangeEvent :: IsGObject obj => obj -> HashChangeEvent
castToHashChangeEvent = castTo gTypeHashChangeEvent "HashChangeEvent"

foreign import javascript unsafe "window[\"HashChangeEvent\"]" gTypeHashChangeEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.History".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/History Mozilla History documentation>
newtype History = History { unHistory :: JSRef }

instance Eq (History) where
  (History a) == (History b) = js_eq a b

instance PToJSRef History where
  pToJSRef = unHistory
  {-# INLINE pToJSRef #-}

instance PFromJSRef History where
  pFromJSRef = History
  {-# INLINE pFromJSRef #-}

instance ToJSRef History where
  toJSRef = return . unHistory
  {-# INLINE toJSRef #-}

instance FromJSRef History where
  fromJSRef = return . fmap History . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject History where
  toGObject = GObject . unHistory
  {-# INLINE toGObject #-}
  unsafeCastGObject = History . unGObject
  {-# INLINE unsafeCastGObject #-}

castToHistory :: IsGObject obj => obj -> History
castToHistory = castTo gTypeHistory "History"

foreign import javascript unsafe "window[\"History\"]" gTypeHistory :: GType
#else
type IsHistory o = HistoryClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.IDBAny".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/IDBAny Mozilla IDBAny documentation>
newtype IDBAny = IDBAny { unIDBAny :: JSRef }

instance Eq (IDBAny) where
  (IDBAny a) == (IDBAny b) = js_eq a b

instance PToJSRef IDBAny where
  pToJSRef = unIDBAny
  {-# INLINE pToJSRef #-}

instance PFromJSRef IDBAny where
  pFromJSRef = IDBAny
  {-# INLINE pFromJSRef #-}

instance ToJSRef IDBAny where
  toJSRef = return . unIDBAny
  {-# INLINE toJSRef #-}

instance FromJSRef IDBAny where
  fromJSRef = return . fmap IDBAny . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject IDBAny where
  toGObject = GObject . unIDBAny
  {-# INLINE toGObject #-}
  unsafeCastGObject = IDBAny . unGObject
  {-# INLINE unsafeCastGObject #-}

castToIDBAny :: IsGObject obj => obj -> IDBAny
castToIDBAny = castTo gTypeIDBAny "IDBAny"

foreign import javascript unsafe "window[\"IDBAny\"]" gTypeIDBAny :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.IDBCursor".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/IDBCursor Mozilla IDBCursor documentation>
newtype IDBCursor = IDBCursor { unIDBCursor :: JSRef }

instance Eq (IDBCursor) where
  (IDBCursor a) == (IDBCursor b) = js_eq a b

instance PToJSRef IDBCursor where
  pToJSRef = unIDBCursor
  {-# INLINE pToJSRef #-}

instance PFromJSRef IDBCursor where
  pFromJSRef = IDBCursor
  {-# INLINE pFromJSRef #-}

instance ToJSRef IDBCursor where
  toJSRef = return . unIDBCursor
  {-# INLINE toJSRef #-}

instance FromJSRef IDBCursor where
  fromJSRef = return . fmap IDBCursor . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsIDBCursor o
toIDBCursor :: IsIDBCursor o => o -> IDBCursor
toIDBCursor = unsafeCastGObject . toGObject

instance IsIDBCursor IDBCursor
instance IsGObject IDBCursor where
  toGObject = GObject . unIDBCursor
  {-# INLINE toGObject #-}
  unsafeCastGObject = IDBCursor . unGObject
  {-# INLINE unsafeCastGObject #-}

castToIDBCursor :: IsGObject obj => obj -> IDBCursor
castToIDBCursor = castTo gTypeIDBCursor "IDBCursor"

foreign import javascript unsafe "window[\"IDBCursor\"]" gTypeIDBCursor :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.IDBCursorWithValue".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.IDBCursor"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/IDBCursorWithValue Mozilla IDBCursorWithValue documentation>
newtype IDBCursorWithValue = IDBCursorWithValue { unIDBCursorWithValue :: JSRef }

instance Eq (IDBCursorWithValue) where
  (IDBCursorWithValue a) == (IDBCursorWithValue b) = js_eq a b

instance PToJSRef IDBCursorWithValue where
  pToJSRef = unIDBCursorWithValue
  {-# INLINE pToJSRef #-}

instance PFromJSRef IDBCursorWithValue where
  pFromJSRef = IDBCursorWithValue
  {-# INLINE pFromJSRef #-}

instance ToJSRef IDBCursorWithValue where
  toJSRef = return . unIDBCursorWithValue
  {-# INLINE toJSRef #-}

instance FromJSRef IDBCursorWithValue where
  fromJSRef = return . fmap IDBCursorWithValue . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsIDBCursor IDBCursorWithValue
instance IsGObject IDBCursorWithValue where
  toGObject = GObject . unIDBCursorWithValue
  {-# INLINE toGObject #-}
  unsafeCastGObject = IDBCursorWithValue . unGObject
  {-# INLINE unsafeCastGObject #-}

castToIDBCursorWithValue :: IsGObject obj => obj -> IDBCursorWithValue
castToIDBCursorWithValue = castTo gTypeIDBCursorWithValue "IDBCursorWithValue"

foreign import javascript unsafe "window[\"IDBCursorWithValue\"]" gTypeIDBCursorWithValue :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.IDBDatabase".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/IDBDatabase Mozilla IDBDatabase documentation>
newtype IDBDatabase = IDBDatabase { unIDBDatabase :: JSRef }

instance Eq (IDBDatabase) where
  (IDBDatabase a) == (IDBDatabase b) = js_eq a b

instance PToJSRef IDBDatabase where
  pToJSRef = unIDBDatabase
  {-# INLINE pToJSRef #-}

instance PFromJSRef IDBDatabase where
  pFromJSRef = IDBDatabase
  {-# INLINE pFromJSRef #-}

instance ToJSRef IDBDatabase where
  toJSRef = return . unIDBDatabase
  {-# INLINE toJSRef #-}

instance FromJSRef IDBDatabase where
  fromJSRef = return . fmap IDBDatabase . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget IDBDatabase
instance IsGObject IDBDatabase where
  toGObject = GObject . unIDBDatabase
  {-# INLINE toGObject #-}
  unsafeCastGObject = IDBDatabase . unGObject
  {-# INLINE unsafeCastGObject #-}

castToIDBDatabase :: IsGObject obj => obj -> IDBDatabase
castToIDBDatabase = castTo gTypeIDBDatabase "IDBDatabase"

foreign import javascript unsafe "window[\"IDBDatabase\"]" gTypeIDBDatabase :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.IDBFactory".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/IDBFactory Mozilla IDBFactory documentation>
newtype IDBFactory = IDBFactory { unIDBFactory :: JSRef }

instance Eq (IDBFactory) where
  (IDBFactory a) == (IDBFactory b) = js_eq a b

instance PToJSRef IDBFactory where
  pToJSRef = unIDBFactory
  {-# INLINE pToJSRef #-}

instance PFromJSRef IDBFactory where
  pFromJSRef = IDBFactory
  {-# INLINE pFromJSRef #-}

instance ToJSRef IDBFactory where
  toJSRef = return . unIDBFactory
  {-# INLINE toJSRef #-}

instance FromJSRef IDBFactory where
  fromJSRef = return . fmap IDBFactory . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject IDBFactory where
  toGObject = GObject . unIDBFactory
  {-# INLINE toGObject #-}
  unsafeCastGObject = IDBFactory . unGObject
  {-# INLINE unsafeCastGObject #-}

castToIDBFactory :: IsGObject obj => obj -> IDBFactory
castToIDBFactory = castTo gTypeIDBFactory "IDBFactory"

foreign import javascript unsafe "window[\"IDBFactory\"]" gTypeIDBFactory :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.IDBIndex".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/IDBIndex Mozilla IDBIndex documentation>
newtype IDBIndex = IDBIndex { unIDBIndex :: JSRef }

instance Eq (IDBIndex) where
  (IDBIndex a) == (IDBIndex b) = js_eq a b

instance PToJSRef IDBIndex where
  pToJSRef = unIDBIndex
  {-# INLINE pToJSRef #-}

instance PFromJSRef IDBIndex where
  pFromJSRef = IDBIndex
  {-# INLINE pFromJSRef #-}

instance ToJSRef IDBIndex where
  toJSRef = return . unIDBIndex
  {-# INLINE toJSRef #-}

instance FromJSRef IDBIndex where
  fromJSRef = return . fmap IDBIndex . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject IDBIndex where
  toGObject = GObject . unIDBIndex
  {-# INLINE toGObject #-}
  unsafeCastGObject = IDBIndex . unGObject
  {-# INLINE unsafeCastGObject #-}

castToIDBIndex :: IsGObject obj => obj -> IDBIndex
castToIDBIndex = castTo gTypeIDBIndex "IDBIndex"

foreign import javascript unsafe "window[\"IDBIndex\"]" gTypeIDBIndex :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.IDBKeyRange".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/IDBKeyRange Mozilla IDBKeyRange documentation>
newtype IDBKeyRange = IDBKeyRange { unIDBKeyRange :: JSRef }

instance Eq (IDBKeyRange) where
  (IDBKeyRange a) == (IDBKeyRange b) = js_eq a b

instance PToJSRef IDBKeyRange where
  pToJSRef = unIDBKeyRange
  {-# INLINE pToJSRef #-}

instance PFromJSRef IDBKeyRange where
  pFromJSRef = IDBKeyRange
  {-# INLINE pFromJSRef #-}

instance ToJSRef IDBKeyRange where
  toJSRef = return . unIDBKeyRange
  {-# INLINE toJSRef #-}

instance FromJSRef IDBKeyRange where
  fromJSRef = return . fmap IDBKeyRange . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject IDBKeyRange where
  toGObject = GObject . unIDBKeyRange
  {-# INLINE toGObject #-}
  unsafeCastGObject = IDBKeyRange . unGObject
  {-# INLINE unsafeCastGObject #-}

castToIDBKeyRange :: IsGObject obj => obj -> IDBKeyRange
castToIDBKeyRange = castTo gTypeIDBKeyRange "IDBKeyRange"

foreign import javascript unsafe "window[\"IDBKeyRange\"]" gTypeIDBKeyRange :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.IDBObjectStore".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/IDBObjectStore Mozilla IDBObjectStore documentation>
newtype IDBObjectStore = IDBObjectStore { unIDBObjectStore :: JSRef }

instance Eq (IDBObjectStore) where
  (IDBObjectStore a) == (IDBObjectStore b) = js_eq a b

instance PToJSRef IDBObjectStore where
  pToJSRef = unIDBObjectStore
  {-# INLINE pToJSRef #-}

instance PFromJSRef IDBObjectStore where
  pFromJSRef = IDBObjectStore
  {-# INLINE pFromJSRef #-}

instance ToJSRef IDBObjectStore where
  toJSRef = return . unIDBObjectStore
  {-# INLINE toJSRef #-}

instance FromJSRef IDBObjectStore where
  fromJSRef = return . fmap IDBObjectStore . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject IDBObjectStore where
  toGObject = GObject . unIDBObjectStore
  {-# INLINE toGObject #-}
  unsafeCastGObject = IDBObjectStore . unGObject
  {-# INLINE unsafeCastGObject #-}

castToIDBObjectStore :: IsGObject obj => obj -> IDBObjectStore
castToIDBObjectStore = castTo gTypeIDBObjectStore "IDBObjectStore"

foreign import javascript unsafe "window[\"IDBObjectStore\"]" gTypeIDBObjectStore :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.IDBOpenDBRequest".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.IDBRequest"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/IDBOpenDBRequest Mozilla IDBOpenDBRequest documentation>
newtype IDBOpenDBRequest = IDBOpenDBRequest { unIDBOpenDBRequest :: JSRef }

instance Eq (IDBOpenDBRequest) where
  (IDBOpenDBRequest a) == (IDBOpenDBRequest b) = js_eq a b

instance PToJSRef IDBOpenDBRequest where
  pToJSRef = unIDBOpenDBRequest
  {-# INLINE pToJSRef #-}

instance PFromJSRef IDBOpenDBRequest where
  pFromJSRef = IDBOpenDBRequest
  {-# INLINE pFromJSRef #-}

instance ToJSRef IDBOpenDBRequest where
  toJSRef = return . unIDBOpenDBRequest
  {-# INLINE toJSRef #-}

instance FromJSRef IDBOpenDBRequest where
  fromJSRef = return . fmap IDBOpenDBRequest . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsIDBRequest IDBOpenDBRequest
instance IsEventTarget IDBOpenDBRequest
instance IsGObject IDBOpenDBRequest where
  toGObject = GObject . unIDBOpenDBRequest
  {-# INLINE toGObject #-}
  unsafeCastGObject = IDBOpenDBRequest . unGObject
  {-# INLINE unsafeCastGObject #-}

castToIDBOpenDBRequest :: IsGObject obj => obj -> IDBOpenDBRequest
castToIDBOpenDBRequest = castTo gTypeIDBOpenDBRequest "IDBOpenDBRequest"

foreign import javascript unsafe "window[\"IDBOpenDBRequest\"]" gTypeIDBOpenDBRequest :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.IDBRequest".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/IDBRequest Mozilla IDBRequest documentation>
newtype IDBRequest = IDBRequest { unIDBRequest :: JSRef }

instance Eq (IDBRequest) where
  (IDBRequest a) == (IDBRequest b) = js_eq a b

instance PToJSRef IDBRequest where
  pToJSRef = unIDBRequest
  {-# INLINE pToJSRef #-}

instance PFromJSRef IDBRequest where
  pFromJSRef = IDBRequest
  {-# INLINE pFromJSRef #-}

instance ToJSRef IDBRequest where
  toJSRef = return . unIDBRequest
  {-# INLINE toJSRef #-}

instance FromJSRef IDBRequest where
  fromJSRef = return . fmap IDBRequest . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsEventTarget o => IsIDBRequest o
toIDBRequest :: IsIDBRequest o => o -> IDBRequest
toIDBRequest = unsafeCastGObject . toGObject

instance IsIDBRequest IDBRequest
instance IsEventTarget IDBRequest
instance IsGObject IDBRequest where
  toGObject = GObject . unIDBRequest
  {-# INLINE toGObject #-}
  unsafeCastGObject = IDBRequest . unGObject
  {-# INLINE unsafeCastGObject #-}

castToIDBRequest :: IsGObject obj => obj -> IDBRequest
castToIDBRequest = castTo gTypeIDBRequest "IDBRequest"

foreign import javascript unsafe "window[\"IDBRequest\"]" gTypeIDBRequest :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.IDBTransaction".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/IDBTransaction Mozilla IDBTransaction documentation>
newtype IDBTransaction = IDBTransaction { unIDBTransaction :: JSRef }

instance Eq (IDBTransaction) where
  (IDBTransaction a) == (IDBTransaction b) = js_eq a b

instance PToJSRef IDBTransaction where
  pToJSRef = unIDBTransaction
  {-# INLINE pToJSRef #-}

instance PFromJSRef IDBTransaction where
  pFromJSRef = IDBTransaction
  {-# INLINE pFromJSRef #-}

instance ToJSRef IDBTransaction where
  toJSRef = return . unIDBTransaction
  {-# INLINE toJSRef #-}

instance FromJSRef IDBTransaction where
  fromJSRef = return . fmap IDBTransaction . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget IDBTransaction
instance IsGObject IDBTransaction where
  toGObject = GObject . unIDBTransaction
  {-# INLINE toGObject #-}
  unsafeCastGObject = IDBTransaction . unGObject
  {-# INLINE unsafeCastGObject #-}

castToIDBTransaction :: IsGObject obj => obj -> IDBTransaction
castToIDBTransaction = castTo gTypeIDBTransaction "IDBTransaction"

foreign import javascript unsafe "window[\"IDBTransaction\"]" gTypeIDBTransaction :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.IDBVersionChangeEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/IDBVersionChangeEvent Mozilla IDBVersionChangeEvent documentation>
newtype IDBVersionChangeEvent = IDBVersionChangeEvent { unIDBVersionChangeEvent :: JSRef }

instance Eq (IDBVersionChangeEvent) where
  (IDBVersionChangeEvent a) == (IDBVersionChangeEvent b) = js_eq a b

instance PToJSRef IDBVersionChangeEvent where
  pToJSRef = unIDBVersionChangeEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef IDBVersionChangeEvent where
  pFromJSRef = IDBVersionChangeEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef IDBVersionChangeEvent where
  toJSRef = return . unIDBVersionChangeEvent
  {-# INLINE toJSRef #-}

instance FromJSRef IDBVersionChangeEvent where
  fromJSRef = return . fmap IDBVersionChangeEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent IDBVersionChangeEvent
instance IsGObject IDBVersionChangeEvent where
  toGObject = GObject . unIDBVersionChangeEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = IDBVersionChangeEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToIDBVersionChangeEvent :: IsGObject obj => obj -> IDBVersionChangeEvent
castToIDBVersionChangeEvent = castTo gTypeIDBVersionChangeEvent "IDBVersionChangeEvent"

foreign import javascript unsafe "window[\"IDBVersionChangeEvent\"]" gTypeIDBVersionChangeEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ImageData".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ImageData Mozilla ImageData documentation>
newtype ImageData = ImageData { unImageData :: JSRef }

instance Eq (ImageData) where
  (ImageData a) == (ImageData b) = js_eq a b

instance PToJSRef ImageData where
  pToJSRef = unImageData
  {-# INLINE pToJSRef #-}

instance PFromJSRef ImageData where
  pFromJSRef = ImageData
  {-# INLINE pFromJSRef #-}

instance ToJSRef ImageData where
  toJSRef = return . unImageData
  {-# INLINE toJSRef #-}

instance FromJSRef ImageData where
  fromJSRef = return . fmap ImageData . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject ImageData where
  toGObject = GObject . unImageData
  {-# INLINE toGObject #-}
  unsafeCastGObject = ImageData . unGObject
  {-# INLINE unsafeCastGObject #-}

castToImageData :: IsGObject obj => obj -> ImageData
castToImageData = castTo gTypeImageData "ImageData"

foreign import javascript unsafe "window[\"ImageData\"]" gTypeImageData :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.InspectorFrontendHost".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/InspectorFrontendHost Mozilla InspectorFrontendHost documentation>
newtype InspectorFrontendHost = InspectorFrontendHost { unInspectorFrontendHost :: JSRef }

instance Eq (InspectorFrontendHost) where
  (InspectorFrontendHost a) == (InspectorFrontendHost b) = js_eq a b

instance PToJSRef InspectorFrontendHost where
  pToJSRef = unInspectorFrontendHost
  {-# INLINE pToJSRef #-}

instance PFromJSRef InspectorFrontendHost where
  pFromJSRef = InspectorFrontendHost
  {-# INLINE pFromJSRef #-}

instance ToJSRef InspectorFrontendHost where
  toJSRef = return . unInspectorFrontendHost
  {-# INLINE toJSRef #-}

instance FromJSRef InspectorFrontendHost where
  fromJSRef = return . fmap InspectorFrontendHost . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject InspectorFrontendHost where
  toGObject = GObject . unInspectorFrontendHost
  {-# INLINE toGObject #-}
  unsafeCastGObject = InspectorFrontendHost . unGObject
  {-# INLINE unsafeCastGObject #-}

castToInspectorFrontendHost :: IsGObject obj => obj -> InspectorFrontendHost
castToInspectorFrontendHost = castTo gTypeInspectorFrontendHost "InspectorFrontendHost"

foreign import javascript unsafe "window[\"InspectorFrontendHost\"]" gTypeInspectorFrontendHost :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.InternalSettings".
-- Base interface functions are in:
--
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/InternalSettings Mozilla InternalSettings documentation>
newtype InternalSettings = InternalSettings { unInternalSettings :: JSRef }

instance Eq (InternalSettings) where
  (InternalSettings a) == (InternalSettings b) = js_eq a b

instance PToJSRef InternalSettings where
  pToJSRef = unInternalSettings
  {-# INLINE pToJSRef #-}

instance PFromJSRef InternalSettings where
  pFromJSRef = InternalSettings
  {-# INLINE pFromJSRef #-}

instance ToJSRef InternalSettings where
  toJSRef = return . unInternalSettings
  {-# INLINE toJSRef #-}

instance FromJSRef InternalSettings where
  fromJSRef = return . fmap InternalSettings . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject InternalSettings where
  toGObject = GObject . unInternalSettings
  {-# INLINE toGObject #-}
  unsafeCastGObject = InternalSettings . unGObject
  {-# INLINE unsafeCastGObject #-}

castToInternalSettings :: IsGObject obj => obj -> InternalSettings
castToInternalSettings = castTo gTypeInternalSettings "InternalSettings"

foreign import javascript unsafe "window[\"InternalSettings\"]" gTypeInternalSettings :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Internals".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Internals Mozilla Internals documentation>
newtype Internals = Internals { unInternals :: JSRef }

instance Eq (Internals) where
  (Internals a) == (Internals b) = js_eq a b

instance PToJSRef Internals where
  pToJSRef = unInternals
  {-# INLINE pToJSRef #-}

instance PFromJSRef Internals where
  pFromJSRef = Internals
  {-# INLINE pFromJSRef #-}

instance ToJSRef Internals where
  toJSRef = return . unInternals
  {-# INLINE toJSRef #-}

instance FromJSRef Internals where
  fromJSRef = return . fmap Internals . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Internals where
  toGObject = GObject . unInternals
  {-# INLINE toGObject #-}
  unsafeCastGObject = Internals . unGObject
  {-# INLINE unsafeCastGObject #-}

castToInternals :: IsGObject obj => obj -> Internals
castToInternals = castTo gTypeInternals "Internals"

foreign import javascript unsafe "window[\"Internals\"]" gTypeInternals :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.KeyboardEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.UIEvent"
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent Mozilla KeyboardEvent documentation>
newtype KeyboardEvent = KeyboardEvent { unKeyboardEvent :: JSRef }

instance Eq (KeyboardEvent) where
  (KeyboardEvent a) == (KeyboardEvent b) = js_eq a b

instance PToJSRef KeyboardEvent where
  pToJSRef = unKeyboardEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef KeyboardEvent where
  pFromJSRef = KeyboardEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef KeyboardEvent where
  toJSRef = return . unKeyboardEvent
  {-# INLINE toJSRef #-}

instance FromJSRef KeyboardEvent where
  fromJSRef = return . fmap KeyboardEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsUIEvent KeyboardEvent
instance IsEvent KeyboardEvent
instance IsGObject KeyboardEvent where
  toGObject = GObject . unKeyboardEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = KeyboardEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToKeyboardEvent :: IsGObject obj => obj -> KeyboardEvent
castToKeyboardEvent = castTo gTypeKeyboardEvent "KeyboardEvent"

foreign import javascript unsafe "window[\"KeyboardEvent\"]" gTypeKeyboardEvent :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsKeyboardEvent o = KeyboardEventClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Location".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Location Mozilla Location documentation>
newtype Location = Location { unLocation :: JSRef }

instance Eq (Location) where
  (Location a) == (Location b) = js_eq a b

instance PToJSRef Location where
  pToJSRef = unLocation
  {-# INLINE pToJSRef #-}

instance PFromJSRef Location where
  pFromJSRef = Location
  {-# INLINE pFromJSRef #-}

instance ToJSRef Location where
  toJSRef = return . unLocation
  {-# INLINE toJSRef #-}

instance FromJSRef Location where
  fromJSRef = return . fmap Location . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Location where
  toGObject = GObject . unLocation
  {-# INLINE toGObject #-}
  unsafeCastGObject = Location . unGObject
  {-# INLINE unsafeCastGObject #-}

castToLocation :: IsGObject obj => obj -> Location
castToLocation = castTo gTypeLocation "Location"

foreign import javascript unsafe "window[\"Location\"]" gTypeLocation :: GType
#else
type IsLocation o = LocationClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MallocStatistics".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MallocStatistics Mozilla MallocStatistics documentation>
newtype MallocStatistics = MallocStatistics { unMallocStatistics :: JSRef }

instance Eq (MallocStatistics) where
  (MallocStatistics a) == (MallocStatistics b) = js_eq a b

instance PToJSRef MallocStatistics where
  pToJSRef = unMallocStatistics
  {-# INLINE pToJSRef #-}

instance PFromJSRef MallocStatistics where
  pFromJSRef = MallocStatistics
  {-# INLINE pFromJSRef #-}

instance ToJSRef MallocStatistics where
  toJSRef = return . unMallocStatistics
  {-# INLINE toJSRef #-}

instance FromJSRef MallocStatistics where
  fromJSRef = return . fmap MallocStatistics . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MallocStatistics where
  toGObject = GObject . unMallocStatistics
  {-# INLINE toGObject #-}
  unsafeCastGObject = MallocStatistics . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMallocStatistics :: IsGObject obj => obj -> MallocStatistics
castToMallocStatistics = castTo gTypeMallocStatistics "MallocStatistics"

foreign import javascript unsafe "window[\"MallocStatistics\"]" gTypeMallocStatistics :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaController".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaController Mozilla MediaController documentation>
newtype MediaController = MediaController { unMediaController :: JSRef }

instance Eq (MediaController) where
  (MediaController a) == (MediaController b) = js_eq a b

instance PToJSRef MediaController where
  pToJSRef = unMediaController
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaController where
  pFromJSRef = MediaController
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaController where
  toJSRef = return . unMediaController
  {-# INLINE toJSRef #-}

instance FromJSRef MediaController where
  fromJSRef = return . fmap MediaController . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget MediaController
instance IsGObject MediaController where
  toGObject = GObject . unMediaController
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaController . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaController :: IsGObject obj => obj -> MediaController
castToMediaController = castTo gTypeMediaController "MediaController"

foreign import javascript unsafe "window[\"MediaController\"]" gTypeMediaController :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaControlsHost".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaControlsHost Mozilla MediaControlsHost documentation>
newtype MediaControlsHost = MediaControlsHost { unMediaControlsHost :: JSRef }

instance Eq (MediaControlsHost) where
  (MediaControlsHost a) == (MediaControlsHost b) = js_eq a b

instance PToJSRef MediaControlsHost where
  pToJSRef = unMediaControlsHost
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaControlsHost where
  pFromJSRef = MediaControlsHost
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaControlsHost where
  toJSRef = return . unMediaControlsHost
  {-# INLINE toJSRef #-}

instance FromJSRef MediaControlsHost where
  fromJSRef = return . fmap MediaControlsHost . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MediaControlsHost where
  toGObject = GObject . unMediaControlsHost
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaControlsHost . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaControlsHost :: IsGObject obj => obj -> MediaControlsHost
castToMediaControlsHost = castTo gTypeMediaControlsHost "MediaControlsHost"

foreign import javascript unsafe "window[\"MediaControlsHost\"]" gTypeMediaControlsHost :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaElementAudioSourceNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaElementAudioSourceNode Mozilla MediaElementAudioSourceNode documentation>
newtype MediaElementAudioSourceNode = MediaElementAudioSourceNode { unMediaElementAudioSourceNode :: JSRef }

instance Eq (MediaElementAudioSourceNode) where
  (MediaElementAudioSourceNode a) == (MediaElementAudioSourceNode b) = js_eq a b

instance PToJSRef MediaElementAudioSourceNode where
  pToJSRef = unMediaElementAudioSourceNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaElementAudioSourceNode where
  pFromJSRef = MediaElementAudioSourceNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaElementAudioSourceNode where
  toJSRef = return . unMediaElementAudioSourceNode
  {-# INLINE toJSRef #-}

instance FromJSRef MediaElementAudioSourceNode where
  fromJSRef = return . fmap MediaElementAudioSourceNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode MediaElementAudioSourceNode
instance IsEventTarget MediaElementAudioSourceNode
instance IsGObject MediaElementAudioSourceNode where
  toGObject = GObject . unMediaElementAudioSourceNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaElementAudioSourceNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaElementAudioSourceNode :: IsGObject obj => obj -> MediaElementAudioSourceNode
castToMediaElementAudioSourceNode = castTo gTypeMediaElementAudioSourceNode "MediaElementAudioSourceNode"

foreign import javascript unsafe "window[\"MediaElementAudioSourceNode\"]" gTypeMediaElementAudioSourceNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaError".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaError Mozilla MediaError documentation>
newtype MediaError = MediaError { unMediaError :: JSRef }

instance Eq (MediaError) where
  (MediaError a) == (MediaError b) = js_eq a b

instance PToJSRef MediaError where
  pToJSRef = unMediaError
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaError where
  pFromJSRef = MediaError
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaError where
  toJSRef = return . unMediaError
  {-# INLINE toJSRef #-}

instance FromJSRef MediaError where
  fromJSRef = return . fmap MediaError . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MediaError where
  toGObject = GObject . unMediaError
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaError . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaError :: IsGObject obj => obj -> MediaError
castToMediaError = castTo gTypeMediaError "MediaError"

foreign import javascript unsafe "window[\"MediaError\"]" gTypeMediaError :: GType
#else
type IsMediaError o = MediaErrorClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaKeyError".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitMediaKeyError Mozilla WebKitMediaKeyError documentation>
newtype MediaKeyError = MediaKeyError { unMediaKeyError :: JSRef }

instance Eq (MediaKeyError) where
  (MediaKeyError a) == (MediaKeyError b) = js_eq a b

instance PToJSRef MediaKeyError where
  pToJSRef = unMediaKeyError
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaKeyError where
  pFromJSRef = MediaKeyError
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaKeyError where
  toJSRef = return . unMediaKeyError
  {-# INLINE toJSRef #-}

instance FromJSRef MediaKeyError where
  fromJSRef = return . fmap MediaKeyError . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MediaKeyError where
  toGObject = GObject . unMediaKeyError
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaKeyError . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaKeyError :: IsGObject obj => obj -> MediaKeyError
castToMediaKeyError = castTo gTypeMediaKeyError "MediaKeyError"

foreign import javascript unsafe "window[\"WebKitMediaKeyError\"]" gTypeMediaKeyError :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaKeyEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaKeyEvent Mozilla MediaKeyEvent documentation>
newtype MediaKeyEvent = MediaKeyEvent { unMediaKeyEvent :: JSRef }

instance Eq (MediaKeyEvent) where
  (MediaKeyEvent a) == (MediaKeyEvent b) = js_eq a b

instance PToJSRef MediaKeyEvent where
  pToJSRef = unMediaKeyEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaKeyEvent where
  pFromJSRef = MediaKeyEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaKeyEvent where
  toJSRef = return . unMediaKeyEvent
  {-# INLINE toJSRef #-}

instance FromJSRef MediaKeyEvent where
  fromJSRef = return . fmap MediaKeyEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent MediaKeyEvent
instance IsGObject MediaKeyEvent where
  toGObject = GObject . unMediaKeyEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaKeyEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaKeyEvent :: IsGObject obj => obj -> MediaKeyEvent
castToMediaKeyEvent = castTo gTypeMediaKeyEvent "MediaKeyEvent"

foreign import javascript unsafe "window[\"MediaKeyEvent\"]" gTypeMediaKeyEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaKeyMessageEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitMediaKeyMessageEvent Mozilla WebKitMediaKeyMessageEvent documentation>
newtype MediaKeyMessageEvent = MediaKeyMessageEvent { unMediaKeyMessageEvent :: JSRef }

instance Eq (MediaKeyMessageEvent) where
  (MediaKeyMessageEvent a) == (MediaKeyMessageEvent b) = js_eq a b

instance PToJSRef MediaKeyMessageEvent where
  pToJSRef = unMediaKeyMessageEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaKeyMessageEvent where
  pFromJSRef = MediaKeyMessageEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaKeyMessageEvent where
  toJSRef = return . unMediaKeyMessageEvent
  {-# INLINE toJSRef #-}

instance FromJSRef MediaKeyMessageEvent where
  fromJSRef = return . fmap MediaKeyMessageEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent MediaKeyMessageEvent
instance IsGObject MediaKeyMessageEvent where
  toGObject = GObject . unMediaKeyMessageEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaKeyMessageEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaKeyMessageEvent :: IsGObject obj => obj -> MediaKeyMessageEvent
castToMediaKeyMessageEvent = castTo gTypeMediaKeyMessageEvent "MediaKeyMessageEvent"

foreign import javascript unsafe "window[\"WebKitMediaKeyMessageEvent\"]" gTypeMediaKeyMessageEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaKeyNeededEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaKeyNeededEvent Mozilla MediaKeyNeededEvent documentation>
newtype MediaKeyNeededEvent = MediaKeyNeededEvent { unMediaKeyNeededEvent :: JSRef }

instance Eq (MediaKeyNeededEvent) where
  (MediaKeyNeededEvent a) == (MediaKeyNeededEvent b) = js_eq a b

instance PToJSRef MediaKeyNeededEvent where
  pToJSRef = unMediaKeyNeededEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaKeyNeededEvent where
  pFromJSRef = MediaKeyNeededEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaKeyNeededEvent where
  toJSRef = return . unMediaKeyNeededEvent
  {-# INLINE toJSRef #-}

instance FromJSRef MediaKeyNeededEvent where
  fromJSRef = return . fmap MediaKeyNeededEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent MediaKeyNeededEvent
instance IsGObject MediaKeyNeededEvent where
  toGObject = GObject . unMediaKeyNeededEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaKeyNeededEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaKeyNeededEvent :: IsGObject obj => obj -> MediaKeyNeededEvent
castToMediaKeyNeededEvent = castTo gTypeMediaKeyNeededEvent "MediaKeyNeededEvent"

foreign import javascript unsafe "window[\"MediaKeyNeededEvent\"]" gTypeMediaKeyNeededEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaKeySession".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitMediaKeySession Mozilla WebKitMediaKeySession documentation>
newtype MediaKeySession = MediaKeySession { unMediaKeySession :: JSRef }

instance Eq (MediaKeySession) where
  (MediaKeySession a) == (MediaKeySession b) = js_eq a b

instance PToJSRef MediaKeySession where
  pToJSRef = unMediaKeySession
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaKeySession where
  pFromJSRef = MediaKeySession
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaKeySession where
  toJSRef = return . unMediaKeySession
  {-# INLINE toJSRef #-}

instance FromJSRef MediaKeySession where
  fromJSRef = return . fmap MediaKeySession . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget MediaKeySession
instance IsGObject MediaKeySession where
  toGObject = GObject . unMediaKeySession
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaKeySession . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaKeySession :: IsGObject obj => obj -> MediaKeySession
castToMediaKeySession = castTo gTypeMediaKeySession "MediaKeySession"

foreign import javascript unsafe "window[\"WebKitMediaKeySession\"]" gTypeMediaKeySession :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaKeys".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitMediaKeys Mozilla WebKitMediaKeys documentation>
newtype MediaKeys = MediaKeys { unMediaKeys :: JSRef }

instance Eq (MediaKeys) where
  (MediaKeys a) == (MediaKeys b) = js_eq a b

instance PToJSRef MediaKeys where
  pToJSRef = unMediaKeys
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaKeys where
  pFromJSRef = MediaKeys
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaKeys where
  toJSRef = return . unMediaKeys
  {-# INLINE toJSRef #-}

instance FromJSRef MediaKeys where
  fromJSRef = return . fmap MediaKeys . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MediaKeys where
  toGObject = GObject . unMediaKeys
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaKeys . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaKeys :: IsGObject obj => obj -> MediaKeys
castToMediaKeys = castTo gTypeMediaKeys "MediaKeys"

foreign import javascript unsafe "window[\"WebKitMediaKeys\"]" gTypeMediaKeys :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaList Mozilla MediaList documentation>
newtype MediaList = MediaList { unMediaList :: JSRef }

instance Eq (MediaList) where
  (MediaList a) == (MediaList b) = js_eq a b

instance PToJSRef MediaList where
  pToJSRef = unMediaList
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaList where
  pFromJSRef = MediaList
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaList where
  toJSRef = return . unMediaList
  {-# INLINE toJSRef #-}

instance FromJSRef MediaList where
  fromJSRef = return . fmap MediaList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MediaList where
  toGObject = GObject . unMediaList
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaList :: IsGObject obj => obj -> MediaList
castToMediaList = castTo gTypeMediaList "MediaList"

foreign import javascript unsafe "window[\"MediaList\"]" gTypeMediaList :: GType
#else
type IsMediaList o = MediaListClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaQueryList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaQueryList Mozilla MediaQueryList documentation>
newtype MediaQueryList = MediaQueryList { unMediaQueryList :: JSRef }

instance Eq (MediaQueryList) where
  (MediaQueryList a) == (MediaQueryList b) = js_eq a b

instance PToJSRef MediaQueryList where
  pToJSRef = unMediaQueryList
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaQueryList where
  pFromJSRef = MediaQueryList
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaQueryList where
  toJSRef = return . unMediaQueryList
  {-# INLINE toJSRef #-}

instance FromJSRef MediaQueryList where
  fromJSRef = return . fmap MediaQueryList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MediaQueryList where
  toGObject = GObject . unMediaQueryList
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaQueryList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaQueryList :: IsGObject obj => obj -> MediaQueryList
castToMediaQueryList = castTo gTypeMediaQueryList "MediaQueryList"

foreign import javascript unsafe "window[\"MediaQueryList\"]" gTypeMediaQueryList :: GType
#else
type IsMediaQueryList o = MediaQueryListClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaSource".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaSource Mozilla MediaSource documentation>
newtype MediaSource = MediaSource { unMediaSource :: JSRef }

instance Eq (MediaSource) where
  (MediaSource a) == (MediaSource b) = js_eq a b

instance PToJSRef MediaSource where
  pToJSRef = unMediaSource
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaSource where
  pFromJSRef = MediaSource
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaSource where
  toJSRef = return . unMediaSource
  {-# INLINE toJSRef #-}

instance FromJSRef MediaSource where
  fromJSRef = return . fmap MediaSource . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget MediaSource
instance IsGObject MediaSource where
  toGObject = GObject . unMediaSource
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaSource . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaSource :: IsGObject obj => obj -> MediaSource
castToMediaSource = castTo gTypeMediaSource "MediaSource"

foreign import javascript unsafe "window[\"MediaSource\"]" gTypeMediaSource :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaSourceStates".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaSourceStates Mozilla MediaSourceStates documentation>
newtype MediaSourceStates = MediaSourceStates { unMediaSourceStates :: JSRef }

instance Eq (MediaSourceStates) where
  (MediaSourceStates a) == (MediaSourceStates b) = js_eq a b

instance PToJSRef MediaSourceStates where
  pToJSRef = unMediaSourceStates
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaSourceStates where
  pFromJSRef = MediaSourceStates
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaSourceStates where
  toJSRef = return . unMediaSourceStates
  {-# INLINE toJSRef #-}

instance FromJSRef MediaSourceStates where
  fromJSRef = return . fmap MediaSourceStates . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MediaSourceStates where
  toGObject = GObject . unMediaSourceStates
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaSourceStates . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaSourceStates :: IsGObject obj => obj -> MediaSourceStates
castToMediaSourceStates = castTo gTypeMediaSourceStates "MediaSourceStates"

foreign import javascript unsafe "window[\"MediaSourceStates\"]" gTypeMediaSourceStates :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaStream".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/webkitMediaStream Mozilla webkitMediaStream documentation>
newtype MediaStream = MediaStream { unMediaStream :: JSRef }

instance Eq (MediaStream) where
  (MediaStream a) == (MediaStream b) = js_eq a b

instance PToJSRef MediaStream where
  pToJSRef = unMediaStream
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaStream where
  pFromJSRef = MediaStream
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaStream where
  toJSRef = return . unMediaStream
  {-# INLINE toJSRef #-}

instance FromJSRef MediaStream where
  fromJSRef = return . fmap MediaStream . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget MediaStream
instance IsGObject MediaStream where
  toGObject = GObject . unMediaStream
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaStream . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaStream :: IsGObject obj => obj -> MediaStream
castToMediaStream = castTo gTypeMediaStream "MediaStream"

foreign import javascript unsafe "window[\"webkitMediaStream\"]" gTypeMediaStream :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaStreamAudioDestinationNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamAudioDestinationNode Mozilla MediaStreamAudioDestinationNode documentation>
newtype MediaStreamAudioDestinationNode = MediaStreamAudioDestinationNode { unMediaStreamAudioDestinationNode :: JSRef }

instance Eq (MediaStreamAudioDestinationNode) where
  (MediaStreamAudioDestinationNode a) == (MediaStreamAudioDestinationNode b) = js_eq a b

instance PToJSRef MediaStreamAudioDestinationNode where
  pToJSRef = unMediaStreamAudioDestinationNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaStreamAudioDestinationNode where
  pFromJSRef = MediaStreamAudioDestinationNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaStreamAudioDestinationNode where
  toJSRef = return . unMediaStreamAudioDestinationNode
  {-# INLINE toJSRef #-}

instance FromJSRef MediaStreamAudioDestinationNode where
  fromJSRef = return . fmap MediaStreamAudioDestinationNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode MediaStreamAudioDestinationNode
instance IsEventTarget MediaStreamAudioDestinationNode
instance IsGObject MediaStreamAudioDestinationNode where
  toGObject = GObject . unMediaStreamAudioDestinationNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaStreamAudioDestinationNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaStreamAudioDestinationNode :: IsGObject obj => obj -> MediaStreamAudioDestinationNode
castToMediaStreamAudioDestinationNode = castTo gTypeMediaStreamAudioDestinationNode "MediaStreamAudioDestinationNode"

foreign import javascript unsafe "window[\"MediaStreamAudioDestinationNode\"]" gTypeMediaStreamAudioDestinationNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaStreamAudioSourceNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamAudioSourceNode Mozilla MediaStreamAudioSourceNode documentation>
newtype MediaStreamAudioSourceNode = MediaStreamAudioSourceNode { unMediaStreamAudioSourceNode :: JSRef }

instance Eq (MediaStreamAudioSourceNode) where
  (MediaStreamAudioSourceNode a) == (MediaStreamAudioSourceNode b) = js_eq a b

instance PToJSRef MediaStreamAudioSourceNode where
  pToJSRef = unMediaStreamAudioSourceNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaStreamAudioSourceNode where
  pFromJSRef = MediaStreamAudioSourceNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaStreamAudioSourceNode where
  toJSRef = return . unMediaStreamAudioSourceNode
  {-# INLINE toJSRef #-}

instance FromJSRef MediaStreamAudioSourceNode where
  fromJSRef = return . fmap MediaStreamAudioSourceNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode MediaStreamAudioSourceNode
instance IsEventTarget MediaStreamAudioSourceNode
instance IsGObject MediaStreamAudioSourceNode where
  toGObject = GObject . unMediaStreamAudioSourceNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaStreamAudioSourceNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaStreamAudioSourceNode :: IsGObject obj => obj -> MediaStreamAudioSourceNode
castToMediaStreamAudioSourceNode = castTo gTypeMediaStreamAudioSourceNode "MediaStreamAudioSourceNode"

foreign import javascript unsafe "window[\"MediaStreamAudioSourceNode\"]" gTypeMediaStreamAudioSourceNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaStreamCapabilities".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamCapabilities Mozilla MediaStreamCapabilities documentation>
newtype MediaStreamCapabilities = MediaStreamCapabilities { unMediaStreamCapabilities :: JSRef }

instance Eq (MediaStreamCapabilities) where
  (MediaStreamCapabilities a) == (MediaStreamCapabilities b) = js_eq a b

instance PToJSRef MediaStreamCapabilities where
  pToJSRef = unMediaStreamCapabilities
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaStreamCapabilities where
  pFromJSRef = MediaStreamCapabilities
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaStreamCapabilities where
  toJSRef = return . unMediaStreamCapabilities
  {-# INLINE toJSRef #-}

instance FromJSRef MediaStreamCapabilities where
  fromJSRef = return . fmap MediaStreamCapabilities . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsMediaStreamCapabilities o
toMediaStreamCapabilities :: IsMediaStreamCapabilities o => o -> MediaStreamCapabilities
toMediaStreamCapabilities = unsafeCastGObject . toGObject

instance IsMediaStreamCapabilities MediaStreamCapabilities
instance IsGObject MediaStreamCapabilities where
  toGObject = GObject . unMediaStreamCapabilities
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaStreamCapabilities . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaStreamCapabilities :: IsGObject obj => obj -> MediaStreamCapabilities
castToMediaStreamCapabilities = castTo gTypeMediaStreamCapabilities "MediaStreamCapabilities"

foreign import javascript unsafe "window[\"MediaStreamCapabilities\"]" gTypeMediaStreamCapabilities :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaStreamEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamEvent Mozilla MediaStreamEvent documentation>
newtype MediaStreamEvent = MediaStreamEvent { unMediaStreamEvent :: JSRef }

instance Eq (MediaStreamEvent) where
  (MediaStreamEvent a) == (MediaStreamEvent b) = js_eq a b

instance PToJSRef MediaStreamEvent where
  pToJSRef = unMediaStreamEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaStreamEvent where
  pFromJSRef = MediaStreamEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaStreamEvent where
  toJSRef = return . unMediaStreamEvent
  {-# INLINE toJSRef #-}

instance FromJSRef MediaStreamEvent where
  fromJSRef = return . fmap MediaStreamEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent MediaStreamEvent
instance IsGObject MediaStreamEvent where
  toGObject = GObject . unMediaStreamEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaStreamEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaStreamEvent :: IsGObject obj => obj -> MediaStreamEvent
castToMediaStreamEvent = castTo gTypeMediaStreamEvent "MediaStreamEvent"

foreign import javascript unsafe "window[\"MediaStreamEvent\"]" gTypeMediaStreamEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaStreamTrack".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack Mozilla MediaStreamTrack documentation>
newtype MediaStreamTrack = MediaStreamTrack { unMediaStreamTrack :: JSRef }

instance Eq (MediaStreamTrack) where
  (MediaStreamTrack a) == (MediaStreamTrack b) = js_eq a b

instance PToJSRef MediaStreamTrack where
  pToJSRef = unMediaStreamTrack
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaStreamTrack where
  pFromJSRef = MediaStreamTrack
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaStreamTrack where
  toJSRef = return . unMediaStreamTrack
  {-# INLINE toJSRef #-}

instance FromJSRef MediaStreamTrack where
  fromJSRef = return . fmap MediaStreamTrack . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsEventTarget o => IsMediaStreamTrack o
toMediaStreamTrack :: IsMediaStreamTrack o => o -> MediaStreamTrack
toMediaStreamTrack = unsafeCastGObject . toGObject

instance IsMediaStreamTrack MediaStreamTrack
instance IsEventTarget MediaStreamTrack
instance IsGObject MediaStreamTrack where
  toGObject = GObject . unMediaStreamTrack
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaStreamTrack . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaStreamTrack :: IsGObject obj => obj -> MediaStreamTrack
castToMediaStreamTrack = castTo gTypeMediaStreamTrack "MediaStreamTrack"

foreign import javascript unsafe "window[\"MediaStreamTrack\"]" gTypeMediaStreamTrack :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaStreamTrackEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrackEvent Mozilla MediaStreamTrackEvent documentation>
newtype MediaStreamTrackEvent = MediaStreamTrackEvent { unMediaStreamTrackEvent :: JSRef }

instance Eq (MediaStreamTrackEvent) where
  (MediaStreamTrackEvent a) == (MediaStreamTrackEvent b) = js_eq a b

instance PToJSRef MediaStreamTrackEvent where
  pToJSRef = unMediaStreamTrackEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaStreamTrackEvent where
  pFromJSRef = MediaStreamTrackEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaStreamTrackEvent where
  toJSRef = return . unMediaStreamTrackEvent
  {-# INLINE toJSRef #-}

instance FromJSRef MediaStreamTrackEvent where
  fromJSRef = return . fmap MediaStreamTrackEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent MediaStreamTrackEvent
instance IsGObject MediaStreamTrackEvent where
  toGObject = GObject . unMediaStreamTrackEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaStreamTrackEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaStreamTrackEvent :: IsGObject obj => obj -> MediaStreamTrackEvent
castToMediaStreamTrackEvent = castTo gTypeMediaStreamTrackEvent "MediaStreamTrackEvent"

foreign import javascript unsafe "window[\"MediaStreamTrackEvent\"]" gTypeMediaStreamTrackEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaTrackConstraint".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraint Mozilla MediaTrackConstraint documentation>
newtype MediaTrackConstraint = MediaTrackConstraint { unMediaTrackConstraint :: JSRef }

instance Eq (MediaTrackConstraint) where
  (MediaTrackConstraint a) == (MediaTrackConstraint b) = js_eq a b

instance PToJSRef MediaTrackConstraint where
  pToJSRef = unMediaTrackConstraint
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaTrackConstraint where
  pFromJSRef = MediaTrackConstraint
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaTrackConstraint where
  toJSRef = return . unMediaTrackConstraint
  {-# INLINE toJSRef #-}

instance FromJSRef MediaTrackConstraint where
  fromJSRef = return . fmap MediaTrackConstraint . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MediaTrackConstraint where
  toGObject = GObject . unMediaTrackConstraint
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaTrackConstraint . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaTrackConstraint :: IsGObject obj => obj -> MediaTrackConstraint
castToMediaTrackConstraint = castTo gTypeMediaTrackConstraint "MediaTrackConstraint"

foreign import javascript unsafe "window[\"MediaTrackConstraint\"]" gTypeMediaTrackConstraint :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaTrackConstraintSet".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraintSet Mozilla MediaTrackConstraintSet documentation>
newtype MediaTrackConstraintSet = MediaTrackConstraintSet { unMediaTrackConstraintSet :: JSRef }

instance Eq (MediaTrackConstraintSet) where
  (MediaTrackConstraintSet a) == (MediaTrackConstraintSet b) = js_eq a b

instance PToJSRef MediaTrackConstraintSet where
  pToJSRef = unMediaTrackConstraintSet
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaTrackConstraintSet where
  pFromJSRef = MediaTrackConstraintSet
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaTrackConstraintSet where
  toJSRef = return . unMediaTrackConstraintSet
  {-# INLINE toJSRef #-}

instance FromJSRef MediaTrackConstraintSet where
  fromJSRef = return . fmap MediaTrackConstraintSet . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MediaTrackConstraintSet where
  toGObject = GObject . unMediaTrackConstraintSet
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaTrackConstraintSet . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaTrackConstraintSet :: IsGObject obj => obj -> MediaTrackConstraintSet
castToMediaTrackConstraintSet = castTo gTypeMediaTrackConstraintSet "MediaTrackConstraintSet"

foreign import javascript unsafe "window[\"MediaTrackConstraintSet\"]" gTypeMediaTrackConstraintSet :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MediaTrackConstraints".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints Mozilla MediaTrackConstraints documentation>
newtype MediaTrackConstraints = MediaTrackConstraints { unMediaTrackConstraints :: JSRef }

instance Eq (MediaTrackConstraints) where
  (MediaTrackConstraints a) == (MediaTrackConstraints b) = js_eq a b

instance PToJSRef MediaTrackConstraints where
  pToJSRef = unMediaTrackConstraints
  {-# INLINE pToJSRef #-}

instance PFromJSRef MediaTrackConstraints where
  pFromJSRef = MediaTrackConstraints
  {-# INLINE pFromJSRef #-}

instance ToJSRef MediaTrackConstraints where
  toJSRef = return . unMediaTrackConstraints
  {-# INLINE toJSRef #-}

instance FromJSRef MediaTrackConstraints where
  fromJSRef = return . fmap MediaTrackConstraints . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MediaTrackConstraints where
  toGObject = GObject . unMediaTrackConstraints
  {-# INLINE toGObject #-}
  unsafeCastGObject = MediaTrackConstraints . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMediaTrackConstraints :: IsGObject obj => obj -> MediaTrackConstraints
castToMediaTrackConstraints = castTo gTypeMediaTrackConstraints "MediaTrackConstraints"

foreign import javascript unsafe "window[\"MediaTrackConstraints\"]" gTypeMediaTrackConstraints :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MemoryInfo".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MemoryInfo Mozilla MemoryInfo documentation>
newtype MemoryInfo = MemoryInfo { unMemoryInfo :: JSRef }

instance Eq (MemoryInfo) where
  (MemoryInfo a) == (MemoryInfo b) = js_eq a b

instance PToJSRef MemoryInfo where
  pToJSRef = unMemoryInfo
  {-# INLINE pToJSRef #-}

instance PFromJSRef MemoryInfo where
  pFromJSRef = MemoryInfo
  {-# INLINE pFromJSRef #-}

instance ToJSRef MemoryInfo where
  toJSRef = return . unMemoryInfo
  {-# INLINE toJSRef #-}

instance FromJSRef MemoryInfo where
  fromJSRef = return . fmap MemoryInfo . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MemoryInfo where
  toGObject = GObject . unMemoryInfo
  {-# INLINE toGObject #-}
  unsafeCastGObject = MemoryInfo . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMemoryInfo :: IsGObject obj => obj -> MemoryInfo
castToMemoryInfo = castTo gTypeMemoryInfo "MemoryInfo"

foreign import javascript unsafe "window[\"MemoryInfo\"]" gTypeMemoryInfo :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MessageChannel".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MessageChannel Mozilla MessageChannel documentation>
newtype MessageChannel = MessageChannel { unMessageChannel :: JSRef }

instance Eq (MessageChannel) where
  (MessageChannel a) == (MessageChannel b) = js_eq a b

instance PToJSRef MessageChannel where
  pToJSRef = unMessageChannel
  {-# INLINE pToJSRef #-}

instance PFromJSRef MessageChannel where
  pFromJSRef = MessageChannel
  {-# INLINE pFromJSRef #-}

instance ToJSRef MessageChannel where
  toJSRef = return . unMessageChannel
  {-# INLINE toJSRef #-}

instance FromJSRef MessageChannel where
  fromJSRef = return . fmap MessageChannel . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MessageChannel where
  toGObject = GObject . unMessageChannel
  {-# INLINE toGObject #-}
  unsafeCastGObject = MessageChannel . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMessageChannel :: IsGObject obj => obj -> MessageChannel
castToMessageChannel = castTo gTypeMessageChannel "MessageChannel"

foreign import javascript unsafe "window[\"MessageChannel\"]" gTypeMessageChannel :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MessageEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MessageEvent Mozilla MessageEvent documentation>
newtype MessageEvent = MessageEvent { unMessageEvent :: JSRef }

instance Eq (MessageEvent) where
  (MessageEvent a) == (MessageEvent b) = js_eq a b

instance PToJSRef MessageEvent where
  pToJSRef = unMessageEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef MessageEvent where
  pFromJSRef = MessageEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef MessageEvent where
  toJSRef = return . unMessageEvent
  {-# INLINE toJSRef #-}

instance FromJSRef MessageEvent where
  fromJSRef = return . fmap MessageEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent MessageEvent
instance IsGObject MessageEvent where
  toGObject = GObject . unMessageEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = MessageEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMessageEvent :: IsGObject obj => obj -> MessageEvent
castToMessageEvent = castTo gTypeMessageEvent "MessageEvent"

foreign import javascript unsafe "window[\"MessageEvent\"]" gTypeMessageEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MessagePort".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MessagePort Mozilla MessagePort documentation>
newtype MessagePort = MessagePort { unMessagePort :: JSRef }

instance Eq (MessagePort) where
  (MessagePort a) == (MessagePort b) = js_eq a b

instance PToJSRef MessagePort where
  pToJSRef = unMessagePort
  {-# INLINE pToJSRef #-}

instance PFromJSRef MessagePort where
  pFromJSRef = MessagePort
  {-# INLINE pFromJSRef #-}

instance ToJSRef MessagePort where
  toJSRef = return . unMessagePort
  {-# INLINE toJSRef #-}

instance FromJSRef MessagePort where
  fromJSRef = return . fmap MessagePort . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget MessagePort
instance IsGObject MessagePort where
  toGObject = GObject . unMessagePort
  {-# INLINE toGObject #-}
  unsafeCastGObject = MessagePort . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMessagePort :: IsGObject obj => obj -> MessagePort
castToMessagePort = castTo gTypeMessagePort "MessagePort"

foreign import javascript unsafe "window[\"MessagePort\"]" gTypeMessagePort :: GType
#else
type IsMessagePort o = MessagePortClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MimeType".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MimeType Mozilla MimeType documentation>
newtype MimeType = MimeType { unMimeType :: JSRef }

instance Eq (MimeType) where
  (MimeType a) == (MimeType b) = js_eq a b

instance PToJSRef MimeType where
  pToJSRef = unMimeType
  {-# INLINE pToJSRef #-}

instance PFromJSRef MimeType where
  pFromJSRef = MimeType
  {-# INLINE pFromJSRef #-}

instance ToJSRef MimeType where
  toJSRef = return . unMimeType
  {-# INLINE toJSRef #-}

instance FromJSRef MimeType where
  fromJSRef = return . fmap MimeType . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MimeType where
  toGObject = GObject . unMimeType
  {-# INLINE toGObject #-}
  unsafeCastGObject = MimeType . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMimeType :: IsGObject obj => obj -> MimeType
castToMimeType = castTo gTypeMimeType "MimeType"

foreign import javascript unsafe "window[\"MimeType\"]" gTypeMimeType :: GType
#else
type IsMimeType o = MimeTypeClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MimeTypeArray".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MimeTypeArray Mozilla MimeTypeArray documentation>
newtype MimeTypeArray = MimeTypeArray { unMimeTypeArray :: JSRef }

instance Eq (MimeTypeArray) where
  (MimeTypeArray a) == (MimeTypeArray b) = js_eq a b

instance PToJSRef MimeTypeArray where
  pToJSRef = unMimeTypeArray
  {-# INLINE pToJSRef #-}

instance PFromJSRef MimeTypeArray where
  pFromJSRef = MimeTypeArray
  {-# INLINE pFromJSRef #-}

instance ToJSRef MimeTypeArray where
  toJSRef = return . unMimeTypeArray
  {-# INLINE toJSRef #-}

instance FromJSRef MimeTypeArray where
  fromJSRef = return . fmap MimeTypeArray . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MimeTypeArray where
  toGObject = GObject . unMimeTypeArray
  {-# INLINE toGObject #-}
  unsafeCastGObject = MimeTypeArray . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMimeTypeArray :: IsGObject obj => obj -> MimeTypeArray
castToMimeTypeArray = castTo gTypeMimeTypeArray "MimeTypeArray"

foreign import javascript unsafe "window[\"MimeTypeArray\"]" gTypeMimeTypeArray :: GType
#else
type IsMimeTypeArray o = MimeTypeArrayClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MouseEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.UIEvent"
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent Mozilla MouseEvent documentation>
newtype MouseEvent = MouseEvent { unMouseEvent :: JSRef }

instance Eq (MouseEvent) where
  (MouseEvent a) == (MouseEvent b) = js_eq a b

instance PToJSRef MouseEvent where
  pToJSRef = unMouseEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef MouseEvent where
  pFromJSRef = MouseEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef MouseEvent where
  toJSRef = return . unMouseEvent
  {-# INLINE toJSRef #-}

instance FromJSRef MouseEvent where
  fromJSRef = return . fmap MouseEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsUIEvent o => IsMouseEvent o
toMouseEvent :: IsMouseEvent o => o -> MouseEvent
toMouseEvent = unsafeCastGObject . toGObject

instance IsMouseEvent MouseEvent
instance IsUIEvent MouseEvent
instance IsEvent MouseEvent
instance IsGObject MouseEvent where
  toGObject = GObject . unMouseEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = MouseEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMouseEvent :: IsGObject obj => obj -> MouseEvent
castToMouseEvent = castTo gTypeMouseEvent "MouseEvent"

foreign import javascript unsafe "window[\"MouseEvent\"]" gTypeMouseEvent :: GType
#else
type IsMouseEvent o = MouseEventClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MutationEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MutationEvent Mozilla MutationEvent documentation>
newtype MutationEvent = MutationEvent { unMutationEvent :: JSRef }

instance Eq (MutationEvent) where
  (MutationEvent a) == (MutationEvent b) = js_eq a b

instance PToJSRef MutationEvent where
  pToJSRef = unMutationEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef MutationEvent where
  pFromJSRef = MutationEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef MutationEvent where
  toJSRef = return . unMutationEvent
  {-# INLINE toJSRef #-}

instance FromJSRef MutationEvent where
  fromJSRef = return . fmap MutationEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent MutationEvent
instance IsGObject MutationEvent where
  toGObject = GObject . unMutationEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = MutationEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMutationEvent :: IsGObject obj => obj -> MutationEvent
castToMutationEvent = castTo gTypeMutationEvent "MutationEvent"

foreign import javascript unsafe "window[\"MutationEvent\"]" gTypeMutationEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MutationObserver".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver Mozilla MutationObserver documentation>
newtype MutationObserver = MutationObserver { unMutationObserver :: JSRef }

instance Eq (MutationObserver) where
  (MutationObserver a) == (MutationObserver b) = js_eq a b

instance PToJSRef MutationObserver where
  pToJSRef = unMutationObserver
  {-# INLINE pToJSRef #-}

instance PFromJSRef MutationObserver where
  pFromJSRef = MutationObserver
  {-# INLINE pFromJSRef #-}

instance ToJSRef MutationObserver where
  toJSRef = return . unMutationObserver
  {-# INLINE toJSRef #-}

instance FromJSRef MutationObserver where
  fromJSRef = return . fmap MutationObserver . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MutationObserver where
  toGObject = GObject . unMutationObserver
  {-# INLINE toGObject #-}
  unsafeCastGObject = MutationObserver . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMutationObserver :: IsGObject obj => obj -> MutationObserver
castToMutationObserver = castTo gTypeMutationObserver "MutationObserver"

foreign import javascript unsafe "window[\"MutationObserver\"]" gTypeMutationObserver :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.MutationRecord".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/MutationRecord Mozilla MutationRecord documentation>
newtype MutationRecord = MutationRecord { unMutationRecord :: JSRef }

instance Eq (MutationRecord) where
  (MutationRecord a) == (MutationRecord b) = js_eq a b

instance PToJSRef MutationRecord where
  pToJSRef = unMutationRecord
  {-# INLINE pToJSRef #-}

instance PFromJSRef MutationRecord where
  pFromJSRef = MutationRecord
  {-# INLINE pFromJSRef #-}

instance ToJSRef MutationRecord where
  toJSRef = return . unMutationRecord
  {-# INLINE toJSRef #-}

instance FromJSRef MutationRecord where
  fromJSRef = return . fmap MutationRecord . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject MutationRecord where
  toGObject = GObject . unMutationRecord
  {-# INLINE toGObject #-}
  unsafeCastGObject = MutationRecord . unGObject
  {-# INLINE unsafeCastGObject #-}

castToMutationRecord :: IsGObject obj => obj -> MutationRecord
castToMutationRecord = castTo gTypeMutationRecord "MutationRecord"

foreign import javascript unsafe "window[\"MutationRecord\"]" gTypeMutationRecord :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.NamedNodeMap".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/NamedNodeMap Mozilla NamedNodeMap documentation>
newtype NamedNodeMap = NamedNodeMap { unNamedNodeMap :: JSRef }

instance Eq (NamedNodeMap) where
  (NamedNodeMap a) == (NamedNodeMap b) = js_eq a b

instance PToJSRef NamedNodeMap where
  pToJSRef = unNamedNodeMap
  {-# INLINE pToJSRef #-}

instance PFromJSRef NamedNodeMap where
  pFromJSRef = NamedNodeMap
  {-# INLINE pFromJSRef #-}

instance ToJSRef NamedNodeMap where
  toJSRef = return . unNamedNodeMap
  {-# INLINE toJSRef #-}

instance FromJSRef NamedNodeMap where
  fromJSRef = return . fmap NamedNodeMap . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject NamedNodeMap where
  toGObject = GObject . unNamedNodeMap
  {-# INLINE toGObject #-}
  unsafeCastGObject = NamedNodeMap . unGObject
  {-# INLINE unsafeCastGObject #-}

castToNamedNodeMap :: IsGObject obj => obj -> NamedNodeMap
castToNamedNodeMap = castTo gTypeNamedNodeMap "NamedNodeMap"

foreign import javascript unsafe "window[\"NamedNodeMap\"]" gTypeNamedNodeMap :: GType
#else
type IsNamedNodeMap o = NamedNodeMapClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Navigator".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Navigator Mozilla Navigator documentation>
newtype Navigator = Navigator { unNavigator :: JSRef }

instance Eq (Navigator) where
  (Navigator a) == (Navigator b) = js_eq a b

instance PToJSRef Navigator where
  pToJSRef = unNavigator
  {-# INLINE pToJSRef #-}

instance PFromJSRef Navigator where
  pFromJSRef = Navigator
  {-# INLINE pFromJSRef #-}

instance ToJSRef Navigator where
  toJSRef = return . unNavigator
  {-# INLINE toJSRef #-}

instance FromJSRef Navigator where
  fromJSRef = return . fmap Navigator . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Navigator where
  toGObject = GObject . unNavigator
  {-# INLINE toGObject #-}
  unsafeCastGObject = Navigator . unGObject
  {-# INLINE unsafeCastGObject #-}

castToNavigator :: IsGObject obj => obj -> Navigator
castToNavigator = castTo gTypeNavigator "Navigator"

foreign import javascript unsafe "window[\"Navigator\"]" gTypeNavigator :: GType
#else
type IsNavigator o = NavigatorClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.NavigatorUserMediaError".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.DOMError"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/NavigatorUserMediaError Mozilla NavigatorUserMediaError documentation>
newtype NavigatorUserMediaError = NavigatorUserMediaError { unNavigatorUserMediaError :: JSRef }

instance Eq (NavigatorUserMediaError) where
  (NavigatorUserMediaError a) == (NavigatorUserMediaError b) = js_eq a b

instance PToJSRef NavigatorUserMediaError where
  pToJSRef = unNavigatorUserMediaError
  {-# INLINE pToJSRef #-}

instance PFromJSRef NavigatorUserMediaError where
  pFromJSRef = NavigatorUserMediaError
  {-# INLINE pFromJSRef #-}

instance ToJSRef NavigatorUserMediaError where
  toJSRef = return . unNavigatorUserMediaError
  {-# INLINE toJSRef #-}

instance FromJSRef NavigatorUserMediaError where
  fromJSRef = return . fmap NavigatorUserMediaError . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsDOMError NavigatorUserMediaError
instance IsGObject NavigatorUserMediaError where
  toGObject = GObject . unNavigatorUserMediaError
  {-# INLINE toGObject #-}
  unsafeCastGObject = NavigatorUserMediaError . unGObject
  {-# INLINE unsafeCastGObject #-}

castToNavigatorUserMediaError :: IsGObject obj => obj -> NavigatorUserMediaError
castToNavigatorUserMediaError = castTo gTypeNavigatorUserMediaError "NavigatorUserMediaError"

foreign import javascript unsafe "window[\"NavigatorUserMediaError\"]" gTypeNavigatorUserMediaError :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Node".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Node Mozilla Node documentation>
newtype Node = Node { unNode :: JSRef }

instance Eq (Node) where
  (Node a) == (Node b) = js_eq a b

instance PToJSRef Node where
  pToJSRef = unNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef Node where
  pFromJSRef = Node
  {-# INLINE pFromJSRef #-}

instance ToJSRef Node where
  toJSRef = return . unNode
  {-# INLINE toJSRef #-}

instance FromJSRef Node where
  fromJSRef = return . fmap Node . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsEventTarget o => IsNode o
toNode :: IsNode o => o -> Node
toNode = unsafeCastGObject . toGObject

instance IsNode Node
instance IsEventTarget Node
instance IsGObject Node where
  toGObject = GObject . unNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = Node . unGObject
  {-# INLINE unsafeCastGObject #-}

castToNode :: IsGObject obj => obj -> Node
castToNode = castTo gTypeNode "Node"

foreign import javascript unsafe "window[\"Node\"]" gTypeNode :: GType
#else
type IsNode o = NodeClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.NodeFilter".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/NodeFilter Mozilla NodeFilter documentation>
newtype NodeFilter = NodeFilter { unNodeFilter :: JSRef }

instance Eq (NodeFilter) where
  (NodeFilter a) == (NodeFilter b) = js_eq a b

instance PToJSRef NodeFilter where
  pToJSRef = unNodeFilter
  {-# INLINE pToJSRef #-}

instance PFromJSRef NodeFilter where
  pFromJSRef = NodeFilter
  {-# INLINE pFromJSRef #-}

instance ToJSRef NodeFilter where
  toJSRef = return . unNodeFilter
  {-# INLINE toJSRef #-}

instance FromJSRef NodeFilter where
  fromJSRef = return . fmap NodeFilter . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject NodeFilter where
  toGObject = GObject . unNodeFilter
  {-# INLINE toGObject #-}
  unsafeCastGObject = NodeFilter . unGObject
  {-# INLINE unsafeCastGObject #-}

castToNodeFilter :: IsGObject obj => obj -> NodeFilter
castToNodeFilter = castTo gTypeNodeFilter "NodeFilter"

foreign import javascript unsafe "window[\"NodeFilter\"]" gTypeNodeFilter :: GType
#else
type IsNodeFilter o = NodeFilterClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.NodeIterator".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/NodeIterator Mozilla NodeIterator documentation>
newtype NodeIterator = NodeIterator { unNodeIterator :: JSRef }

instance Eq (NodeIterator) where
  (NodeIterator a) == (NodeIterator b) = js_eq a b

instance PToJSRef NodeIterator where
  pToJSRef = unNodeIterator
  {-# INLINE pToJSRef #-}

instance PFromJSRef NodeIterator where
  pFromJSRef = NodeIterator
  {-# INLINE pFromJSRef #-}

instance ToJSRef NodeIterator where
  toJSRef = return . unNodeIterator
  {-# INLINE toJSRef #-}

instance FromJSRef NodeIterator where
  fromJSRef = return . fmap NodeIterator . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject NodeIterator where
  toGObject = GObject . unNodeIterator
  {-# INLINE toGObject #-}
  unsafeCastGObject = NodeIterator . unGObject
  {-# INLINE unsafeCastGObject #-}

castToNodeIterator :: IsGObject obj => obj -> NodeIterator
castToNodeIterator = castTo gTypeNodeIterator "NodeIterator"

foreign import javascript unsafe "window[\"NodeIterator\"]" gTypeNodeIterator :: GType
#else
type IsNodeIterator o = NodeIteratorClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.NodeList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/NodeList Mozilla NodeList documentation>
newtype NodeList = NodeList { unNodeList :: JSRef }

instance Eq (NodeList) where
  (NodeList a) == (NodeList b) = js_eq a b

instance PToJSRef NodeList where
  pToJSRef = unNodeList
  {-# INLINE pToJSRef #-}

instance PFromJSRef NodeList where
  pFromJSRef = NodeList
  {-# INLINE pFromJSRef #-}

instance ToJSRef NodeList where
  toJSRef = return . unNodeList
  {-# INLINE toJSRef #-}

instance FromJSRef NodeList where
  fromJSRef = return . fmap NodeList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsNodeList o
toNodeList :: IsNodeList o => o -> NodeList
toNodeList = unsafeCastGObject . toGObject

instance IsNodeList NodeList
instance IsGObject NodeList where
  toGObject = GObject . unNodeList
  {-# INLINE toGObject #-}
  unsafeCastGObject = NodeList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToNodeList :: IsGObject obj => obj -> NodeList
castToNodeList = castTo gTypeNodeList "NodeList"

foreign import javascript unsafe "window[\"NodeList\"]" gTypeNodeList :: GType
#else
type IsNodeList o = NodeListClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Notification".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Notification Mozilla Notification documentation>
newtype Notification = Notification { unNotification :: JSRef }

instance Eq (Notification) where
  (Notification a) == (Notification b) = js_eq a b

instance PToJSRef Notification where
  pToJSRef = unNotification
  {-# INLINE pToJSRef #-}

instance PFromJSRef Notification where
  pFromJSRef = Notification
  {-# INLINE pFromJSRef #-}

instance ToJSRef Notification where
  toJSRef = return . unNotification
  {-# INLINE toJSRef #-}

instance FromJSRef Notification where
  fromJSRef = return . fmap Notification . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget Notification
instance IsGObject Notification where
  toGObject = GObject . unNotification
  {-# INLINE toGObject #-}
  unsafeCastGObject = Notification . unGObject
  {-# INLINE unsafeCastGObject #-}

castToNotification :: IsGObject obj => obj -> Notification
castToNotification = castTo gTypeNotification "Notification"

foreign import javascript unsafe "window[\"Notification\"]" gTypeNotification :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.NotificationCenter".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/NotificationCenter Mozilla NotificationCenter documentation>
newtype NotificationCenter = NotificationCenter { unNotificationCenter :: JSRef }

instance Eq (NotificationCenter) where
  (NotificationCenter a) == (NotificationCenter b) = js_eq a b

instance PToJSRef NotificationCenter where
  pToJSRef = unNotificationCenter
  {-# INLINE pToJSRef #-}

instance PFromJSRef NotificationCenter where
  pFromJSRef = NotificationCenter
  {-# INLINE pFromJSRef #-}

instance ToJSRef NotificationCenter where
  toJSRef = return . unNotificationCenter
  {-# INLINE toJSRef #-}

instance FromJSRef NotificationCenter where
  fromJSRef = return . fmap NotificationCenter . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject NotificationCenter where
  toGObject = GObject . unNotificationCenter
  {-# INLINE toGObject #-}
  unsafeCastGObject = NotificationCenter . unGObject
  {-# INLINE unsafeCastGObject #-}

castToNotificationCenter :: IsGObject obj => obj -> NotificationCenter
castToNotificationCenter = castTo gTypeNotificationCenter "NotificationCenter"

foreign import javascript unsafe "window[\"NotificationCenter\"]" gTypeNotificationCenter :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.OESElementIndexUint".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/OESElementIndexUint Mozilla OESElementIndexUint documentation>
newtype OESElementIndexUint = OESElementIndexUint { unOESElementIndexUint :: JSRef }

instance Eq (OESElementIndexUint) where
  (OESElementIndexUint a) == (OESElementIndexUint b) = js_eq a b

instance PToJSRef OESElementIndexUint where
  pToJSRef = unOESElementIndexUint
  {-# INLINE pToJSRef #-}

instance PFromJSRef OESElementIndexUint where
  pFromJSRef = OESElementIndexUint
  {-# INLINE pFromJSRef #-}

instance ToJSRef OESElementIndexUint where
  toJSRef = return . unOESElementIndexUint
  {-# INLINE toJSRef #-}

instance FromJSRef OESElementIndexUint where
  fromJSRef = return . fmap OESElementIndexUint . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject OESElementIndexUint where
  toGObject = GObject . unOESElementIndexUint
  {-# INLINE toGObject #-}
  unsafeCastGObject = OESElementIndexUint . unGObject
  {-# INLINE unsafeCastGObject #-}

castToOESElementIndexUint :: IsGObject obj => obj -> OESElementIndexUint
castToOESElementIndexUint = castTo gTypeOESElementIndexUint "OESElementIndexUint"

foreign import javascript unsafe "window[\"OESElementIndexUint\"]" gTypeOESElementIndexUint :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.OESStandardDerivatives".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/OESStandardDerivatives Mozilla OESStandardDerivatives documentation>
newtype OESStandardDerivatives = OESStandardDerivatives { unOESStandardDerivatives :: JSRef }

instance Eq (OESStandardDerivatives) where
  (OESStandardDerivatives a) == (OESStandardDerivatives b) = js_eq a b

instance PToJSRef OESStandardDerivatives where
  pToJSRef = unOESStandardDerivatives
  {-# INLINE pToJSRef #-}

instance PFromJSRef OESStandardDerivatives where
  pFromJSRef = OESStandardDerivatives
  {-# INLINE pFromJSRef #-}

instance ToJSRef OESStandardDerivatives where
  toJSRef = return . unOESStandardDerivatives
  {-# INLINE toJSRef #-}

instance FromJSRef OESStandardDerivatives where
  fromJSRef = return . fmap OESStandardDerivatives . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject OESStandardDerivatives where
  toGObject = GObject . unOESStandardDerivatives
  {-# INLINE toGObject #-}
  unsafeCastGObject = OESStandardDerivatives . unGObject
  {-# INLINE unsafeCastGObject #-}

castToOESStandardDerivatives :: IsGObject obj => obj -> OESStandardDerivatives
castToOESStandardDerivatives = castTo gTypeOESStandardDerivatives "OESStandardDerivatives"

foreign import javascript unsafe "window[\"OESStandardDerivatives\"]" gTypeOESStandardDerivatives :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.OESTextureFloat".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/OESTextureFloat Mozilla OESTextureFloat documentation>
newtype OESTextureFloat = OESTextureFloat { unOESTextureFloat :: JSRef }

instance Eq (OESTextureFloat) where
  (OESTextureFloat a) == (OESTextureFloat b) = js_eq a b

instance PToJSRef OESTextureFloat where
  pToJSRef = unOESTextureFloat
  {-# INLINE pToJSRef #-}

instance PFromJSRef OESTextureFloat where
  pFromJSRef = OESTextureFloat
  {-# INLINE pFromJSRef #-}

instance ToJSRef OESTextureFloat where
  toJSRef = return . unOESTextureFloat
  {-# INLINE toJSRef #-}

instance FromJSRef OESTextureFloat where
  fromJSRef = return . fmap OESTextureFloat . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject OESTextureFloat where
  toGObject = GObject . unOESTextureFloat
  {-# INLINE toGObject #-}
  unsafeCastGObject = OESTextureFloat . unGObject
  {-# INLINE unsafeCastGObject #-}

castToOESTextureFloat :: IsGObject obj => obj -> OESTextureFloat
castToOESTextureFloat = castTo gTypeOESTextureFloat "OESTextureFloat"

foreign import javascript unsafe "window[\"OESTextureFloat\"]" gTypeOESTextureFloat :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.OESTextureFloatLinear".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/OESTextureFloatLinear Mozilla OESTextureFloatLinear documentation>
newtype OESTextureFloatLinear = OESTextureFloatLinear { unOESTextureFloatLinear :: JSRef }

instance Eq (OESTextureFloatLinear) where
  (OESTextureFloatLinear a) == (OESTextureFloatLinear b) = js_eq a b

instance PToJSRef OESTextureFloatLinear where
  pToJSRef = unOESTextureFloatLinear
  {-# INLINE pToJSRef #-}

instance PFromJSRef OESTextureFloatLinear where
  pFromJSRef = OESTextureFloatLinear
  {-# INLINE pFromJSRef #-}

instance ToJSRef OESTextureFloatLinear where
  toJSRef = return . unOESTextureFloatLinear
  {-# INLINE toJSRef #-}

instance FromJSRef OESTextureFloatLinear where
  fromJSRef = return . fmap OESTextureFloatLinear . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject OESTextureFloatLinear where
  toGObject = GObject . unOESTextureFloatLinear
  {-# INLINE toGObject #-}
  unsafeCastGObject = OESTextureFloatLinear . unGObject
  {-# INLINE unsafeCastGObject #-}

castToOESTextureFloatLinear :: IsGObject obj => obj -> OESTextureFloatLinear
castToOESTextureFloatLinear = castTo gTypeOESTextureFloatLinear "OESTextureFloatLinear"

foreign import javascript unsafe "window[\"OESTextureFloatLinear\"]" gTypeOESTextureFloatLinear :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.OESTextureHalfFloat".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/OESTextureHalfFloat Mozilla OESTextureHalfFloat documentation>
newtype OESTextureHalfFloat = OESTextureHalfFloat { unOESTextureHalfFloat :: JSRef }

instance Eq (OESTextureHalfFloat) where
  (OESTextureHalfFloat a) == (OESTextureHalfFloat b) = js_eq a b

instance PToJSRef OESTextureHalfFloat where
  pToJSRef = unOESTextureHalfFloat
  {-# INLINE pToJSRef #-}

instance PFromJSRef OESTextureHalfFloat where
  pFromJSRef = OESTextureHalfFloat
  {-# INLINE pFromJSRef #-}

instance ToJSRef OESTextureHalfFloat where
  toJSRef = return . unOESTextureHalfFloat
  {-# INLINE toJSRef #-}

instance FromJSRef OESTextureHalfFloat where
  fromJSRef = return . fmap OESTextureHalfFloat . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject OESTextureHalfFloat where
  toGObject = GObject . unOESTextureHalfFloat
  {-# INLINE toGObject #-}
  unsafeCastGObject = OESTextureHalfFloat . unGObject
  {-# INLINE unsafeCastGObject #-}

castToOESTextureHalfFloat :: IsGObject obj => obj -> OESTextureHalfFloat
castToOESTextureHalfFloat = castTo gTypeOESTextureHalfFloat "OESTextureHalfFloat"

foreign import javascript unsafe "window[\"OESTextureHalfFloat\"]" gTypeOESTextureHalfFloat :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.OESTextureHalfFloatLinear".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/OESTextureHalfFloatLinear Mozilla OESTextureHalfFloatLinear documentation>
newtype OESTextureHalfFloatLinear = OESTextureHalfFloatLinear { unOESTextureHalfFloatLinear :: JSRef }

instance Eq (OESTextureHalfFloatLinear) where
  (OESTextureHalfFloatLinear a) == (OESTextureHalfFloatLinear b) = js_eq a b

instance PToJSRef OESTextureHalfFloatLinear where
  pToJSRef = unOESTextureHalfFloatLinear
  {-# INLINE pToJSRef #-}

instance PFromJSRef OESTextureHalfFloatLinear where
  pFromJSRef = OESTextureHalfFloatLinear
  {-# INLINE pFromJSRef #-}

instance ToJSRef OESTextureHalfFloatLinear where
  toJSRef = return . unOESTextureHalfFloatLinear
  {-# INLINE toJSRef #-}

instance FromJSRef OESTextureHalfFloatLinear where
  fromJSRef = return . fmap OESTextureHalfFloatLinear . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject OESTextureHalfFloatLinear where
  toGObject = GObject . unOESTextureHalfFloatLinear
  {-# INLINE toGObject #-}
  unsafeCastGObject = OESTextureHalfFloatLinear . unGObject
  {-# INLINE unsafeCastGObject #-}

castToOESTextureHalfFloatLinear :: IsGObject obj => obj -> OESTextureHalfFloatLinear
castToOESTextureHalfFloatLinear = castTo gTypeOESTextureHalfFloatLinear "OESTextureHalfFloatLinear"

foreign import javascript unsafe "window[\"OESTextureHalfFloatLinear\"]" gTypeOESTextureHalfFloatLinear :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.OESVertexArrayObject".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/OESVertexArrayObject Mozilla OESVertexArrayObject documentation>
newtype OESVertexArrayObject = OESVertexArrayObject { unOESVertexArrayObject :: JSRef }

instance Eq (OESVertexArrayObject) where
  (OESVertexArrayObject a) == (OESVertexArrayObject b) = js_eq a b

instance PToJSRef OESVertexArrayObject where
  pToJSRef = unOESVertexArrayObject
  {-# INLINE pToJSRef #-}

instance PFromJSRef OESVertexArrayObject where
  pFromJSRef = OESVertexArrayObject
  {-# INLINE pFromJSRef #-}

instance ToJSRef OESVertexArrayObject where
  toJSRef = return . unOESVertexArrayObject
  {-# INLINE toJSRef #-}

instance FromJSRef OESVertexArrayObject where
  fromJSRef = return . fmap OESVertexArrayObject . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject OESVertexArrayObject where
  toGObject = GObject . unOESVertexArrayObject
  {-# INLINE toGObject #-}
  unsafeCastGObject = OESVertexArrayObject . unGObject
  {-# INLINE unsafeCastGObject #-}

castToOESVertexArrayObject :: IsGObject obj => obj -> OESVertexArrayObject
castToOESVertexArrayObject = castTo gTypeOESVertexArrayObject "OESVertexArrayObject"

foreign import javascript unsafe "window[\"OESVertexArrayObject\"]" gTypeOESVertexArrayObject :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.OfflineAudioCompletionEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/OfflineAudioCompletionEvent Mozilla OfflineAudioCompletionEvent documentation>
newtype OfflineAudioCompletionEvent = OfflineAudioCompletionEvent { unOfflineAudioCompletionEvent :: JSRef }

instance Eq (OfflineAudioCompletionEvent) where
  (OfflineAudioCompletionEvent a) == (OfflineAudioCompletionEvent b) = js_eq a b

instance PToJSRef OfflineAudioCompletionEvent where
  pToJSRef = unOfflineAudioCompletionEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef OfflineAudioCompletionEvent where
  pFromJSRef = OfflineAudioCompletionEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef OfflineAudioCompletionEvent where
  toJSRef = return . unOfflineAudioCompletionEvent
  {-# INLINE toJSRef #-}

instance FromJSRef OfflineAudioCompletionEvent where
  fromJSRef = return . fmap OfflineAudioCompletionEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent OfflineAudioCompletionEvent
instance IsGObject OfflineAudioCompletionEvent where
  toGObject = GObject . unOfflineAudioCompletionEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = OfflineAudioCompletionEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToOfflineAudioCompletionEvent :: IsGObject obj => obj -> OfflineAudioCompletionEvent
castToOfflineAudioCompletionEvent = castTo gTypeOfflineAudioCompletionEvent "OfflineAudioCompletionEvent"

foreign import javascript unsafe "window[\"OfflineAudioCompletionEvent\"]" gTypeOfflineAudioCompletionEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.OfflineAudioContext".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioContext"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/OfflineAudioContext Mozilla OfflineAudioContext documentation>
newtype OfflineAudioContext = OfflineAudioContext { unOfflineAudioContext :: JSRef }

instance Eq (OfflineAudioContext) where
  (OfflineAudioContext a) == (OfflineAudioContext b) = js_eq a b

instance PToJSRef OfflineAudioContext where
  pToJSRef = unOfflineAudioContext
  {-# INLINE pToJSRef #-}

instance PFromJSRef OfflineAudioContext where
  pFromJSRef = OfflineAudioContext
  {-# INLINE pFromJSRef #-}

instance ToJSRef OfflineAudioContext where
  toJSRef = return . unOfflineAudioContext
  {-# INLINE toJSRef #-}

instance FromJSRef OfflineAudioContext where
  fromJSRef = return . fmap OfflineAudioContext . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioContext OfflineAudioContext
instance IsEventTarget OfflineAudioContext
instance IsGObject OfflineAudioContext where
  toGObject = GObject . unOfflineAudioContext
  {-# INLINE toGObject #-}
  unsafeCastGObject = OfflineAudioContext . unGObject
  {-# INLINE unsafeCastGObject #-}

castToOfflineAudioContext :: IsGObject obj => obj -> OfflineAudioContext
castToOfflineAudioContext = castTo gTypeOfflineAudioContext "OfflineAudioContext"

foreign import javascript unsafe "window[\"OfflineAudioContext\"]" gTypeOfflineAudioContext :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.OscillatorNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/OscillatorNode Mozilla OscillatorNode documentation>
newtype OscillatorNode = OscillatorNode { unOscillatorNode :: JSRef }

instance Eq (OscillatorNode) where
  (OscillatorNode a) == (OscillatorNode b) = js_eq a b

instance PToJSRef OscillatorNode where
  pToJSRef = unOscillatorNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef OscillatorNode where
  pFromJSRef = OscillatorNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef OscillatorNode where
  toJSRef = return . unOscillatorNode
  {-# INLINE toJSRef #-}

instance FromJSRef OscillatorNode where
  fromJSRef = return . fmap OscillatorNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode OscillatorNode
instance IsEventTarget OscillatorNode
instance IsGObject OscillatorNode where
  toGObject = GObject . unOscillatorNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = OscillatorNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToOscillatorNode :: IsGObject obj => obj -> OscillatorNode
castToOscillatorNode = castTo gTypeOscillatorNode "OscillatorNode"

foreign import javascript unsafe "window[\"OscillatorNode\"]" gTypeOscillatorNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.OverflowEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/OverflowEvent Mozilla OverflowEvent documentation>
newtype OverflowEvent = OverflowEvent { unOverflowEvent :: JSRef }

instance Eq (OverflowEvent) where
  (OverflowEvent a) == (OverflowEvent b) = js_eq a b

instance PToJSRef OverflowEvent where
  pToJSRef = unOverflowEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef OverflowEvent where
  pFromJSRef = OverflowEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef OverflowEvent where
  toJSRef = return . unOverflowEvent
  {-# INLINE toJSRef #-}

instance FromJSRef OverflowEvent where
  fromJSRef = return . fmap OverflowEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent OverflowEvent
instance IsGObject OverflowEvent where
  toGObject = GObject . unOverflowEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = OverflowEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToOverflowEvent :: IsGObject obj => obj -> OverflowEvent
castToOverflowEvent = castTo gTypeOverflowEvent "OverflowEvent"

foreign import javascript unsafe "window[\"OverflowEvent\"]" gTypeOverflowEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.PageTransitionEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/PageTransitionEvent Mozilla PageTransitionEvent documentation>
newtype PageTransitionEvent = PageTransitionEvent { unPageTransitionEvent :: JSRef }

instance Eq (PageTransitionEvent) where
  (PageTransitionEvent a) == (PageTransitionEvent b) = js_eq a b

instance PToJSRef PageTransitionEvent where
  pToJSRef = unPageTransitionEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef PageTransitionEvent where
  pFromJSRef = PageTransitionEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef PageTransitionEvent where
  toJSRef = return . unPageTransitionEvent
  {-# INLINE toJSRef #-}

instance FromJSRef PageTransitionEvent where
  fromJSRef = return . fmap PageTransitionEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent PageTransitionEvent
instance IsGObject PageTransitionEvent where
  toGObject = GObject . unPageTransitionEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = PageTransitionEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToPageTransitionEvent :: IsGObject obj => obj -> PageTransitionEvent
castToPageTransitionEvent = castTo gTypePageTransitionEvent "PageTransitionEvent"

foreign import javascript unsafe "window[\"PageTransitionEvent\"]" gTypePageTransitionEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.PannerNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/webkitAudioPannerNode Mozilla webkitAudioPannerNode documentation>
newtype PannerNode = PannerNode { unPannerNode :: JSRef }

instance Eq (PannerNode) where
  (PannerNode a) == (PannerNode b) = js_eq a b

instance PToJSRef PannerNode where
  pToJSRef = unPannerNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef PannerNode where
  pFromJSRef = PannerNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef PannerNode where
  toJSRef = return . unPannerNode
  {-# INLINE toJSRef #-}

instance FromJSRef PannerNode where
  fromJSRef = return . fmap PannerNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode PannerNode
instance IsEventTarget PannerNode
instance IsGObject PannerNode where
  toGObject = GObject . unPannerNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = PannerNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToPannerNode :: IsGObject obj => obj -> PannerNode
castToPannerNode = castTo gTypePannerNode "PannerNode"

foreign import javascript unsafe "window[\"webkitAudioPannerNode\"]" gTypePannerNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Path2D".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Path2D Mozilla Path2D documentation>
newtype Path2D = Path2D { unPath2D :: JSRef }

instance Eq (Path2D) where
  (Path2D a) == (Path2D b) = js_eq a b

instance PToJSRef Path2D where
  pToJSRef = unPath2D
  {-# INLINE pToJSRef #-}

instance PFromJSRef Path2D where
  pFromJSRef = Path2D
  {-# INLINE pFromJSRef #-}

instance ToJSRef Path2D where
  toJSRef = return . unPath2D
  {-# INLINE toJSRef #-}

instance FromJSRef Path2D where
  fromJSRef = return . fmap Path2D . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Path2D where
  toGObject = GObject . unPath2D
  {-# INLINE toGObject #-}
  unsafeCastGObject = Path2D . unGObject
  {-# INLINE unsafeCastGObject #-}

castToPath2D :: IsGObject obj => obj -> Path2D
castToPath2D = castTo gTypePath2D "Path2D"

foreign import javascript unsafe "window[\"Path2D\"]" gTypePath2D :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Performance".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Performance Mozilla Performance documentation>
newtype Performance = Performance { unPerformance :: JSRef }

instance Eq (Performance) where
  (Performance a) == (Performance b) = js_eq a b

instance PToJSRef Performance where
  pToJSRef = unPerformance
  {-# INLINE pToJSRef #-}

instance PFromJSRef Performance where
  pFromJSRef = Performance
  {-# INLINE pFromJSRef #-}

instance ToJSRef Performance where
  toJSRef = return . unPerformance
  {-# INLINE toJSRef #-}

instance FromJSRef Performance where
  fromJSRef = return . fmap Performance . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget Performance
instance IsGObject Performance where
  toGObject = GObject . unPerformance
  {-# INLINE toGObject #-}
  unsafeCastGObject = Performance . unGObject
  {-# INLINE unsafeCastGObject #-}

castToPerformance :: IsGObject obj => obj -> Performance
castToPerformance = castTo gTypePerformance "Performance"

foreign import javascript unsafe "window[\"Performance\"]" gTypePerformance :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsPerformance o = PerformanceClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.PerformanceEntry".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/PerformanceEntry Mozilla PerformanceEntry documentation>
newtype PerformanceEntry = PerformanceEntry { unPerformanceEntry :: JSRef }

instance Eq (PerformanceEntry) where
  (PerformanceEntry a) == (PerformanceEntry b) = js_eq a b

instance PToJSRef PerformanceEntry where
  pToJSRef = unPerformanceEntry
  {-# INLINE pToJSRef #-}

instance PFromJSRef PerformanceEntry where
  pFromJSRef = PerformanceEntry
  {-# INLINE pFromJSRef #-}

instance ToJSRef PerformanceEntry where
  toJSRef = return . unPerformanceEntry
  {-# INLINE toJSRef #-}

instance FromJSRef PerformanceEntry where
  fromJSRef = return . fmap PerformanceEntry . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsPerformanceEntry o
toPerformanceEntry :: IsPerformanceEntry o => o -> PerformanceEntry
toPerformanceEntry = unsafeCastGObject . toGObject

instance IsPerformanceEntry PerformanceEntry
instance IsGObject PerformanceEntry where
  toGObject = GObject . unPerformanceEntry
  {-# INLINE toGObject #-}
  unsafeCastGObject = PerformanceEntry . unGObject
  {-# INLINE unsafeCastGObject #-}

castToPerformanceEntry :: IsGObject obj => obj -> PerformanceEntry
castToPerformanceEntry = castTo gTypePerformanceEntry "PerformanceEntry"

foreign import javascript unsafe "window[\"PerformanceEntry\"]" gTypePerformanceEntry :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.PerformanceEntryList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/PerformanceEntryList Mozilla PerformanceEntryList documentation>
newtype PerformanceEntryList = PerformanceEntryList { unPerformanceEntryList :: JSRef }

instance Eq (PerformanceEntryList) where
  (PerformanceEntryList a) == (PerformanceEntryList b) = js_eq a b

instance PToJSRef PerformanceEntryList where
  pToJSRef = unPerformanceEntryList
  {-# INLINE pToJSRef #-}

instance PFromJSRef PerformanceEntryList where
  pFromJSRef = PerformanceEntryList
  {-# INLINE pFromJSRef #-}

instance ToJSRef PerformanceEntryList where
  toJSRef = return . unPerformanceEntryList
  {-# INLINE toJSRef #-}

instance FromJSRef PerformanceEntryList where
  fromJSRef = return . fmap PerformanceEntryList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject PerformanceEntryList where
  toGObject = GObject . unPerformanceEntryList
  {-# INLINE toGObject #-}
  unsafeCastGObject = PerformanceEntryList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToPerformanceEntryList :: IsGObject obj => obj -> PerformanceEntryList
castToPerformanceEntryList = castTo gTypePerformanceEntryList "PerformanceEntryList"

foreign import javascript unsafe "window[\"PerformanceEntryList\"]" gTypePerformanceEntryList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.PerformanceMark".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.PerformanceEntry"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/PerformanceMark Mozilla PerformanceMark documentation>
newtype PerformanceMark = PerformanceMark { unPerformanceMark :: JSRef }

instance Eq (PerformanceMark) where
  (PerformanceMark a) == (PerformanceMark b) = js_eq a b

instance PToJSRef PerformanceMark where
  pToJSRef = unPerformanceMark
  {-# INLINE pToJSRef #-}

instance PFromJSRef PerformanceMark where
  pFromJSRef = PerformanceMark
  {-# INLINE pFromJSRef #-}

instance ToJSRef PerformanceMark where
  toJSRef = return . unPerformanceMark
  {-# INLINE toJSRef #-}

instance FromJSRef PerformanceMark where
  fromJSRef = return . fmap PerformanceMark . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsPerformanceEntry PerformanceMark
instance IsGObject PerformanceMark where
  toGObject = GObject . unPerformanceMark
  {-# INLINE toGObject #-}
  unsafeCastGObject = PerformanceMark . unGObject
  {-# INLINE unsafeCastGObject #-}

castToPerformanceMark :: IsGObject obj => obj -> PerformanceMark
castToPerformanceMark = castTo gTypePerformanceMark "PerformanceMark"

foreign import javascript unsafe "window[\"PerformanceMark\"]" gTypePerformanceMark :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.PerformanceMeasure".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.PerformanceEntry"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/PerformanceMeasure Mozilla PerformanceMeasure documentation>
newtype PerformanceMeasure = PerformanceMeasure { unPerformanceMeasure :: JSRef }

instance Eq (PerformanceMeasure) where
  (PerformanceMeasure a) == (PerformanceMeasure b) = js_eq a b

instance PToJSRef PerformanceMeasure where
  pToJSRef = unPerformanceMeasure
  {-# INLINE pToJSRef #-}

instance PFromJSRef PerformanceMeasure where
  pFromJSRef = PerformanceMeasure
  {-# INLINE pFromJSRef #-}

instance ToJSRef PerformanceMeasure where
  toJSRef = return . unPerformanceMeasure
  {-# INLINE toJSRef #-}

instance FromJSRef PerformanceMeasure where
  fromJSRef = return . fmap PerformanceMeasure . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsPerformanceEntry PerformanceMeasure
instance IsGObject PerformanceMeasure where
  toGObject = GObject . unPerformanceMeasure
  {-# INLINE toGObject #-}
  unsafeCastGObject = PerformanceMeasure . unGObject
  {-# INLINE unsafeCastGObject #-}

castToPerformanceMeasure :: IsGObject obj => obj -> PerformanceMeasure
castToPerformanceMeasure = castTo gTypePerformanceMeasure "PerformanceMeasure"

foreign import javascript unsafe "window[\"PerformanceMeasure\"]" gTypePerformanceMeasure :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.PerformanceNavigation".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/PerformanceNavigation Mozilla PerformanceNavigation documentation>
newtype PerformanceNavigation = PerformanceNavigation { unPerformanceNavigation :: JSRef }

instance Eq (PerformanceNavigation) where
  (PerformanceNavigation a) == (PerformanceNavigation b) = js_eq a b

instance PToJSRef PerformanceNavigation where
  pToJSRef = unPerformanceNavigation
  {-# INLINE pToJSRef #-}

instance PFromJSRef PerformanceNavigation where
  pFromJSRef = PerformanceNavigation
  {-# INLINE pFromJSRef #-}

instance ToJSRef PerformanceNavigation where
  toJSRef = return . unPerformanceNavigation
  {-# INLINE toJSRef #-}

instance FromJSRef PerformanceNavigation where
  fromJSRef = return . fmap PerformanceNavigation . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject PerformanceNavigation where
  toGObject = GObject . unPerformanceNavigation
  {-# INLINE toGObject #-}
  unsafeCastGObject = PerformanceNavigation . unGObject
  {-# INLINE unsafeCastGObject #-}

castToPerformanceNavigation :: IsGObject obj => obj -> PerformanceNavigation
castToPerformanceNavigation = castTo gTypePerformanceNavigation "PerformanceNavigation"

foreign import javascript unsafe "window[\"PerformanceNavigation\"]" gTypePerformanceNavigation :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsPerformanceNavigation o = PerformanceNavigationClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.PerformanceResourceTiming".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.PerformanceEntry"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/PerformanceResourceTiming Mozilla PerformanceResourceTiming documentation>
newtype PerformanceResourceTiming = PerformanceResourceTiming { unPerformanceResourceTiming :: JSRef }

instance Eq (PerformanceResourceTiming) where
  (PerformanceResourceTiming a) == (PerformanceResourceTiming b) = js_eq a b

instance PToJSRef PerformanceResourceTiming where
  pToJSRef = unPerformanceResourceTiming
  {-# INLINE pToJSRef #-}

instance PFromJSRef PerformanceResourceTiming where
  pFromJSRef = PerformanceResourceTiming
  {-# INLINE pFromJSRef #-}

instance ToJSRef PerformanceResourceTiming where
  toJSRef = return . unPerformanceResourceTiming
  {-# INLINE toJSRef #-}

instance FromJSRef PerformanceResourceTiming where
  fromJSRef = return . fmap PerformanceResourceTiming . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsPerformanceEntry PerformanceResourceTiming
instance IsGObject PerformanceResourceTiming where
  toGObject = GObject . unPerformanceResourceTiming
  {-# INLINE toGObject #-}
  unsafeCastGObject = PerformanceResourceTiming . unGObject
  {-# INLINE unsafeCastGObject #-}

castToPerformanceResourceTiming :: IsGObject obj => obj -> PerformanceResourceTiming
castToPerformanceResourceTiming = castTo gTypePerformanceResourceTiming "PerformanceResourceTiming"

foreign import javascript unsafe "window[\"PerformanceResourceTiming\"]" gTypePerformanceResourceTiming :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.PerformanceTiming".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/PerformanceTiming Mozilla PerformanceTiming documentation>
newtype PerformanceTiming = PerformanceTiming { unPerformanceTiming :: JSRef }

instance Eq (PerformanceTiming) where
  (PerformanceTiming a) == (PerformanceTiming b) = js_eq a b

instance PToJSRef PerformanceTiming where
  pToJSRef = unPerformanceTiming
  {-# INLINE pToJSRef #-}

instance PFromJSRef PerformanceTiming where
  pFromJSRef = PerformanceTiming
  {-# INLINE pFromJSRef #-}

instance ToJSRef PerformanceTiming where
  toJSRef = return . unPerformanceTiming
  {-# INLINE toJSRef #-}

instance FromJSRef PerformanceTiming where
  fromJSRef = return . fmap PerformanceTiming . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject PerformanceTiming where
  toGObject = GObject . unPerformanceTiming
  {-# INLINE toGObject #-}
  unsafeCastGObject = PerformanceTiming . unGObject
  {-# INLINE unsafeCastGObject #-}

castToPerformanceTiming :: IsGObject obj => obj -> PerformanceTiming
castToPerformanceTiming = castTo gTypePerformanceTiming "PerformanceTiming"

foreign import javascript unsafe "window[\"PerformanceTiming\"]" gTypePerformanceTiming :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsPerformanceTiming o = PerformanceTimingClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.PeriodicWave".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/PeriodicWave Mozilla PeriodicWave documentation>
newtype PeriodicWave = PeriodicWave { unPeriodicWave :: JSRef }

instance Eq (PeriodicWave) where
  (PeriodicWave a) == (PeriodicWave b) = js_eq a b

instance PToJSRef PeriodicWave where
  pToJSRef = unPeriodicWave
  {-# INLINE pToJSRef #-}

instance PFromJSRef PeriodicWave where
  pFromJSRef = PeriodicWave
  {-# INLINE pFromJSRef #-}

instance ToJSRef PeriodicWave where
  toJSRef = return . unPeriodicWave
  {-# INLINE toJSRef #-}

instance FromJSRef PeriodicWave where
  fromJSRef = return . fmap PeriodicWave . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject PeriodicWave where
  toGObject = GObject . unPeriodicWave
  {-# INLINE toGObject #-}
  unsafeCastGObject = PeriodicWave . unGObject
  {-# INLINE unsafeCastGObject #-}

castToPeriodicWave :: IsGObject obj => obj -> PeriodicWave
castToPeriodicWave = castTo gTypePeriodicWave "PeriodicWave"

foreign import javascript unsafe "window[\"PeriodicWave\"]" gTypePeriodicWave :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Plugin".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Plugin Mozilla Plugin documentation>
newtype Plugin = Plugin { unPlugin :: JSRef }

instance Eq (Plugin) where
  (Plugin a) == (Plugin b) = js_eq a b

instance PToJSRef Plugin where
  pToJSRef = unPlugin
  {-# INLINE pToJSRef #-}

instance PFromJSRef Plugin where
  pFromJSRef = Plugin
  {-# INLINE pFromJSRef #-}

instance ToJSRef Plugin where
  toJSRef = return . unPlugin
  {-# INLINE toJSRef #-}

instance FromJSRef Plugin where
  fromJSRef = return . fmap Plugin . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Plugin where
  toGObject = GObject . unPlugin
  {-# INLINE toGObject #-}
  unsafeCastGObject = Plugin . unGObject
  {-# INLINE unsafeCastGObject #-}

castToPlugin :: IsGObject obj => obj -> Plugin
castToPlugin = castTo gTypePlugin "Plugin"

foreign import javascript unsafe "window[\"Plugin\"]" gTypePlugin :: GType
#else
type IsPlugin o = PluginClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.PluginArray".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/PluginArray Mozilla PluginArray documentation>
newtype PluginArray = PluginArray { unPluginArray :: JSRef }

instance Eq (PluginArray) where
  (PluginArray a) == (PluginArray b) = js_eq a b

instance PToJSRef PluginArray where
  pToJSRef = unPluginArray
  {-# INLINE pToJSRef #-}

instance PFromJSRef PluginArray where
  pFromJSRef = PluginArray
  {-# INLINE pFromJSRef #-}

instance ToJSRef PluginArray where
  toJSRef = return . unPluginArray
  {-# INLINE toJSRef #-}

instance FromJSRef PluginArray where
  fromJSRef = return . fmap PluginArray . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject PluginArray where
  toGObject = GObject . unPluginArray
  {-# INLINE toGObject #-}
  unsafeCastGObject = PluginArray . unGObject
  {-# INLINE unsafeCastGObject #-}

castToPluginArray :: IsGObject obj => obj -> PluginArray
castToPluginArray = castTo gTypePluginArray "PluginArray"

foreign import javascript unsafe "window[\"PluginArray\"]" gTypePluginArray :: GType
#else
type IsPluginArray o = PluginArrayClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.PopStateEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/PopStateEvent Mozilla PopStateEvent documentation>
newtype PopStateEvent = PopStateEvent { unPopStateEvent :: JSRef }

instance Eq (PopStateEvent) where
  (PopStateEvent a) == (PopStateEvent b) = js_eq a b

instance PToJSRef PopStateEvent where
  pToJSRef = unPopStateEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef PopStateEvent where
  pFromJSRef = PopStateEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef PopStateEvent where
  toJSRef = return . unPopStateEvent
  {-# INLINE toJSRef #-}

instance FromJSRef PopStateEvent where
  fromJSRef = return . fmap PopStateEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent PopStateEvent
instance IsGObject PopStateEvent where
  toGObject = GObject . unPopStateEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = PopStateEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToPopStateEvent :: IsGObject obj => obj -> PopStateEvent
castToPopStateEvent = castTo gTypePopStateEvent "PopStateEvent"

foreign import javascript unsafe "window[\"PopStateEvent\"]" gTypePopStateEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.PositionError".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/PositionError Mozilla PositionError documentation>
newtype PositionError = PositionError { unPositionError :: JSRef }

instance Eq (PositionError) where
  (PositionError a) == (PositionError b) = js_eq a b

instance PToJSRef PositionError where
  pToJSRef = unPositionError
  {-# INLINE pToJSRef #-}

instance PFromJSRef PositionError where
  pFromJSRef = PositionError
  {-# INLINE pFromJSRef #-}

instance ToJSRef PositionError where
  toJSRef = return . unPositionError
  {-# INLINE toJSRef #-}

instance FromJSRef PositionError where
  fromJSRef = return . fmap PositionError . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject PositionError where
  toGObject = GObject . unPositionError
  {-# INLINE toGObject #-}
  unsafeCastGObject = PositionError . unGObject
  {-# INLINE unsafeCastGObject #-}

castToPositionError :: IsGObject obj => obj -> PositionError
castToPositionError = castTo gTypePositionError "PositionError"

foreign import javascript unsafe "window[\"PositionError\"]" gTypePositionError :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ProcessingInstruction".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CharacterData"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ProcessingInstruction Mozilla ProcessingInstruction documentation>
newtype ProcessingInstruction = ProcessingInstruction { unProcessingInstruction :: JSRef }

instance Eq (ProcessingInstruction) where
  (ProcessingInstruction a) == (ProcessingInstruction b) = js_eq a b

instance PToJSRef ProcessingInstruction where
  pToJSRef = unProcessingInstruction
  {-# INLINE pToJSRef #-}

instance PFromJSRef ProcessingInstruction where
  pFromJSRef = ProcessingInstruction
  {-# INLINE pFromJSRef #-}

instance ToJSRef ProcessingInstruction where
  toJSRef = return . unProcessingInstruction
  {-# INLINE toJSRef #-}

instance FromJSRef ProcessingInstruction where
  fromJSRef = return . fmap ProcessingInstruction . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCharacterData ProcessingInstruction
instance IsNode ProcessingInstruction
instance IsEventTarget ProcessingInstruction
instance IsGObject ProcessingInstruction where
  toGObject = GObject . unProcessingInstruction
  {-# INLINE toGObject #-}
  unsafeCastGObject = ProcessingInstruction . unGObject
  {-# INLINE unsafeCastGObject #-}

castToProcessingInstruction :: IsGObject obj => obj -> ProcessingInstruction
castToProcessingInstruction = castTo gTypeProcessingInstruction "ProcessingInstruction"

foreign import javascript unsafe "window[\"ProcessingInstruction\"]" gTypeProcessingInstruction :: GType
#else
type IsProcessingInstruction o = ProcessingInstructionClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ProgressEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ProgressEvent Mozilla ProgressEvent documentation>
newtype ProgressEvent = ProgressEvent { unProgressEvent :: JSRef }

instance Eq (ProgressEvent) where
  (ProgressEvent a) == (ProgressEvent b) = js_eq a b

instance PToJSRef ProgressEvent where
  pToJSRef = unProgressEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef ProgressEvent where
  pFromJSRef = ProgressEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef ProgressEvent where
  toJSRef = return . unProgressEvent
  {-# INLINE toJSRef #-}

instance FromJSRef ProgressEvent where
  fromJSRef = return . fmap ProgressEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsEvent o => IsProgressEvent o
toProgressEvent :: IsProgressEvent o => o -> ProgressEvent
toProgressEvent = unsafeCastGObject . toGObject

instance IsProgressEvent ProgressEvent
instance IsEvent ProgressEvent
instance IsGObject ProgressEvent where
  toGObject = GObject . unProgressEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = ProgressEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToProgressEvent :: IsGObject obj => obj -> ProgressEvent
castToProgressEvent = castTo gTypeProgressEvent "ProgressEvent"

foreign import javascript unsafe "window[\"ProgressEvent\"]" gTypeProgressEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.QuickTimePluginReplacement".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/QuickTimePluginReplacement Mozilla QuickTimePluginReplacement documentation>
newtype QuickTimePluginReplacement = QuickTimePluginReplacement { unQuickTimePluginReplacement :: JSRef }

instance Eq (QuickTimePluginReplacement) where
  (QuickTimePluginReplacement a) == (QuickTimePluginReplacement b) = js_eq a b

instance PToJSRef QuickTimePluginReplacement where
  pToJSRef = unQuickTimePluginReplacement
  {-# INLINE pToJSRef #-}

instance PFromJSRef QuickTimePluginReplacement where
  pFromJSRef = QuickTimePluginReplacement
  {-# INLINE pFromJSRef #-}

instance ToJSRef QuickTimePluginReplacement where
  toJSRef = return . unQuickTimePluginReplacement
  {-# INLINE toJSRef #-}

instance FromJSRef QuickTimePluginReplacement where
  fromJSRef = return . fmap QuickTimePluginReplacement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject QuickTimePluginReplacement where
  toGObject = GObject . unQuickTimePluginReplacement
  {-# INLINE toGObject #-}
  unsafeCastGObject = QuickTimePluginReplacement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToQuickTimePluginReplacement :: IsGObject obj => obj -> QuickTimePluginReplacement
castToQuickTimePluginReplacement = castTo gTypeQuickTimePluginReplacement "QuickTimePluginReplacement"

foreign import javascript unsafe "window[\"QuickTimePluginReplacement\"]" gTypeQuickTimePluginReplacement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.RGBColor".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/RGBColor Mozilla RGBColor documentation>
newtype RGBColor = RGBColor { unRGBColor :: JSRef }

instance Eq (RGBColor) where
  (RGBColor a) == (RGBColor b) = js_eq a b

instance PToJSRef RGBColor where
  pToJSRef = unRGBColor
  {-# INLINE pToJSRef #-}

instance PFromJSRef RGBColor where
  pFromJSRef = RGBColor
  {-# INLINE pFromJSRef #-}

instance ToJSRef RGBColor where
  toJSRef = return . unRGBColor
  {-# INLINE toJSRef #-}

instance FromJSRef RGBColor where
  fromJSRef = return . fmap RGBColor . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject RGBColor where
  toGObject = GObject . unRGBColor
  {-# INLINE toGObject #-}
  unsafeCastGObject = RGBColor . unGObject
  {-# INLINE unsafeCastGObject #-}

castToRGBColor :: IsGObject obj => obj -> RGBColor
castToRGBColor = castTo gTypeRGBColor "RGBColor"

foreign import javascript unsafe "window[\"RGBColor\"]" gTypeRGBColor :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.RTCConfiguration".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/RTCConfiguration Mozilla RTCConfiguration documentation>
newtype RTCConfiguration = RTCConfiguration { unRTCConfiguration :: JSRef }

instance Eq (RTCConfiguration) where
  (RTCConfiguration a) == (RTCConfiguration b) = js_eq a b

instance PToJSRef RTCConfiguration where
  pToJSRef = unRTCConfiguration
  {-# INLINE pToJSRef #-}

instance PFromJSRef RTCConfiguration where
  pFromJSRef = RTCConfiguration
  {-# INLINE pFromJSRef #-}

instance ToJSRef RTCConfiguration where
  toJSRef = return . unRTCConfiguration
  {-# INLINE toJSRef #-}

instance FromJSRef RTCConfiguration where
  fromJSRef = return . fmap RTCConfiguration . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject RTCConfiguration where
  toGObject = GObject . unRTCConfiguration
  {-# INLINE toGObject #-}
  unsafeCastGObject = RTCConfiguration . unGObject
  {-# INLINE unsafeCastGObject #-}

castToRTCConfiguration :: IsGObject obj => obj -> RTCConfiguration
castToRTCConfiguration = castTo gTypeRTCConfiguration "RTCConfiguration"

foreign import javascript unsafe "window[\"RTCConfiguration\"]" gTypeRTCConfiguration :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.RTCDTMFSender".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/RTCDTMFSender Mozilla RTCDTMFSender documentation>
newtype RTCDTMFSender = RTCDTMFSender { unRTCDTMFSender :: JSRef }

instance Eq (RTCDTMFSender) where
  (RTCDTMFSender a) == (RTCDTMFSender b) = js_eq a b

instance PToJSRef RTCDTMFSender where
  pToJSRef = unRTCDTMFSender
  {-# INLINE pToJSRef #-}

instance PFromJSRef RTCDTMFSender where
  pFromJSRef = RTCDTMFSender
  {-# INLINE pFromJSRef #-}

instance ToJSRef RTCDTMFSender where
  toJSRef = return . unRTCDTMFSender
  {-# INLINE toJSRef #-}

instance FromJSRef RTCDTMFSender where
  fromJSRef = return . fmap RTCDTMFSender . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget RTCDTMFSender
instance IsGObject RTCDTMFSender where
  toGObject = GObject . unRTCDTMFSender
  {-# INLINE toGObject #-}
  unsafeCastGObject = RTCDTMFSender . unGObject
  {-# INLINE unsafeCastGObject #-}

castToRTCDTMFSender :: IsGObject obj => obj -> RTCDTMFSender
castToRTCDTMFSender = castTo gTypeRTCDTMFSender "RTCDTMFSender"

foreign import javascript unsafe "window[\"RTCDTMFSender\"]" gTypeRTCDTMFSender :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.RTCDTMFToneChangeEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/RTCDTMFToneChangeEvent Mozilla RTCDTMFToneChangeEvent documentation>
newtype RTCDTMFToneChangeEvent = RTCDTMFToneChangeEvent { unRTCDTMFToneChangeEvent :: JSRef }

instance Eq (RTCDTMFToneChangeEvent) where
  (RTCDTMFToneChangeEvent a) == (RTCDTMFToneChangeEvent b) = js_eq a b

instance PToJSRef RTCDTMFToneChangeEvent where
  pToJSRef = unRTCDTMFToneChangeEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef RTCDTMFToneChangeEvent where
  pFromJSRef = RTCDTMFToneChangeEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef RTCDTMFToneChangeEvent where
  toJSRef = return . unRTCDTMFToneChangeEvent
  {-# INLINE toJSRef #-}

instance FromJSRef RTCDTMFToneChangeEvent where
  fromJSRef = return . fmap RTCDTMFToneChangeEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent RTCDTMFToneChangeEvent
instance IsGObject RTCDTMFToneChangeEvent where
  toGObject = GObject . unRTCDTMFToneChangeEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = RTCDTMFToneChangeEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToRTCDTMFToneChangeEvent :: IsGObject obj => obj -> RTCDTMFToneChangeEvent
castToRTCDTMFToneChangeEvent = castTo gTypeRTCDTMFToneChangeEvent "RTCDTMFToneChangeEvent"

foreign import javascript unsafe "window[\"RTCDTMFToneChangeEvent\"]" gTypeRTCDTMFToneChangeEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.RTCDataChannel".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannel Mozilla RTCDataChannel documentation>
newtype RTCDataChannel = RTCDataChannel { unRTCDataChannel :: JSRef }

instance Eq (RTCDataChannel) where
  (RTCDataChannel a) == (RTCDataChannel b) = js_eq a b

instance PToJSRef RTCDataChannel where
  pToJSRef = unRTCDataChannel
  {-# INLINE pToJSRef #-}

instance PFromJSRef RTCDataChannel where
  pFromJSRef = RTCDataChannel
  {-# INLINE pFromJSRef #-}

instance ToJSRef RTCDataChannel where
  toJSRef = return . unRTCDataChannel
  {-# INLINE toJSRef #-}

instance FromJSRef RTCDataChannel where
  fromJSRef = return . fmap RTCDataChannel . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget RTCDataChannel
instance IsGObject RTCDataChannel where
  toGObject = GObject . unRTCDataChannel
  {-# INLINE toGObject #-}
  unsafeCastGObject = RTCDataChannel . unGObject
  {-# INLINE unsafeCastGObject #-}

castToRTCDataChannel :: IsGObject obj => obj -> RTCDataChannel
castToRTCDataChannel = castTo gTypeRTCDataChannel "RTCDataChannel"

foreign import javascript unsafe "window[\"RTCDataChannel\"]" gTypeRTCDataChannel :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.RTCDataChannelEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannelEvent Mozilla RTCDataChannelEvent documentation>
newtype RTCDataChannelEvent = RTCDataChannelEvent { unRTCDataChannelEvent :: JSRef }

instance Eq (RTCDataChannelEvent) where
  (RTCDataChannelEvent a) == (RTCDataChannelEvent b) = js_eq a b

instance PToJSRef RTCDataChannelEvent where
  pToJSRef = unRTCDataChannelEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef RTCDataChannelEvent where
  pFromJSRef = RTCDataChannelEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef RTCDataChannelEvent where
  toJSRef = return . unRTCDataChannelEvent
  {-# INLINE toJSRef #-}

instance FromJSRef RTCDataChannelEvent where
  fromJSRef = return . fmap RTCDataChannelEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent RTCDataChannelEvent
instance IsGObject RTCDataChannelEvent where
  toGObject = GObject . unRTCDataChannelEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = RTCDataChannelEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToRTCDataChannelEvent :: IsGObject obj => obj -> RTCDataChannelEvent
castToRTCDataChannelEvent = castTo gTypeRTCDataChannelEvent "RTCDataChannelEvent"

foreign import javascript unsafe "window[\"RTCDataChannelEvent\"]" gTypeRTCDataChannelEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.RTCIceCandidate".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidate Mozilla RTCIceCandidate documentation>
newtype RTCIceCandidate = RTCIceCandidate { unRTCIceCandidate :: JSRef }

instance Eq (RTCIceCandidate) where
  (RTCIceCandidate a) == (RTCIceCandidate b) = js_eq a b

instance PToJSRef RTCIceCandidate where
  pToJSRef = unRTCIceCandidate
  {-# INLINE pToJSRef #-}

instance PFromJSRef RTCIceCandidate where
  pFromJSRef = RTCIceCandidate
  {-# INLINE pFromJSRef #-}

instance ToJSRef RTCIceCandidate where
  toJSRef = return . unRTCIceCandidate
  {-# INLINE toJSRef #-}

instance FromJSRef RTCIceCandidate where
  fromJSRef = return . fmap RTCIceCandidate . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject RTCIceCandidate where
  toGObject = GObject . unRTCIceCandidate
  {-# INLINE toGObject #-}
  unsafeCastGObject = RTCIceCandidate . unGObject
  {-# INLINE unsafeCastGObject #-}

castToRTCIceCandidate :: IsGObject obj => obj -> RTCIceCandidate
castToRTCIceCandidate = castTo gTypeRTCIceCandidate "RTCIceCandidate"

foreign import javascript unsafe "window[\"RTCIceCandidate\"]" gTypeRTCIceCandidate :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.RTCIceCandidateEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidateEvent Mozilla RTCIceCandidateEvent documentation>
newtype RTCIceCandidateEvent = RTCIceCandidateEvent { unRTCIceCandidateEvent :: JSRef }

instance Eq (RTCIceCandidateEvent) where
  (RTCIceCandidateEvent a) == (RTCIceCandidateEvent b) = js_eq a b

instance PToJSRef RTCIceCandidateEvent where
  pToJSRef = unRTCIceCandidateEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef RTCIceCandidateEvent where
  pFromJSRef = RTCIceCandidateEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef RTCIceCandidateEvent where
  toJSRef = return . unRTCIceCandidateEvent
  {-# INLINE toJSRef #-}

instance FromJSRef RTCIceCandidateEvent where
  fromJSRef = return . fmap RTCIceCandidateEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent RTCIceCandidateEvent
instance IsGObject RTCIceCandidateEvent where
  toGObject = GObject . unRTCIceCandidateEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = RTCIceCandidateEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToRTCIceCandidateEvent :: IsGObject obj => obj -> RTCIceCandidateEvent
castToRTCIceCandidateEvent = castTo gTypeRTCIceCandidateEvent "RTCIceCandidateEvent"

foreign import javascript unsafe "window[\"RTCIceCandidateEvent\"]" gTypeRTCIceCandidateEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.RTCIceServer".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/RTCIceServer Mozilla RTCIceServer documentation>
newtype RTCIceServer = RTCIceServer { unRTCIceServer :: JSRef }

instance Eq (RTCIceServer) where
  (RTCIceServer a) == (RTCIceServer b) = js_eq a b

instance PToJSRef RTCIceServer where
  pToJSRef = unRTCIceServer
  {-# INLINE pToJSRef #-}

instance PFromJSRef RTCIceServer where
  pFromJSRef = RTCIceServer
  {-# INLINE pFromJSRef #-}

instance ToJSRef RTCIceServer where
  toJSRef = return . unRTCIceServer
  {-# INLINE toJSRef #-}

instance FromJSRef RTCIceServer where
  fromJSRef = return . fmap RTCIceServer . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject RTCIceServer where
  toGObject = GObject . unRTCIceServer
  {-# INLINE toGObject #-}
  unsafeCastGObject = RTCIceServer . unGObject
  {-# INLINE unsafeCastGObject #-}

castToRTCIceServer :: IsGObject obj => obj -> RTCIceServer
castToRTCIceServer = castTo gTypeRTCIceServer "RTCIceServer"

foreign import javascript unsafe "window[\"RTCIceServer\"]" gTypeRTCIceServer :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.RTCPeerConnection".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/webkitRTCPeerConnection Mozilla webkitRTCPeerConnection documentation>
newtype RTCPeerConnection = RTCPeerConnection { unRTCPeerConnection :: JSRef }

instance Eq (RTCPeerConnection) where
  (RTCPeerConnection a) == (RTCPeerConnection b) = js_eq a b

instance PToJSRef RTCPeerConnection where
  pToJSRef = unRTCPeerConnection
  {-# INLINE pToJSRef #-}

instance PFromJSRef RTCPeerConnection where
  pFromJSRef = RTCPeerConnection
  {-# INLINE pFromJSRef #-}

instance ToJSRef RTCPeerConnection where
  toJSRef = return . unRTCPeerConnection
  {-# INLINE toJSRef #-}

instance FromJSRef RTCPeerConnection where
  fromJSRef = return . fmap RTCPeerConnection . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget RTCPeerConnection
instance IsGObject RTCPeerConnection where
  toGObject = GObject . unRTCPeerConnection
  {-# INLINE toGObject #-}
  unsafeCastGObject = RTCPeerConnection . unGObject
  {-# INLINE unsafeCastGObject #-}

castToRTCPeerConnection :: IsGObject obj => obj -> RTCPeerConnection
castToRTCPeerConnection = castTo gTypeRTCPeerConnection "RTCPeerConnection"

foreign import javascript unsafe "window[\"webkitRTCPeerConnection\"]" gTypeRTCPeerConnection :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.RTCSessionDescription".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/RTCSessionDescription Mozilla RTCSessionDescription documentation>
newtype RTCSessionDescription = RTCSessionDescription { unRTCSessionDescription :: JSRef }

instance Eq (RTCSessionDescription) where
  (RTCSessionDescription a) == (RTCSessionDescription b) = js_eq a b

instance PToJSRef RTCSessionDescription where
  pToJSRef = unRTCSessionDescription
  {-# INLINE pToJSRef #-}

instance PFromJSRef RTCSessionDescription where
  pFromJSRef = RTCSessionDescription
  {-# INLINE pFromJSRef #-}

instance ToJSRef RTCSessionDescription where
  toJSRef = return . unRTCSessionDescription
  {-# INLINE toJSRef #-}

instance FromJSRef RTCSessionDescription where
  fromJSRef = return . fmap RTCSessionDescription . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject RTCSessionDescription where
  toGObject = GObject . unRTCSessionDescription
  {-# INLINE toGObject #-}
  unsafeCastGObject = RTCSessionDescription . unGObject
  {-# INLINE unsafeCastGObject #-}

castToRTCSessionDescription :: IsGObject obj => obj -> RTCSessionDescription
castToRTCSessionDescription = castTo gTypeRTCSessionDescription "RTCSessionDescription"

foreign import javascript unsafe "window[\"RTCSessionDescription\"]" gTypeRTCSessionDescription :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.RTCStatsReport".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/RTCStatsReport Mozilla RTCStatsReport documentation>
newtype RTCStatsReport = RTCStatsReport { unRTCStatsReport :: JSRef }

instance Eq (RTCStatsReport) where
  (RTCStatsReport a) == (RTCStatsReport b) = js_eq a b

instance PToJSRef RTCStatsReport where
  pToJSRef = unRTCStatsReport
  {-# INLINE pToJSRef #-}

instance PFromJSRef RTCStatsReport where
  pFromJSRef = RTCStatsReport
  {-# INLINE pFromJSRef #-}

instance ToJSRef RTCStatsReport where
  toJSRef = return . unRTCStatsReport
  {-# INLINE toJSRef #-}

instance FromJSRef RTCStatsReport where
  fromJSRef = return . fmap RTCStatsReport . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject RTCStatsReport where
  toGObject = GObject . unRTCStatsReport
  {-# INLINE toGObject #-}
  unsafeCastGObject = RTCStatsReport . unGObject
  {-# INLINE unsafeCastGObject #-}

castToRTCStatsReport :: IsGObject obj => obj -> RTCStatsReport
castToRTCStatsReport = castTo gTypeRTCStatsReport "RTCStatsReport"

foreign import javascript unsafe "window[\"RTCStatsReport\"]" gTypeRTCStatsReport :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.RTCStatsResponse".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/RTCStatsResponse Mozilla RTCStatsResponse documentation>
newtype RTCStatsResponse = RTCStatsResponse { unRTCStatsResponse :: JSRef }

instance Eq (RTCStatsResponse) where
  (RTCStatsResponse a) == (RTCStatsResponse b) = js_eq a b

instance PToJSRef RTCStatsResponse where
  pToJSRef = unRTCStatsResponse
  {-# INLINE pToJSRef #-}

instance PFromJSRef RTCStatsResponse where
  pFromJSRef = RTCStatsResponse
  {-# INLINE pFromJSRef #-}

instance ToJSRef RTCStatsResponse where
  toJSRef = return . unRTCStatsResponse
  {-# INLINE toJSRef #-}

instance FromJSRef RTCStatsResponse where
  fromJSRef = return . fmap RTCStatsResponse . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject RTCStatsResponse where
  toGObject = GObject . unRTCStatsResponse
  {-# INLINE toGObject #-}
  unsafeCastGObject = RTCStatsResponse . unGObject
  {-# INLINE unsafeCastGObject #-}

castToRTCStatsResponse :: IsGObject obj => obj -> RTCStatsResponse
castToRTCStatsResponse = castTo gTypeRTCStatsResponse "RTCStatsResponse"

foreign import javascript unsafe "window[\"RTCStatsResponse\"]" gTypeRTCStatsResponse :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.RadioNodeList".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.NodeList"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/RadioNodeList Mozilla RadioNodeList documentation>
newtype RadioNodeList = RadioNodeList { unRadioNodeList :: JSRef }

instance Eq (RadioNodeList) where
  (RadioNodeList a) == (RadioNodeList b) = js_eq a b

instance PToJSRef RadioNodeList where
  pToJSRef = unRadioNodeList
  {-# INLINE pToJSRef #-}

instance PFromJSRef RadioNodeList where
  pFromJSRef = RadioNodeList
  {-# INLINE pFromJSRef #-}

instance ToJSRef RadioNodeList where
  toJSRef = return . unRadioNodeList
  {-# INLINE toJSRef #-}

instance FromJSRef RadioNodeList where
  fromJSRef = return . fmap RadioNodeList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsNodeList RadioNodeList
instance IsGObject RadioNodeList where
  toGObject = GObject . unRadioNodeList
  {-# INLINE toGObject #-}
  unsafeCastGObject = RadioNodeList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToRadioNodeList :: IsGObject obj => obj -> RadioNodeList
castToRadioNodeList = castTo gTypeRadioNodeList "RadioNodeList"

foreign import javascript unsafe "window[\"RadioNodeList\"]" gTypeRadioNodeList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Range".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Range Mozilla Range documentation>
newtype Range = Range { unRange :: JSRef }

instance Eq (Range) where
  (Range a) == (Range b) = js_eq a b

instance PToJSRef Range where
  pToJSRef = unRange
  {-# INLINE pToJSRef #-}

instance PFromJSRef Range where
  pFromJSRef = Range
  {-# INLINE pFromJSRef #-}

instance ToJSRef Range where
  toJSRef = return . unRange
  {-# INLINE toJSRef #-}

instance FromJSRef Range where
  fromJSRef = return . fmap Range . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Range where
  toGObject = GObject . unRange
  {-# INLINE toGObject #-}
  unsafeCastGObject = Range . unGObject
  {-# INLINE unsafeCastGObject #-}

castToRange :: IsGObject obj => obj -> Range
castToRange = castTo gTypeRange "Range"

foreign import javascript unsafe "window[\"Range\"]" gTypeRange :: GType
#else
type IsRange o = RangeClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ReadableStream".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ReadableStream Mozilla ReadableStream documentation>
newtype ReadableStream = ReadableStream { unReadableStream :: JSRef }

instance Eq (ReadableStream) where
  (ReadableStream a) == (ReadableStream b) = js_eq a b

instance PToJSRef ReadableStream where
  pToJSRef = unReadableStream
  {-# INLINE pToJSRef #-}

instance PFromJSRef ReadableStream where
  pFromJSRef = ReadableStream
  {-# INLINE pFromJSRef #-}

instance ToJSRef ReadableStream where
  toJSRef = return . unReadableStream
  {-# INLINE toJSRef #-}

instance FromJSRef ReadableStream where
  fromJSRef = return . fmap ReadableStream . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject ReadableStream where
  toGObject = GObject . unReadableStream
  {-# INLINE toGObject #-}
  unsafeCastGObject = ReadableStream . unGObject
  {-# INLINE unsafeCastGObject #-}

castToReadableStream :: IsGObject obj => obj -> ReadableStream
castToReadableStream = castTo gTypeReadableStream "ReadableStream"

foreign import javascript unsafe "window[\"ReadableStream\"]" gTypeReadableStream :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Rect".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Rect Mozilla Rect documentation>
newtype Rect = Rect { unRect :: JSRef }

instance Eq (Rect) where
  (Rect a) == (Rect b) = js_eq a b

instance PToJSRef Rect where
  pToJSRef = unRect
  {-# INLINE pToJSRef #-}

instance PFromJSRef Rect where
  pFromJSRef = Rect
  {-# INLINE pFromJSRef #-}

instance ToJSRef Rect where
  toJSRef = return . unRect
  {-# INLINE toJSRef #-}

instance FromJSRef Rect where
  fromJSRef = return . fmap Rect . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Rect where
  toGObject = GObject . unRect
  {-# INLINE toGObject #-}
  unsafeCastGObject = Rect . unGObject
  {-# INLINE unsafeCastGObject #-}

castToRect :: IsGObject obj => obj -> Rect
castToRect = castTo gTypeRect "Rect"

foreign import javascript unsafe "window[\"Rect\"]" gTypeRect :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SQLError".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SQLError Mozilla SQLError documentation>
newtype SQLError = SQLError { unSQLError :: JSRef }

instance Eq (SQLError) where
  (SQLError a) == (SQLError b) = js_eq a b

instance PToJSRef SQLError where
  pToJSRef = unSQLError
  {-# INLINE pToJSRef #-}

instance PFromJSRef SQLError where
  pFromJSRef = SQLError
  {-# INLINE pFromJSRef #-}

instance ToJSRef SQLError where
  toJSRef = return . unSQLError
  {-# INLINE toJSRef #-}

instance FromJSRef SQLError where
  fromJSRef = return . fmap SQLError . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SQLError where
  toGObject = GObject . unSQLError
  {-# INLINE toGObject #-}
  unsafeCastGObject = SQLError . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSQLError :: IsGObject obj => obj -> SQLError
castToSQLError = castTo gTypeSQLError "SQLError"

foreign import javascript unsafe "window[\"SQLError\"]" gTypeSQLError :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SQLResultSet".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SQLResultSet Mozilla SQLResultSet documentation>
newtype SQLResultSet = SQLResultSet { unSQLResultSet :: JSRef }

instance Eq (SQLResultSet) where
  (SQLResultSet a) == (SQLResultSet b) = js_eq a b

instance PToJSRef SQLResultSet where
  pToJSRef = unSQLResultSet
  {-# INLINE pToJSRef #-}

instance PFromJSRef SQLResultSet where
  pFromJSRef = SQLResultSet
  {-# INLINE pFromJSRef #-}

instance ToJSRef SQLResultSet where
  toJSRef = return . unSQLResultSet
  {-# INLINE toJSRef #-}

instance FromJSRef SQLResultSet where
  fromJSRef = return . fmap SQLResultSet . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SQLResultSet where
  toGObject = GObject . unSQLResultSet
  {-# INLINE toGObject #-}
  unsafeCastGObject = SQLResultSet . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSQLResultSet :: IsGObject obj => obj -> SQLResultSet
castToSQLResultSet = castTo gTypeSQLResultSet "SQLResultSet"

foreign import javascript unsafe "window[\"SQLResultSet\"]" gTypeSQLResultSet :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SQLResultSetRowList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SQLResultSetRowList Mozilla SQLResultSetRowList documentation>
newtype SQLResultSetRowList = SQLResultSetRowList { unSQLResultSetRowList :: JSRef }

instance Eq (SQLResultSetRowList) where
  (SQLResultSetRowList a) == (SQLResultSetRowList b) = js_eq a b

instance PToJSRef SQLResultSetRowList where
  pToJSRef = unSQLResultSetRowList
  {-# INLINE pToJSRef #-}

instance PFromJSRef SQLResultSetRowList where
  pFromJSRef = SQLResultSetRowList
  {-# INLINE pFromJSRef #-}

instance ToJSRef SQLResultSetRowList where
  toJSRef = return . unSQLResultSetRowList
  {-# INLINE toJSRef #-}

instance FromJSRef SQLResultSetRowList where
  fromJSRef = return . fmap SQLResultSetRowList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SQLResultSetRowList where
  toGObject = GObject . unSQLResultSetRowList
  {-# INLINE toGObject #-}
  unsafeCastGObject = SQLResultSetRowList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSQLResultSetRowList :: IsGObject obj => obj -> SQLResultSetRowList
castToSQLResultSetRowList = castTo gTypeSQLResultSetRowList "SQLResultSetRowList"

foreign import javascript unsafe "window[\"SQLResultSetRowList\"]" gTypeSQLResultSetRowList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SQLTransaction".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SQLTransaction Mozilla SQLTransaction documentation>
newtype SQLTransaction = SQLTransaction { unSQLTransaction :: JSRef }

instance Eq (SQLTransaction) where
  (SQLTransaction a) == (SQLTransaction b) = js_eq a b

instance PToJSRef SQLTransaction where
  pToJSRef = unSQLTransaction
  {-# INLINE pToJSRef #-}

instance PFromJSRef SQLTransaction where
  pFromJSRef = SQLTransaction
  {-# INLINE pFromJSRef #-}

instance ToJSRef SQLTransaction where
  toJSRef = return . unSQLTransaction
  {-# INLINE toJSRef #-}

instance FromJSRef SQLTransaction where
  fromJSRef = return . fmap SQLTransaction . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SQLTransaction where
  toGObject = GObject . unSQLTransaction
  {-# INLINE toGObject #-}
  unsafeCastGObject = SQLTransaction . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSQLTransaction :: IsGObject obj => obj -> SQLTransaction
castToSQLTransaction = castTo gTypeSQLTransaction "SQLTransaction"

foreign import javascript unsafe "window[\"SQLTransaction\"]" gTypeSQLTransaction :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAElement Mozilla SVGAElement documentation>
newtype SVGAElement = SVGAElement { unSVGAElement :: JSRef }

instance Eq (SVGAElement) where
  (SVGAElement a) == (SVGAElement b) = js_eq a b

instance PToJSRef SVGAElement where
  pToJSRef = unSVGAElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAElement where
  pFromJSRef = SVGAElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAElement where
  toJSRef = return . unSVGAElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAElement where
  fromJSRef = return . fmap SVGAElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGraphicsElement SVGAElement
instance IsSVGElement SVGAElement
instance IsElement SVGAElement
instance IsNode SVGAElement
instance IsEventTarget SVGAElement
instance IsGObject SVGAElement where
  toGObject = GObject . unSVGAElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAElement :: IsGObject obj => obj -> SVGAElement
castToSVGAElement = castTo gTypeSVGAElement "SVGAElement"

foreign import javascript unsafe "window[\"SVGAElement\"]" gTypeSVGAElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAltGlyphDefElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAltGlyphDefElement Mozilla SVGAltGlyphDefElement documentation>
newtype SVGAltGlyphDefElement = SVGAltGlyphDefElement { unSVGAltGlyphDefElement :: JSRef }

instance Eq (SVGAltGlyphDefElement) where
  (SVGAltGlyphDefElement a) == (SVGAltGlyphDefElement b) = js_eq a b

instance PToJSRef SVGAltGlyphDefElement where
  pToJSRef = unSVGAltGlyphDefElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAltGlyphDefElement where
  pFromJSRef = SVGAltGlyphDefElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAltGlyphDefElement where
  toJSRef = return . unSVGAltGlyphDefElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAltGlyphDefElement where
  fromJSRef = return . fmap SVGAltGlyphDefElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGAltGlyphDefElement
instance IsElement SVGAltGlyphDefElement
instance IsNode SVGAltGlyphDefElement
instance IsEventTarget SVGAltGlyphDefElement
instance IsGObject SVGAltGlyphDefElement where
  toGObject = GObject . unSVGAltGlyphDefElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAltGlyphDefElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAltGlyphDefElement :: IsGObject obj => obj -> SVGAltGlyphDefElement
castToSVGAltGlyphDefElement = castTo gTypeSVGAltGlyphDefElement "SVGAltGlyphDefElement"

foreign import javascript unsafe "window[\"SVGAltGlyphDefElement\"]" gTypeSVGAltGlyphDefElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAltGlyphElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGTextPositioningElement"
--     * "GHCJS.DOM.SVGTextContentElement"
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAltGlyphElement Mozilla SVGAltGlyphElement documentation>
newtype SVGAltGlyphElement = SVGAltGlyphElement { unSVGAltGlyphElement :: JSRef }

instance Eq (SVGAltGlyphElement) where
  (SVGAltGlyphElement a) == (SVGAltGlyphElement b) = js_eq a b

instance PToJSRef SVGAltGlyphElement where
  pToJSRef = unSVGAltGlyphElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAltGlyphElement where
  pFromJSRef = SVGAltGlyphElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAltGlyphElement where
  toJSRef = return . unSVGAltGlyphElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAltGlyphElement where
  fromJSRef = return . fmap SVGAltGlyphElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGTextPositioningElement SVGAltGlyphElement
instance IsSVGTextContentElement SVGAltGlyphElement
instance IsSVGGraphicsElement SVGAltGlyphElement
instance IsSVGElement SVGAltGlyphElement
instance IsElement SVGAltGlyphElement
instance IsNode SVGAltGlyphElement
instance IsEventTarget SVGAltGlyphElement
instance IsGObject SVGAltGlyphElement where
  toGObject = GObject . unSVGAltGlyphElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAltGlyphElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAltGlyphElement :: IsGObject obj => obj -> SVGAltGlyphElement
castToSVGAltGlyphElement = castTo gTypeSVGAltGlyphElement "SVGAltGlyphElement"

foreign import javascript unsafe "window[\"SVGAltGlyphElement\"]" gTypeSVGAltGlyphElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAltGlyphItemElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAltGlyphItemElement Mozilla SVGAltGlyphItemElement documentation>
newtype SVGAltGlyphItemElement = SVGAltGlyphItemElement { unSVGAltGlyphItemElement :: JSRef }

instance Eq (SVGAltGlyphItemElement) where
  (SVGAltGlyphItemElement a) == (SVGAltGlyphItemElement b) = js_eq a b

instance PToJSRef SVGAltGlyphItemElement where
  pToJSRef = unSVGAltGlyphItemElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAltGlyphItemElement where
  pFromJSRef = SVGAltGlyphItemElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAltGlyphItemElement where
  toJSRef = return . unSVGAltGlyphItemElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAltGlyphItemElement where
  fromJSRef = return . fmap SVGAltGlyphItemElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGAltGlyphItemElement
instance IsElement SVGAltGlyphItemElement
instance IsNode SVGAltGlyphItemElement
instance IsEventTarget SVGAltGlyphItemElement
instance IsGObject SVGAltGlyphItemElement where
  toGObject = GObject . unSVGAltGlyphItemElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAltGlyphItemElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAltGlyphItemElement :: IsGObject obj => obj -> SVGAltGlyphItemElement
castToSVGAltGlyphItemElement = castTo gTypeSVGAltGlyphItemElement "SVGAltGlyphItemElement"

foreign import javascript unsafe "window[\"SVGAltGlyphItemElement\"]" gTypeSVGAltGlyphItemElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAngle".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAngle Mozilla SVGAngle documentation>
newtype SVGAngle = SVGAngle { unSVGAngle :: JSRef }

instance Eq (SVGAngle) where
  (SVGAngle a) == (SVGAngle b) = js_eq a b

instance PToJSRef SVGAngle where
  pToJSRef = unSVGAngle
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAngle where
  pFromJSRef = SVGAngle
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAngle where
  toJSRef = return . unSVGAngle
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAngle where
  fromJSRef = return . fmap SVGAngle . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGAngle where
  toGObject = GObject . unSVGAngle
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAngle . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAngle :: IsGObject obj => obj -> SVGAngle
castToSVGAngle = castTo gTypeSVGAngle "SVGAngle"

foreign import javascript unsafe "window[\"SVGAngle\"]" gTypeSVGAngle :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimateColorElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGAnimationElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimateColorElement Mozilla SVGAnimateColorElement documentation>
newtype SVGAnimateColorElement = SVGAnimateColorElement { unSVGAnimateColorElement :: JSRef }

instance Eq (SVGAnimateColorElement) where
  (SVGAnimateColorElement a) == (SVGAnimateColorElement b) = js_eq a b

instance PToJSRef SVGAnimateColorElement where
  pToJSRef = unSVGAnimateColorElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimateColorElement where
  pFromJSRef = SVGAnimateColorElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimateColorElement where
  toJSRef = return . unSVGAnimateColorElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimateColorElement where
  fromJSRef = return . fmap SVGAnimateColorElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGAnimationElement SVGAnimateColorElement
instance IsSVGElement SVGAnimateColorElement
instance IsElement SVGAnimateColorElement
instance IsNode SVGAnimateColorElement
instance IsEventTarget SVGAnimateColorElement
instance IsGObject SVGAnimateColorElement where
  toGObject = GObject . unSVGAnimateColorElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimateColorElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimateColorElement :: IsGObject obj => obj -> SVGAnimateColorElement
castToSVGAnimateColorElement = castTo gTypeSVGAnimateColorElement "SVGAnimateColorElement"

foreign import javascript unsafe "window[\"SVGAnimateColorElement\"]" gTypeSVGAnimateColorElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimateElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGAnimationElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimateElement Mozilla SVGAnimateElement documentation>
newtype SVGAnimateElement = SVGAnimateElement { unSVGAnimateElement :: JSRef }

instance Eq (SVGAnimateElement) where
  (SVGAnimateElement a) == (SVGAnimateElement b) = js_eq a b

instance PToJSRef SVGAnimateElement where
  pToJSRef = unSVGAnimateElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimateElement where
  pFromJSRef = SVGAnimateElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimateElement where
  toJSRef = return . unSVGAnimateElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimateElement where
  fromJSRef = return . fmap SVGAnimateElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGAnimationElement SVGAnimateElement
instance IsSVGElement SVGAnimateElement
instance IsElement SVGAnimateElement
instance IsNode SVGAnimateElement
instance IsEventTarget SVGAnimateElement
instance IsGObject SVGAnimateElement where
  toGObject = GObject . unSVGAnimateElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimateElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimateElement :: IsGObject obj => obj -> SVGAnimateElement
castToSVGAnimateElement = castTo gTypeSVGAnimateElement "SVGAnimateElement"

foreign import javascript unsafe "window[\"SVGAnimateElement\"]" gTypeSVGAnimateElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimateMotionElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGAnimationElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimateMotionElement Mozilla SVGAnimateMotionElement documentation>
newtype SVGAnimateMotionElement = SVGAnimateMotionElement { unSVGAnimateMotionElement :: JSRef }

instance Eq (SVGAnimateMotionElement) where
  (SVGAnimateMotionElement a) == (SVGAnimateMotionElement b) = js_eq a b

instance PToJSRef SVGAnimateMotionElement where
  pToJSRef = unSVGAnimateMotionElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimateMotionElement where
  pFromJSRef = SVGAnimateMotionElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimateMotionElement where
  toJSRef = return . unSVGAnimateMotionElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimateMotionElement where
  fromJSRef = return . fmap SVGAnimateMotionElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGAnimationElement SVGAnimateMotionElement
instance IsSVGElement SVGAnimateMotionElement
instance IsElement SVGAnimateMotionElement
instance IsNode SVGAnimateMotionElement
instance IsEventTarget SVGAnimateMotionElement
instance IsGObject SVGAnimateMotionElement where
  toGObject = GObject . unSVGAnimateMotionElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimateMotionElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimateMotionElement :: IsGObject obj => obj -> SVGAnimateMotionElement
castToSVGAnimateMotionElement = castTo gTypeSVGAnimateMotionElement "SVGAnimateMotionElement"

foreign import javascript unsafe "window[\"SVGAnimateMotionElement\"]" gTypeSVGAnimateMotionElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimateTransformElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGAnimationElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimateTransformElement Mozilla SVGAnimateTransformElement documentation>
newtype SVGAnimateTransformElement = SVGAnimateTransformElement { unSVGAnimateTransformElement :: JSRef }

instance Eq (SVGAnimateTransformElement) where
  (SVGAnimateTransformElement a) == (SVGAnimateTransformElement b) = js_eq a b

instance PToJSRef SVGAnimateTransformElement where
  pToJSRef = unSVGAnimateTransformElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimateTransformElement where
  pFromJSRef = SVGAnimateTransformElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimateTransformElement where
  toJSRef = return . unSVGAnimateTransformElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimateTransformElement where
  fromJSRef = return . fmap SVGAnimateTransformElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGAnimationElement SVGAnimateTransformElement
instance IsSVGElement SVGAnimateTransformElement
instance IsElement SVGAnimateTransformElement
instance IsNode SVGAnimateTransformElement
instance IsEventTarget SVGAnimateTransformElement
instance IsGObject SVGAnimateTransformElement where
  toGObject = GObject . unSVGAnimateTransformElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimateTransformElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimateTransformElement :: IsGObject obj => obj -> SVGAnimateTransformElement
castToSVGAnimateTransformElement = castTo gTypeSVGAnimateTransformElement "SVGAnimateTransformElement"

foreign import javascript unsafe "window[\"SVGAnimateTransformElement\"]" gTypeSVGAnimateTransformElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimatedAngle".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimatedAngle Mozilla SVGAnimatedAngle documentation>
newtype SVGAnimatedAngle = SVGAnimatedAngle { unSVGAnimatedAngle :: JSRef }

instance Eq (SVGAnimatedAngle) where
  (SVGAnimatedAngle a) == (SVGAnimatedAngle b) = js_eq a b

instance PToJSRef SVGAnimatedAngle where
  pToJSRef = unSVGAnimatedAngle
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimatedAngle where
  pFromJSRef = SVGAnimatedAngle
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimatedAngle where
  toJSRef = return . unSVGAnimatedAngle
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimatedAngle where
  fromJSRef = return . fmap SVGAnimatedAngle . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGAnimatedAngle where
  toGObject = GObject . unSVGAnimatedAngle
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimatedAngle . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimatedAngle :: IsGObject obj => obj -> SVGAnimatedAngle
castToSVGAnimatedAngle = castTo gTypeSVGAnimatedAngle "SVGAnimatedAngle"

foreign import javascript unsafe "window[\"SVGAnimatedAngle\"]" gTypeSVGAnimatedAngle :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimatedBoolean".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimatedBoolean Mozilla SVGAnimatedBoolean documentation>
newtype SVGAnimatedBoolean = SVGAnimatedBoolean { unSVGAnimatedBoolean :: JSRef }

instance Eq (SVGAnimatedBoolean) where
  (SVGAnimatedBoolean a) == (SVGAnimatedBoolean b) = js_eq a b

instance PToJSRef SVGAnimatedBoolean where
  pToJSRef = unSVGAnimatedBoolean
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimatedBoolean where
  pFromJSRef = SVGAnimatedBoolean
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimatedBoolean where
  toJSRef = return . unSVGAnimatedBoolean
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimatedBoolean where
  fromJSRef = return . fmap SVGAnimatedBoolean . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGAnimatedBoolean where
  toGObject = GObject . unSVGAnimatedBoolean
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimatedBoolean . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimatedBoolean :: IsGObject obj => obj -> SVGAnimatedBoolean
castToSVGAnimatedBoolean = castTo gTypeSVGAnimatedBoolean "SVGAnimatedBoolean"

foreign import javascript unsafe "window[\"SVGAnimatedBoolean\"]" gTypeSVGAnimatedBoolean :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimatedEnumeration".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimatedEnumeration Mozilla SVGAnimatedEnumeration documentation>
newtype SVGAnimatedEnumeration = SVGAnimatedEnumeration { unSVGAnimatedEnumeration :: JSRef }

instance Eq (SVGAnimatedEnumeration) where
  (SVGAnimatedEnumeration a) == (SVGAnimatedEnumeration b) = js_eq a b

instance PToJSRef SVGAnimatedEnumeration where
  pToJSRef = unSVGAnimatedEnumeration
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimatedEnumeration where
  pFromJSRef = SVGAnimatedEnumeration
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimatedEnumeration where
  toJSRef = return . unSVGAnimatedEnumeration
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimatedEnumeration where
  fromJSRef = return . fmap SVGAnimatedEnumeration . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGAnimatedEnumeration where
  toGObject = GObject . unSVGAnimatedEnumeration
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimatedEnumeration . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimatedEnumeration :: IsGObject obj => obj -> SVGAnimatedEnumeration
castToSVGAnimatedEnumeration = castTo gTypeSVGAnimatedEnumeration "SVGAnimatedEnumeration"

foreign import javascript unsafe "window[\"SVGAnimatedEnumeration\"]" gTypeSVGAnimatedEnumeration :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimatedInteger".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimatedInteger Mozilla SVGAnimatedInteger documentation>
newtype SVGAnimatedInteger = SVGAnimatedInteger { unSVGAnimatedInteger :: JSRef }

instance Eq (SVGAnimatedInteger) where
  (SVGAnimatedInteger a) == (SVGAnimatedInteger b) = js_eq a b

instance PToJSRef SVGAnimatedInteger where
  pToJSRef = unSVGAnimatedInteger
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimatedInteger where
  pFromJSRef = SVGAnimatedInteger
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimatedInteger where
  toJSRef = return . unSVGAnimatedInteger
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimatedInteger where
  fromJSRef = return . fmap SVGAnimatedInteger . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGAnimatedInteger where
  toGObject = GObject . unSVGAnimatedInteger
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimatedInteger . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimatedInteger :: IsGObject obj => obj -> SVGAnimatedInteger
castToSVGAnimatedInteger = castTo gTypeSVGAnimatedInteger "SVGAnimatedInteger"

foreign import javascript unsafe "window[\"SVGAnimatedInteger\"]" gTypeSVGAnimatedInteger :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimatedLength".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimatedLength Mozilla SVGAnimatedLength documentation>
newtype SVGAnimatedLength = SVGAnimatedLength { unSVGAnimatedLength :: JSRef }

instance Eq (SVGAnimatedLength) where
  (SVGAnimatedLength a) == (SVGAnimatedLength b) = js_eq a b

instance PToJSRef SVGAnimatedLength where
  pToJSRef = unSVGAnimatedLength
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimatedLength where
  pFromJSRef = SVGAnimatedLength
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimatedLength where
  toJSRef = return . unSVGAnimatedLength
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimatedLength where
  fromJSRef = return . fmap SVGAnimatedLength . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGAnimatedLength where
  toGObject = GObject . unSVGAnimatedLength
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimatedLength . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimatedLength :: IsGObject obj => obj -> SVGAnimatedLength
castToSVGAnimatedLength = castTo gTypeSVGAnimatedLength "SVGAnimatedLength"

foreign import javascript unsafe "window[\"SVGAnimatedLength\"]" gTypeSVGAnimatedLength :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimatedLengthList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimatedLengthList Mozilla SVGAnimatedLengthList documentation>
newtype SVGAnimatedLengthList = SVGAnimatedLengthList { unSVGAnimatedLengthList :: JSRef }

instance Eq (SVGAnimatedLengthList) where
  (SVGAnimatedLengthList a) == (SVGAnimatedLengthList b) = js_eq a b

instance PToJSRef SVGAnimatedLengthList where
  pToJSRef = unSVGAnimatedLengthList
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimatedLengthList where
  pFromJSRef = SVGAnimatedLengthList
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimatedLengthList where
  toJSRef = return . unSVGAnimatedLengthList
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimatedLengthList where
  fromJSRef = return . fmap SVGAnimatedLengthList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGAnimatedLengthList where
  toGObject = GObject . unSVGAnimatedLengthList
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimatedLengthList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimatedLengthList :: IsGObject obj => obj -> SVGAnimatedLengthList
castToSVGAnimatedLengthList = castTo gTypeSVGAnimatedLengthList "SVGAnimatedLengthList"

foreign import javascript unsafe "window[\"SVGAnimatedLengthList\"]" gTypeSVGAnimatedLengthList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimatedNumber".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimatedNumber Mozilla SVGAnimatedNumber documentation>
newtype SVGAnimatedNumber = SVGAnimatedNumber { unSVGAnimatedNumber :: JSRef }

instance Eq (SVGAnimatedNumber) where
  (SVGAnimatedNumber a) == (SVGAnimatedNumber b) = js_eq a b

instance PToJSRef SVGAnimatedNumber where
  pToJSRef = unSVGAnimatedNumber
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimatedNumber where
  pFromJSRef = SVGAnimatedNumber
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimatedNumber where
  toJSRef = return . unSVGAnimatedNumber
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimatedNumber where
  fromJSRef = return . fmap SVGAnimatedNumber . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGAnimatedNumber where
  toGObject = GObject . unSVGAnimatedNumber
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimatedNumber . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimatedNumber :: IsGObject obj => obj -> SVGAnimatedNumber
castToSVGAnimatedNumber = castTo gTypeSVGAnimatedNumber "SVGAnimatedNumber"

foreign import javascript unsafe "window[\"SVGAnimatedNumber\"]" gTypeSVGAnimatedNumber :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimatedNumberList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimatedNumberList Mozilla SVGAnimatedNumberList documentation>
newtype SVGAnimatedNumberList = SVGAnimatedNumberList { unSVGAnimatedNumberList :: JSRef }

instance Eq (SVGAnimatedNumberList) where
  (SVGAnimatedNumberList a) == (SVGAnimatedNumberList b) = js_eq a b

instance PToJSRef SVGAnimatedNumberList where
  pToJSRef = unSVGAnimatedNumberList
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimatedNumberList where
  pFromJSRef = SVGAnimatedNumberList
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimatedNumberList where
  toJSRef = return . unSVGAnimatedNumberList
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimatedNumberList where
  fromJSRef = return . fmap SVGAnimatedNumberList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGAnimatedNumberList where
  toGObject = GObject . unSVGAnimatedNumberList
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimatedNumberList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimatedNumberList :: IsGObject obj => obj -> SVGAnimatedNumberList
castToSVGAnimatedNumberList = castTo gTypeSVGAnimatedNumberList "SVGAnimatedNumberList"

foreign import javascript unsafe "window[\"SVGAnimatedNumberList\"]" gTypeSVGAnimatedNumberList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimatedPreserveAspectRatio".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimatedPreserveAspectRatio Mozilla SVGAnimatedPreserveAspectRatio documentation>
newtype SVGAnimatedPreserveAspectRatio = SVGAnimatedPreserveAspectRatio { unSVGAnimatedPreserveAspectRatio :: JSRef }

instance Eq (SVGAnimatedPreserveAspectRatio) where
  (SVGAnimatedPreserveAspectRatio a) == (SVGAnimatedPreserveAspectRatio b) = js_eq a b

instance PToJSRef SVGAnimatedPreserveAspectRatio where
  pToJSRef = unSVGAnimatedPreserveAspectRatio
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimatedPreserveAspectRatio where
  pFromJSRef = SVGAnimatedPreserveAspectRatio
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimatedPreserveAspectRatio where
  toJSRef = return . unSVGAnimatedPreserveAspectRatio
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimatedPreserveAspectRatio where
  fromJSRef = return . fmap SVGAnimatedPreserveAspectRatio . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGAnimatedPreserveAspectRatio where
  toGObject = GObject . unSVGAnimatedPreserveAspectRatio
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimatedPreserveAspectRatio . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimatedPreserveAspectRatio :: IsGObject obj => obj -> SVGAnimatedPreserveAspectRatio
castToSVGAnimatedPreserveAspectRatio = castTo gTypeSVGAnimatedPreserveAspectRatio "SVGAnimatedPreserveAspectRatio"

foreign import javascript unsafe "window[\"SVGAnimatedPreserveAspectRatio\"]" gTypeSVGAnimatedPreserveAspectRatio :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimatedRect".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimatedRect Mozilla SVGAnimatedRect documentation>
newtype SVGAnimatedRect = SVGAnimatedRect { unSVGAnimatedRect :: JSRef }

instance Eq (SVGAnimatedRect) where
  (SVGAnimatedRect a) == (SVGAnimatedRect b) = js_eq a b

instance PToJSRef SVGAnimatedRect where
  pToJSRef = unSVGAnimatedRect
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimatedRect where
  pFromJSRef = SVGAnimatedRect
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimatedRect where
  toJSRef = return . unSVGAnimatedRect
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimatedRect where
  fromJSRef = return . fmap SVGAnimatedRect . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGAnimatedRect where
  toGObject = GObject . unSVGAnimatedRect
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimatedRect . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimatedRect :: IsGObject obj => obj -> SVGAnimatedRect
castToSVGAnimatedRect = castTo gTypeSVGAnimatedRect "SVGAnimatedRect"

foreign import javascript unsafe "window[\"SVGAnimatedRect\"]" gTypeSVGAnimatedRect :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimatedString".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimatedString Mozilla SVGAnimatedString documentation>
newtype SVGAnimatedString = SVGAnimatedString { unSVGAnimatedString :: JSRef }

instance Eq (SVGAnimatedString) where
  (SVGAnimatedString a) == (SVGAnimatedString b) = js_eq a b

instance PToJSRef SVGAnimatedString where
  pToJSRef = unSVGAnimatedString
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimatedString where
  pFromJSRef = SVGAnimatedString
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimatedString where
  toJSRef = return . unSVGAnimatedString
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimatedString where
  fromJSRef = return . fmap SVGAnimatedString . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGAnimatedString where
  toGObject = GObject . unSVGAnimatedString
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimatedString . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimatedString :: IsGObject obj => obj -> SVGAnimatedString
castToSVGAnimatedString = castTo gTypeSVGAnimatedString "SVGAnimatedString"

foreign import javascript unsafe "window[\"SVGAnimatedString\"]" gTypeSVGAnimatedString :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimatedTransformList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimatedTransformList Mozilla SVGAnimatedTransformList documentation>
newtype SVGAnimatedTransformList = SVGAnimatedTransformList { unSVGAnimatedTransformList :: JSRef }

instance Eq (SVGAnimatedTransformList) where
  (SVGAnimatedTransformList a) == (SVGAnimatedTransformList b) = js_eq a b

instance PToJSRef SVGAnimatedTransformList where
  pToJSRef = unSVGAnimatedTransformList
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimatedTransformList where
  pFromJSRef = SVGAnimatedTransformList
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimatedTransformList where
  toJSRef = return . unSVGAnimatedTransformList
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimatedTransformList where
  fromJSRef = return . fmap SVGAnimatedTransformList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGAnimatedTransformList where
  toGObject = GObject . unSVGAnimatedTransformList
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimatedTransformList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimatedTransformList :: IsGObject obj => obj -> SVGAnimatedTransformList
castToSVGAnimatedTransformList = castTo gTypeSVGAnimatedTransformList "SVGAnimatedTransformList"

foreign import javascript unsafe "window[\"SVGAnimatedTransformList\"]" gTypeSVGAnimatedTransformList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGAnimationElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimationElement Mozilla SVGAnimationElement documentation>
newtype SVGAnimationElement = SVGAnimationElement { unSVGAnimationElement :: JSRef }

instance Eq (SVGAnimationElement) where
  (SVGAnimationElement a) == (SVGAnimationElement b) = js_eq a b

instance PToJSRef SVGAnimationElement where
  pToJSRef = unSVGAnimationElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGAnimationElement where
  pFromJSRef = SVGAnimationElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGAnimationElement where
  toJSRef = return . unSVGAnimationElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGAnimationElement where
  fromJSRef = return . fmap SVGAnimationElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsSVGElement o => IsSVGAnimationElement o
toSVGAnimationElement :: IsSVGAnimationElement o => o -> SVGAnimationElement
toSVGAnimationElement = unsafeCastGObject . toGObject

instance IsSVGAnimationElement SVGAnimationElement
instance IsSVGElement SVGAnimationElement
instance IsElement SVGAnimationElement
instance IsNode SVGAnimationElement
instance IsEventTarget SVGAnimationElement
instance IsGObject SVGAnimationElement where
  toGObject = GObject . unSVGAnimationElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGAnimationElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGAnimationElement :: IsGObject obj => obj -> SVGAnimationElement
castToSVGAnimationElement = castTo gTypeSVGAnimationElement "SVGAnimationElement"

foreign import javascript unsafe "window[\"SVGAnimationElement\"]" gTypeSVGAnimationElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGCircleElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGCircleElement Mozilla SVGCircleElement documentation>
newtype SVGCircleElement = SVGCircleElement { unSVGCircleElement :: JSRef }

instance Eq (SVGCircleElement) where
  (SVGCircleElement a) == (SVGCircleElement b) = js_eq a b

instance PToJSRef SVGCircleElement where
  pToJSRef = unSVGCircleElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGCircleElement where
  pFromJSRef = SVGCircleElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGCircleElement where
  toJSRef = return . unSVGCircleElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGCircleElement where
  fromJSRef = return . fmap SVGCircleElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGraphicsElement SVGCircleElement
instance IsSVGElement SVGCircleElement
instance IsElement SVGCircleElement
instance IsNode SVGCircleElement
instance IsEventTarget SVGCircleElement
instance IsGObject SVGCircleElement where
  toGObject = GObject . unSVGCircleElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGCircleElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGCircleElement :: IsGObject obj => obj -> SVGCircleElement
castToSVGCircleElement = castTo gTypeSVGCircleElement "SVGCircleElement"

foreign import javascript unsafe "window[\"SVGCircleElement\"]" gTypeSVGCircleElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGClipPathElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGClipPathElement Mozilla SVGClipPathElement documentation>
newtype SVGClipPathElement = SVGClipPathElement { unSVGClipPathElement :: JSRef }

instance Eq (SVGClipPathElement) where
  (SVGClipPathElement a) == (SVGClipPathElement b) = js_eq a b

instance PToJSRef SVGClipPathElement where
  pToJSRef = unSVGClipPathElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGClipPathElement where
  pFromJSRef = SVGClipPathElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGClipPathElement where
  toJSRef = return . unSVGClipPathElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGClipPathElement where
  fromJSRef = return . fmap SVGClipPathElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGraphicsElement SVGClipPathElement
instance IsSVGElement SVGClipPathElement
instance IsElement SVGClipPathElement
instance IsNode SVGClipPathElement
instance IsEventTarget SVGClipPathElement
instance IsGObject SVGClipPathElement where
  toGObject = GObject . unSVGClipPathElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGClipPathElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGClipPathElement :: IsGObject obj => obj -> SVGClipPathElement
castToSVGClipPathElement = castTo gTypeSVGClipPathElement "SVGClipPathElement"

foreign import javascript unsafe "window[\"SVGClipPathElement\"]" gTypeSVGClipPathElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGColor".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSValue"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGColor Mozilla SVGColor documentation>
newtype SVGColor = SVGColor { unSVGColor :: JSRef }

instance Eq (SVGColor) where
  (SVGColor a) == (SVGColor b) = js_eq a b

instance PToJSRef SVGColor where
  pToJSRef = unSVGColor
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGColor where
  pFromJSRef = SVGColor
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGColor where
  toJSRef = return . unSVGColor
  {-# INLINE toJSRef #-}

instance FromJSRef SVGColor where
  fromJSRef = return . fmap SVGColor . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsCSSValue o => IsSVGColor o
toSVGColor :: IsSVGColor o => o -> SVGColor
toSVGColor = unsafeCastGObject . toGObject

instance IsSVGColor SVGColor
instance IsCSSValue SVGColor
instance IsGObject SVGColor where
  toGObject = GObject . unSVGColor
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGColor . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGColor :: IsGObject obj => obj -> SVGColor
castToSVGColor = castTo gTypeSVGColor "SVGColor"

foreign import javascript unsafe "window[\"SVGColor\"]" gTypeSVGColor :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGComponentTransferFunctionElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGComponentTransferFunctionElement Mozilla SVGComponentTransferFunctionElement documentation>
newtype SVGComponentTransferFunctionElement = SVGComponentTransferFunctionElement { unSVGComponentTransferFunctionElement :: JSRef }

instance Eq (SVGComponentTransferFunctionElement) where
  (SVGComponentTransferFunctionElement a) == (SVGComponentTransferFunctionElement b) = js_eq a b

instance PToJSRef SVGComponentTransferFunctionElement where
  pToJSRef = unSVGComponentTransferFunctionElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGComponentTransferFunctionElement where
  pFromJSRef = SVGComponentTransferFunctionElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGComponentTransferFunctionElement where
  toJSRef = return . unSVGComponentTransferFunctionElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGComponentTransferFunctionElement where
  fromJSRef = return . fmap SVGComponentTransferFunctionElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsSVGElement o => IsSVGComponentTransferFunctionElement o
toSVGComponentTransferFunctionElement :: IsSVGComponentTransferFunctionElement o => o -> SVGComponentTransferFunctionElement
toSVGComponentTransferFunctionElement = unsafeCastGObject . toGObject

instance IsSVGComponentTransferFunctionElement SVGComponentTransferFunctionElement
instance IsSVGElement SVGComponentTransferFunctionElement
instance IsElement SVGComponentTransferFunctionElement
instance IsNode SVGComponentTransferFunctionElement
instance IsEventTarget SVGComponentTransferFunctionElement
instance IsGObject SVGComponentTransferFunctionElement where
  toGObject = GObject . unSVGComponentTransferFunctionElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGComponentTransferFunctionElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGComponentTransferFunctionElement :: IsGObject obj => obj -> SVGComponentTransferFunctionElement
castToSVGComponentTransferFunctionElement = castTo gTypeSVGComponentTransferFunctionElement "SVGComponentTransferFunctionElement"

foreign import javascript unsafe "window[\"SVGComponentTransferFunctionElement\"]" gTypeSVGComponentTransferFunctionElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGCursorElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGCursorElement Mozilla SVGCursorElement documentation>
newtype SVGCursorElement = SVGCursorElement { unSVGCursorElement :: JSRef }

instance Eq (SVGCursorElement) where
  (SVGCursorElement a) == (SVGCursorElement b) = js_eq a b

instance PToJSRef SVGCursorElement where
  pToJSRef = unSVGCursorElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGCursorElement where
  pFromJSRef = SVGCursorElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGCursorElement where
  toJSRef = return . unSVGCursorElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGCursorElement where
  fromJSRef = return . fmap SVGCursorElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGCursorElement
instance IsElement SVGCursorElement
instance IsNode SVGCursorElement
instance IsEventTarget SVGCursorElement
instance IsGObject SVGCursorElement where
  toGObject = GObject . unSVGCursorElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGCursorElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGCursorElement :: IsGObject obj => obj -> SVGCursorElement
castToSVGCursorElement = castTo gTypeSVGCursorElement "SVGCursorElement"

foreign import javascript unsafe "window[\"SVGCursorElement\"]" gTypeSVGCursorElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGDefsElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGDefsElement Mozilla SVGDefsElement documentation>
newtype SVGDefsElement = SVGDefsElement { unSVGDefsElement :: JSRef }

instance Eq (SVGDefsElement) where
  (SVGDefsElement a) == (SVGDefsElement b) = js_eq a b

instance PToJSRef SVGDefsElement where
  pToJSRef = unSVGDefsElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGDefsElement where
  pFromJSRef = SVGDefsElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGDefsElement where
  toJSRef = return . unSVGDefsElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGDefsElement where
  fromJSRef = return . fmap SVGDefsElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGraphicsElement SVGDefsElement
instance IsSVGElement SVGDefsElement
instance IsElement SVGDefsElement
instance IsNode SVGDefsElement
instance IsEventTarget SVGDefsElement
instance IsGObject SVGDefsElement where
  toGObject = GObject . unSVGDefsElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGDefsElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGDefsElement :: IsGObject obj => obj -> SVGDefsElement
castToSVGDefsElement = castTo gTypeSVGDefsElement "SVGDefsElement"

foreign import javascript unsafe "window[\"SVGDefsElement\"]" gTypeSVGDefsElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGDescElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGDescElement Mozilla SVGDescElement documentation>
newtype SVGDescElement = SVGDescElement { unSVGDescElement :: JSRef }

instance Eq (SVGDescElement) where
  (SVGDescElement a) == (SVGDescElement b) = js_eq a b

instance PToJSRef SVGDescElement where
  pToJSRef = unSVGDescElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGDescElement where
  pFromJSRef = SVGDescElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGDescElement where
  toJSRef = return . unSVGDescElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGDescElement where
  fromJSRef = return . fmap SVGDescElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGDescElement
instance IsElement SVGDescElement
instance IsNode SVGDescElement
instance IsEventTarget SVGDescElement
instance IsGObject SVGDescElement where
  toGObject = GObject . unSVGDescElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGDescElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGDescElement :: IsGObject obj => obj -> SVGDescElement
castToSVGDescElement = castTo gTypeSVGDescElement "SVGDescElement"

foreign import javascript unsafe "window[\"SVGDescElement\"]" gTypeSVGDescElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGDocument".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Document"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGDocument Mozilla SVGDocument documentation>
newtype SVGDocument = SVGDocument { unSVGDocument :: JSRef }

instance Eq (SVGDocument) where
  (SVGDocument a) == (SVGDocument b) = js_eq a b

instance PToJSRef SVGDocument where
  pToJSRef = unSVGDocument
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGDocument where
  pFromJSRef = SVGDocument
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGDocument where
  toJSRef = return . unSVGDocument
  {-# INLINE toJSRef #-}

instance FromJSRef SVGDocument where
  fromJSRef = return . fmap SVGDocument . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsDocument SVGDocument
instance IsNode SVGDocument
instance IsEventTarget SVGDocument
instance IsGObject SVGDocument where
  toGObject = GObject . unSVGDocument
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGDocument . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGDocument :: IsGObject obj => obj -> SVGDocument
castToSVGDocument = castTo gTypeSVGDocument "SVGDocument"

foreign import javascript unsafe "window[\"SVGDocument\"]" gTypeSVGDocument :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGElement Mozilla SVGElement documentation>
newtype SVGElement = SVGElement { unSVGElement :: JSRef }

instance Eq (SVGElement) where
  (SVGElement a) == (SVGElement b) = js_eq a b

instance PToJSRef SVGElement where
  pToJSRef = unSVGElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGElement where
  pFromJSRef = SVGElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGElement where
  toJSRef = return . unSVGElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGElement where
  fromJSRef = return . fmap SVGElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsElement o => IsSVGElement o
toSVGElement :: IsSVGElement o => o -> SVGElement
toSVGElement = unsafeCastGObject . toGObject

instance IsSVGElement SVGElement
instance IsElement SVGElement
instance IsNode SVGElement
instance IsEventTarget SVGElement
instance IsGObject SVGElement where
  toGObject = GObject . unSVGElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGElement :: IsGObject obj => obj -> SVGElement
castToSVGElement = castTo gTypeSVGElement "SVGElement"

foreign import javascript unsafe "window[\"SVGElement\"]" gTypeSVGElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGEllipseElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGEllipseElement Mozilla SVGEllipseElement documentation>
newtype SVGEllipseElement = SVGEllipseElement { unSVGEllipseElement :: JSRef }

instance Eq (SVGEllipseElement) where
  (SVGEllipseElement a) == (SVGEllipseElement b) = js_eq a b

instance PToJSRef SVGEllipseElement where
  pToJSRef = unSVGEllipseElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGEllipseElement where
  pFromJSRef = SVGEllipseElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGEllipseElement where
  toJSRef = return . unSVGEllipseElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGEllipseElement where
  fromJSRef = return . fmap SVGEllipseElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGraphicsElement SVGEllipseElement
instance IsSVGElement SVGEllipseElement
instance IsElement SVGEllipseElement
instance IsNode SVGEllipseElement
instance IsEventTarget SVGEllipseElement
instance IsGObject SVGEllipseElement where
  toGObject = GObject . unSVGEllipseElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGEllipseElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGEllipseElement :: IsGObject obj => obj -> SVGEllipseElement
castToSVGEllipseElement = castTo gTypeSVGEllipseElement "SVGEllipseElement"

foreign import javascript unsafe "window[\"SVGEllipseElement\"]" gTypeSVGEllipseElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGExternalResourcesRequired".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGExternalResourcesRequired Mozilla SVGExternalResourcesRequired documentation>
newtype SVGExternalResourcesRequired = SVGExternalResourcesRequired { unSVGExternalResourcesRequired :: JSRef }

instance Eq (SVGExternalResourcesRequired) where
  (SVGExternalResourcesRequired a) == (SVGExternalResourcesRequired b) = js_eq a b

instance PToJSRef SVGExternalResourcesRequired where
  pToJSRef = unSVGExternalResourcesRequired
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGExternalResourcesRequired where
  pFromJSRef = SVGExternalResourcesRequired
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGExternalResourcesRequired where
  toJSRef = return . unSVGExternalResourcesRequired
  {-# INLINE toJSRef #-}

instance FromJSRef SVGExternalResourcesRequired where
  fromJSRef = return . fmap SVGExternalResourcesRequired . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGExternalResourcesRequired where
  toGObject = GObject . unSVGExternalResourcesRequired
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGExternalResourcesRequired . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGExternalResourcesRequired :: IsGObject obj => obj -> SVGExternalResourcesRequired
castToSVGExternalResourcesRequired = castTo gTypeSVGExternalResourcesRequired "SVGExternalResourcesRequired"

foreign import javascript unsafe "window[\"SVGExternalResourcesRequired\"]" gTypeSVGExternalResourcesRequired :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEBlendElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEBlendElement Mozilla SVGFEBlendElement documentation>
newtype SVGFEBlendElement = SVGFEBlendElement { unSVGFEBlendElement :: JSRef }

instance Eq (SVGFEBlendElement) where
  (SVGFEBlendElement a) == (SVGFEBlendElement b) = js_eq a b

instance PToJSRef SVGFEBlendElement where
  pToJSRef = unSVGFEBlendElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEBlendElement where
  pFromJSRef = SVGFEBlendElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEBlendElement where
  toJSRef = return . unSVGFEBlendElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEBlendElement where
  fromJSRef = return . fmap SVGFEBlendElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFEBlendElement
instance IsElement SVGFEBlendElement
instance IsNode SVGFEBlendElement
instance IsEventTarget SVGFEBlendElement
instance IsGObject SVGFEBlendElement where
  toGObject = GObject . unSVGFEBlendElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEBlendElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEBlendElement :: IsGObject obj => obj -> SVGFEBlendElement
castToSVGFEBlendElement = castTo gTypeSVGFEBlendElement "SVGFEBlendElement"

foreign import javascript unsafe "window[\"SVGFEBlendElement\"]" gTypeSVGFEBlendElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEColorMatrixElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEColorMatrixElement Mozilla SVGFEColorMatrixElement documentation>
newtype SVGFEColorMatrixElement = SVGFEColorMatrixElement { unSVGFEColorMatrixElement :: JSRef }

instance Eq (SVGFEColorMatrixElement) where
  (SVGFEColorMatrixElement a) == (SVGFEColorMatrixElement b) = js_eq a b

instance PToJSRef SVGFEColorMatrixElement where
  pToJSRef = unSVGFEColorMatrixElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEColorMatrixElement where
  pFromJSRef = SVGFEColorMatrixElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEColorMatrixElement where
  toJSRef = return . unSVGFEColorMatrixElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEColorMatrixElement where
  fromJSRef = return . fmap SVGFEColorMatrixElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFEColorMatrixElement
instance IsElement SVGFEColorMatrixElement
instance IsNode SVGFEColorMatrixElement
instance IsEventTarget SVGFEColorMatrixElement
instance IsGObject SVGFEColorMatrixElement where
  toGObject = GObject . unSVGFEColorMatrixElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEColorMatrixElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEColorMatrixElement :: IsGObject obj => obj -> SVGFEColorMatrixElement
castToSVGFEColorMatrixElement = castTo gTypeSVGFEColorMatrixElement "SVGFEColorMatrixElement"

foreign import javascript unsafe "window[\"SVGFEColorMatrixElement\"]" gTypeSVGFEColorMatrixElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEComponentTransferElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEComponentTransferElement Mozilla SVGFEComponentTransferElement documentation>
newtype SVGFEComponentTransferElement = SVGFEComponentTransferElement { unSVGFEComponentTransferElement :: JSRef }

instance Eq (SVGFEComponentTransferElement) where
  (SVGFEComponentTransferElement a) == (SVGFEComponentTransferElement b) = js_eq a b

instance PToJSRef SVGFEComponentTransferElement where
  pToJSRef = unSVGFEComponentTransferElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEComponentTransferElement where
  pFromJSRef = SVGFEComponentTransferElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEComponentTransferElement where
  toJSRef = return . unSVGFEComponentTransferElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEComponentTransferElement where
  fromJSRef = return . fmap SVGFEComponentTransferElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFEComponentTransferElement
instance IsElement SVGFEComponentTransferElement
instance IsNode SVGFEComponentTransferElement
instance IsEventTarget SVGFEComponentTransferElement
instance IsGObject SVGFEComponentTransferElement where
  toGObject = GObject . unSVGFEComponentTransferElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEComponentTransferElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEComponentTransferElement :: IsGObject obj => obj -> SVGFEComponentTransferElement
castToSVGFEComponentTransferElement = castTo gTypeSVGFEComponentTransferElement "SVGFEComponentTransferElement"

foreign import javascript unsafe "window[\"SVGFEComponentTransferElement\"]" gTypeSVGFEComponentTransferElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFECompositeElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFECompositeElement Mozilla SVGFECompositeElement documentation>
newtype SVGFECompositeElement = SVGFECompositeElement { unSVGFECompositeElement :: JSRef }

instance Eq (SVGFECompositeElement) where
  (SVGFECompositeElement a) == (SVGFECompositeElement b) = js_eq a b

instance PToJSRef SVGFECompositeElement where
  pToJSRef = unSVGFECompositeElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFECompositeElement where
  pFromJSRef = SVGFECompositeElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFECompositeElement where
  toJSRef = return . unSVGFECompositeElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFECompositeElement where
  fromJSRef = return . fmap SVGFECompositeElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFECompositeElement
instance IsElement SVGFECompositeElement
instance IsNode SVGFECompositeElement
instance IsEventTarget SVGFECompositeElement
instance IsGObject SVGFECompositeElement where
  toGObject = GObject . unSVGFECompositeElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFECompositeElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFECompositeElement :: IsGObject obj => obj -> SVGFECompositeElement
castToSVGFECompositeElement = castTo gTypeSVGFECompositeElement "SVGFECompositeElement"

foreign import javascript unsafe "window[\"SVGFECompositeElement\"]" gTypeSVGFECompositeElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEConvolveMatrixElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEConvolveMatrixElement Mozilla SVGFEConvolveMatrixElement documentation>
newtype SVGFEConvolveMatrixElement = SVGFEConvolveMatrixElement { unSVGFEConvolveMatrixElement :: JSRef }

instance Eq (SVGFEConvolveMatrixElement) where
  (SVGFEConvolveMatrixElement a) == (SVGFEConvolveMatrixElement b) = js_eq a b

instance PToJSRef SVGFEConvolveMatrixElement where
  pToJSRef = unSVGFEConvolveMatrixElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEConvolveMatrixElement where
  pFromJSRef = SVGFEConvolveMatrixElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEConvolveMatrixElement where
  toJSRef = return . unSVGFEConvolveMatrixElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEConvolveMatrixElement where
  fromJSRef = return . fmap SVGFEConvolveMatrixElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFEConvolveMatrixElement
instance IsElement SVGFEConvolveMatrixElement
instance IsNode SVGFEConvolveMatrixElement
instance IsEventTarget SVGFEConvolveMatrixElement
instance IsGObject SVGFEConvolveMatrixElement where
  toGObject = GObject . unSVGFEConvolveMatrixElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEConvolveMatrixElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEConvolveMatrixElement :: IsGObject obj => obj -> SVGFEConvolveMatrixElement
castToSVGFEConvolveMatrixElement = castTo gTypeSVGFEConvolveMatrixElement "SVGFEConvolveMatrixElement"

foreign import javascript unsafe "window[\"SVGFEConvolveMatrixElement\"]" gTypeSVGFEConvolveMatrixElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEDiffuseLightingElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEDiffuseLightingElement Mozilla SVGFEDiffuseLightingElement documentation>
newtype SVGFEDiffuseLightingElement = SVGFEDiffuseLightingElement { unSVGFEDiffuseLightingElement :: JSRef }

instance Eq (SVGFEDiffuseLightingElement) where
  (SVGFEDiffuseLightingElement a) == (SVGFEDiffuseLightingElement b) = js_eq a b

instance PToJSRef SVGFEDiffuseLightingElement where
  pToJSRef = unSVGFEDiffuseLightingElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEDiffuseLightingElement where
  pFromJSRef = SVGFEDiffuseLightingElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEDiffuseLightingElement where
  toJSRef = return . unSVGFEDiffuseLightingElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEDiffuseLightingElement where
  fromJSRef = return . fmap SVGFEDiffuseLightingElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFEDiffuseLightingElement
instance IsElement SVGFEDiffuseLightingElement
instance IsNode SVGFEDiffuseLightingElement
instance IsEventTarget SVGFEDiffuseLightingElement
instance IsGObject SVGFEDiffuseLightingElement where
  toGObject = GObject . unSVGFEDiffuseLightingElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEDiffuseLightingElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEDiffuseLightingElement :: IsGObject obj => obj -> SVGFEDiffuseLightingElement
castToSVGFEDiffuseLightingElement = castTo gTypeSVGFEDiffuseLightingElement "SVGFEDiffuseLightingElement"

foreign import javascript unsafe "window[\"SVGFEDiffuseLightingElement\"]" gTypeSVGFEDiffuseLightingElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEDisplacementMapElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEDisplacementMapElement Mozilla SVGFEDisplacementMapElement documentation>
newtype SVGFEDisplacementMapElement = SVGFEDisplacementMapElement { unSVGFEDisplacementMapElement :: JSRef }

instance Eq (SVGFEDisplacementMapElement) where
  (SVGFEDisplacementMapElement a) == (SVGFEDisplacementMapElement b) = js_eq a b

instance PToJSRef SVGFEDisplacementMapElement where
  pToJSRef = unSVGFEDisplacementMapElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEDisplacementMapElement where
  pFromJSRef = SVGFEDisplacementMapElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEDisplacementMapElement where
  toJSRef = return . unSVGFEDisplacementMapElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEDisplacementMapElement where
  fromJSRef = return . fmap SVGFEDisplacementMapElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFEDisplacementMapElement
instance IsElement SVGFEDisplacementMapElement
instance IsNode SVGFEDisplacementMapElement
instance IsEventTarget SVGFEDisplacementMapElement
instance IsGObject SVGFEDisplacementMapElement where
  toGObject = GObject . unSVGFEDisplacementMapElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEDisplacementMapElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEDisplacementMapElement :: IsGObject obj => obj -> SVGFEDisplacementMapElement
castToSVGFEDisplacementMapElement = castTo gTypeSVGFEDisplacementMapElement "SVGFEDisplacementMapElement"

foreign import javascript unsafe "window[\"SVGFEDisplacementMapElement\"]" gTypeSVGFEDisplacementMapElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEDistantLightElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEDistantLightElement Mozilla SVGFEDistantLightElement documentation>
newtype SVGFEDistantLightElement = SVGFEDistantLightElement { unSVGFEDistantLightElement :: JSRef }

instance Eq (SVGFEDistantLightElement) where
  (SVGFEDistantLightElement a) == (SVGFEDistantLightElement b) = js_eq a b

instance PToJSRef SVGFEDistantLightElement where
  pToJSRef = unSVGFEDistantLightElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEDistantLightElement where
  pFromJSRef = SVGFEDistantLightElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEDistantLightElement where
  toJSRef = return . unSVGFEDistantLightElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEDistantLightElement where
  fromJSRef = return . fmap SVGFEDistantLightElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFEDistantLightElement
instance IsElement SVGFEDistantLightElement
instance IsNode SVGFEDistantLightElement
instance IsEventTarget SVGFEDistantLightElement
instance IsGObject SVGFEDistantLightElement where
  toGObject = GObject . unSVGFEDistantLightElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEDistantLightElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEDistantLightElement :: IsGObject obj => obj -> SVGFEDistantLightElement
castToSVGFEDistantLightElement = castTo gTypeSVGFEDistantLightElement "SVGFEDistantLightElement"

foreign import javascript unsafe "window[\"SVGFEDistantLightElement\"]" gTypeSVGFEDistantLightElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEDropShadowElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEDropShadowElement Mozilla SVGFEDropShadowElement documentation>
newtype SVGFEDropShadowElement = SVGFEDropShadowElement { unSVGFEDropShadowElement :: JSRef }

instance Eq (SVGFEDropShadowElement) where
  (SVGFEDropShadowElement a) == (SVGFEDropShadowElement b) = js_eq a b

instance PToJSRef SVGFEDropShadowElement where
  pToJSRef = unSVGFEDropShadowElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEDropShadowElement where
  pFromJSRef = SVGFEDropShadowElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEDropShadowElement where
  toJSRef = return . unSVGFEDropShadowElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEDropShadowElement where
  fromJSRef = return . fmap SVGFEDropShadowElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFEDropShadowElement
instance IsElement SVGFEDropShadowElement
instance IsNode SVGFEDropShadowElement
instance IsEventTarget SVGFEDropShadowElement
instance IsGObject SVGFEDropShadowElement where
  toGObject = GObject . unSVGFEDropShadowElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEDropShadowElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEDropShadowElement :: IsGObject obj => obj -> SVGFEDropShadowElement
castToSVGFEDropShadowElement = castTo gTypeSVGFEDropShadowElement "SVGFEDropShadowElement"

foreign import javascript unsafe "window[\"SVGFEDropShadowElement\"]" gTypeSVGFEDropShadowElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEFloodElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEFloodElement Mozilla SVGFEFloodElement documentation>
newtype SVGFEFloodElement = SVGFEFloodElement { unSVGFEFloodElement :: JSRef }

instance Eq (SVGFEFloodElement) where
  (SVGFEFloodElement a) == (SVGFEFloodElement b) = js_eq a b

instance PToJSRef SVGFEFloodElement where
  pToJSRef = unSVGFEFloodElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEFloodElement where
  pFromJSRef = SVGFEFloodElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEFloodElement where
  toJSRef = return . unSVGFEFloodElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEFloodElement where
  fromJSRef = return . fmap SVGFEFloodElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFEFloodElement
instance IsElement SVGFEFloodElement
instance IsNode SVGFEFloodElement
instance IsEventTarget SVGFEFloodElement
instance IsGObject SVGFEFloodElement where
  toGObject = GObject . unSVGFEFloodElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEFloodElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEFloodElement :: IsGObject obj => obj -> SVGFEFloodElement
castToSVGFEFloodElement = castTo gTypeSVGFEFloodElement "SVGFEFloodElement"

foreign import javascript unsafe "window[\"SVGFEFloodElement\"]" gTypeSVGFEFloodElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEFuncAElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGComponentTransferFunctionElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEFuncAElement Mozilla SVGFEFuncAElement documentation>
newtype SVGFEFuncAElement = SVGFEFuncAElement { unSVGFEFuncAElement :: JSRef }

instance Eq (SVGFEFuncAElement) where
  (SVGFEFuncAElement a) == (SVGFEFuncAElement b) = js_eq a b

instance PToJSRef SVGFEFuncAElement where
  pToJSRef = unSVGFEFuncAElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEFuncAElement where
  pFromJSRef = SVGFEFuncAElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEFuncAElement where
  toJSRef = return . unSVGFEFuncAElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEFuncAElement where
  fromJSRef = return . fmap SVGFEFuncAElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGComponentTransferFunctionElement SVGFEFuncAElement
instance IsSVGElement SVGFEFuncAElement
instance IsElement SVGFEFuncAElement
instance IsNode SVGFEFuncAElement
instance IsEventTarget SVGFEFuncAElement
instance IsGObject SVGFEFuncAElement where
  toGObject = GObject . unSVGFEFuncAElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEFuncAElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEFuncAElement :: IsGObject obj => obj -> SVGFEFuncAElement
castToSVGFEFuncAElement = castTo gTypeSVGFEFuncAElement "SVGFEFuncAElement"

foreign import javascript unsafe "window[\"SVGFEFuncAElement\"]" gTypeSVGFEFuncAElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEFuncBElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGComponentTransferFunctionElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEFuncBElement Mozilla SVGFEFuncBElement documentation>
newtype SVGFEFuncBElement = SVGFEFuncBElement { unSVGFEFuncBElement :: JSRef }

instance Eq (SVGFEFuncBElement) where
  (SVGFEFuncBElement a) == (SVGFEFuncBElement b) = js_eq a b

instance PToJSRef SVGFEFuncBElement where
  pToJSRef = unSVGFEFuncBElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEFuncBElement where
  pFromJSRef = SVGFEFuncBElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEFuncBElement where
  toJSRef = return . unSVGFEFuncBElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEFuncBElement where
  fromJSRef = return . fmap SVGFEFuncBElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGComponentTransferFunctionElement SVGFEFuncBElement
instance IsSVGElement SVGFEFuncBElement
instance IsElement SVGFEFuncBElement
instance IsNode SVGFEFuncBElement
instance IsEventTarget SVGFEFuncBElement
instance IsGObject SVGFEFuncBElement where
  toGObject = GObject . unSVGFEFuncBElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEFuncBElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEFuncBElement :: IsGObject obj => obj -> SVGFEFuncBElement
castToSVGFEFuncBElement = castTo gTypeSVGFEFuncBElement "SVGFEFuncBElement"

foreign import javascript unsafe "window[\"SVGFEFuncBElement\"]" gTypeSVGFEFuncBElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEFuncGElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGComponentTransferFunctionElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEFuncGElement Mozilla SVGFEFuncGElement documentation>
newtype SVGFEFuncGElement = SVGFEFuncGElement { unSVGFEFuncGElement :: JSRef }

instance Eq (SVGFEFuncGElement) where
  (SVGFEFuncGElement a) == (SVGFEFuncGElement b) = js_eq a b

instance PToJSRef SVGFEFuncGElement where
  pToJSRef = unSVGFEFuncGElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEFuncGElement where
  pFromJSRef = SVGFEFuncGElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEFuncGElement where
  toJSRef = return . unSVGFEFuncGElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEFuncGElement where
  fromJSRef = return . fmap SVGFEFuncGElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGComponentTransferFunctionElement SVGFEFuncGElement
instance IsSVGElement SVGFEFuncGElement
instance IsElement SVGFEFuncGElement
instance IsNode SVGFEFuncGElement
instance IsEventTarget SVGFEFuncGElement
instance IsGObject SVGFEFuncGElement where
  toGObject = GObject . unSVGFEFuncGElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEFuncGElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEFuncGElement :: IsGObject obj => obj -> SVGFEFuncGElement
castToSVGFEFuncGElement = castTo gTypeSVGFEFuncGElement "SVGFEFuncGElement"

foreign import javascript unsafe "window[\"SVGFEFuncGElement\"]" gTypeSVGFEFuncGElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEFuncRElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGComponentTransferFunctionElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEFuncRElement Mozilla SVGFEFuncRElement documentation>
newtype SVGFEFuncRElement = SVGFEFuncRElement { unSVGFEFuncRElement :: JSRef }

instance Eq (SVGFEFuncRElement) where
  (SVGFEFuncRElement a) == (SVGFEFuncRElement b) = js_eq a b

instance PToJSRef SVGFEFuncRElement where
  pToJSRef = unSVGFEFuncRElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEFuncRElement where
  pFromJSRef = SVGFEFuncRElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEFuncRElement where
  toJSRef = return . unSVGFEFuncRElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEFuncRElement where
  fromJSRef = return . fmap SVGFEFuncRElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGComponentTransferFunctionElement SVGFEFuncRElement
instance IsSVGElement SVGFEFuncRElement
instance IsElement SVGFEFuncRElement
instance IsNode SVGFEFuncRElement
instance IsEventTarget SVGFEFuncRElement
instance IsGObject SVGFEFuncRElement where
  toGObject = GObject . unSVGFEFuncRElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEFuncRElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEFuncRElement :: IsGObject obj => obj -> SVGFEFuncRElement
castToSVGFEFuncRElement = castTo gTypeSVGFEFuncRElement "SVGFEFuncRElement"

foreign import javascript unsafe "window[\"SVGFEFuncRElement\"]" gTypeSVGFEFuncRElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEGaussianBlurElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEGaussianBlurElement Mozilla SVGFEGaussianBlurElement documentation>
newtype SVGFEGaussianBlurElement = SVGFEGaussianBlurElement { unSVGFEGaussianBlurElement :: JSRef }

instance Eq (SVGFEGaussianBlurElement) where
  (SVGFEGaussianBlurElement a) == (SVGFEGaussianBlurElement b) = js_eq a b

instance PToJSRef SVGFEGaussianBlurElement where
  pToJSRef = unSVGFEGaussianBlurElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEGaussianBlurElement where
  pFromJSRef = SVGFEGaussianBlurElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEGaussianBlurElement where
  toJSRef = return . unSVGFEGaussianBlurElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEGaussianBlurElement where
  fromJSRef = return . fmap SVGFEGaussianBlurElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFEGaussianBlurElement
instance IsElement SVGFEGaussianBlurElement
instance IsNode SVGFEGaussianBlurElement
instance IsEventTarget SVGFEGaussianBlurElement
instance IsGObject SVGFEGaussianBlurElement where
  toGObject = GObject . unSVGFEGaussianBlurElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEGaussianBlurElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEGaussianBlurElement :: IsGObject obj => obj -> SVGFEGaussianBlurElement
castToSVGFEGaussianBlurElement = castTo gTypeSVGFEGaussianBlurElement "SVGFEGaussianBlurElement"

foreign import javascript unsafe "window[\"SVGFEGaussianBlurElement\"]" gTypeSVGFEGaussianBlurElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEImageElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEImageElement Mozilla SVGFEImageElement documentation>
newtype SVGFEImageElement = SVGFEImageElement { unSVGFEImageElement :: JSRef }

instance Eq (SVGFEImageElement) where
  (SVGFEImageElement a) == (SVGFEImageElement b) = js_eq a b

instance PToJSRef SVGFEImageElement where
  pToJSRef = unSVGFEImageElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEImageElement where
  pFromJSRef = SVGFEImageElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEImageElement where
  toJSRef = return . unSVGFEImageElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEImageElement where
  fromJSRef = return . fmap SVGFEImageElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFEImageElement
instance IsElement SVGFEImageElement
instance IsNode SVGFEImageElement
instance IsEventTarget SVGFEImageElement
instance IsGObject SVGFEImageElement where
  toGObject = GObject . unSVGFEImageElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEImageElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEImageElement :: IsGObject obj => obj -> SVGFEImageElement
castToSVGFEImageElement = castTo gTypeSVGFEImageElement "SVGFEImageElement"

foreign import javascript unsafe "window[\"SVGFEImageElement\"]" gTypeSVGFEImageElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEMergeElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEMergeElement Mozilla SVGFEMergeElement documentation>
newtype SVGFEMergeElement = SVGFEMergeElement { unSVGFEMergeElement :: JSRef }

instance Eq (SVGFEMergeElement) where
  (SVGFEMergeElement a) == (SVGFEMergeElement b) = js_eq a b

instance PToJSRef SVGFEMergeElement where
  pToJSRef = unSVGFEMergeElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEMergeElement where
  pFromJSRef = SVGFEMergeElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEMergeElement where
  toJSRef = return . unSVGFEMergeElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEMergeElement where
  fromJSRef = return . fmap SVGFEMergeElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFEMergeElement
instance IsElement SVGFEMergeElement
instance IsNode SVGFEMergeElement
instance IsEventTarget SVGFEMergeElement
instance IsGObject SVGFEMergeElement where
  toGObject = GObject . unSVGFEMergeElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEMergeElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEMergeElement :: IsGObject obj => obj -> SVGFEMergeElement
castToSVGFEMergeElement = castTo gTypeSVGFEMergeElement "SVGFEMergeElement"

foreign import javascript unsafe "window[\"SVGFEMergeElement\"]" gTypeSVGFEMergeElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEMergeNodeElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEMergeNodeElement Mozilla SVGFEMergeNodeElement documentation>
newtype SVGFEMergeNodeElement = SVGFEMergeNodeElement { unSVGFEMergeNodeElement :: JSRef }

instance Eq (SVGFEMergeNodeElement) where
  (SVGFEMergeNodeElement a) == (SVGFEMergeNodeElement b) = js_eq a b

instance PToJSRef SVGFEMergeNodeElement where
  pToJSRef = unSVGFEMergeNodeElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEMergeNodeElement where
  pFromJSRef = SVGFEMergeNodeElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEMergeNodeElement where
  toJSRef = return . unSVGFEMergeNodeElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEMergeNodeElement where
  fromJSRef = return . fmap SVGFEMergeNodeElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFEMergeNodeElement
instance IsElement SVGFEMergeNodeElement
instance IsNode SVGFEMergeNodeElement
instance IsEventTarget SVGFEMergeNodeElement
instance IsGObject SVGFEMergeNodeElement where
  toGObject = GObject . unSVGFEMergeNodeElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEMergeNodeElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEMergeNodeElement :: IsGObject obj => obj -> SVGFEMergeNodeElement
castToSVGFEMergeNodeElement = castTo gTypeSVGFEMergeNodeElement "SVGFEMergeNodeElement"

foreign import javascript unsafe "window[\"SVGFEMergeNodeElement\"]" gTypeSVGFEMergeNodeElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEMorphologyElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEMorphologyElement Mozilla SVGFEMorphologyElement documentation>
newtype SVGFEMorphologyElement = SVGFEMorphologyElement { unSVGFEMorphologyElement :: JSRef }

instance Eq (SVGFEMorphologyElement) where
  (SVGFEMorphologyElement a) == (SVGFEMorphologyElement b) = js_eq a b

instance PToJSRef SVGFEMorphologyElement where
  pToJSRef = unSVGFEMorphologyElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEMorphologyElement where
  pFromJSRef = SVGFEMorphologyElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEMorphologyElement where
  toJSRef = return . unSVGFEMorphologyElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEMorphologyElement where
  fromJSRef = return . fmap SVGFEMorphologyElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFEMorphologyElement
instance IsElement SVGFEMorphologyElement
instance IsNode SVGFEMorphologyElement
instance IsEventTarget SVGFEMorphologyElement
instance IsGObject SVGFEMorphologyElement where
  toGObject = GObject . unSVGFEMorphologyElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEMorphologyElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEMorphologyElement :: IsGObject obj => obj -> SVGFEMorphologyElement
castToSVGFEMorphologyElement = castTo gTypeSVGFEMorphologyElement "SVGFEMorphologyElement"

foreign import javascript unsafe "window[\"SVGFEMorphologyElement\"]" gTypeSVGFEMorphologyElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEOffsetElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEOffsetElement Mozilla SVGFEOffsetElement documentation>
newtype SVGFEOffsetElement = SVGFEOffsetElement { unSVGFEOffsetElement :: JSRef }

instance Eq (SVGFEOffsetElement) where
  (SVGFEOffsetElement a) == (SVGFEOffsetElement b) = js_eq a b

instance PToJSRef SVGFEOffsetElement where
  pToJSRef = unSVGFEOffsetElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEOffsetElement where
  pFromJSRef = SVGFEOffsetElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEOffsetElement where
  toJSRef = return . unSVGFEOffsetElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEOffsetElement where
  fromJSRef = return . fmap SVGFEOffsetElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFEOffsetElement
instance IsElement SVGFEOffsetElement
instance IsNode SVGFEOffsetElement
instance IsEventTarget SVGFEOffsetElement
instance IsGObject SVGFEOffsetElement where
  toGObject = GObject . unSVGFEOffsetElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEOffsetElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEOffsetElement :: IsGObject obj => obj -> SVGFEOffsetElement
castToSVGFEOffsetElement = castTo gTypeSVGFEOffsetElement "SVGFEOffsetElement"

foreign import javascript unsafe "window[\"SVGFEOffsetElement\"]" gTypeSVGFEOffsetElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFEPointLightElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFEPointLightElement Mozilla SVGFEPointLightElement documentation>
newtype SVGFEPointLightElement = SVGFEPointLightElement { unSVGFEPointLightElement :: JSRef }

instance Eq (SVGFEPointLightElement) where
  (SVGFEPointLightElement a) == (SVGFEPointLightElement b) = js_eq a b

instance PToJSRef SVGFEPointLightElement where
  pToJSRef = unSVGFEPointLightElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFEPointLightElement where
  pFromJSRef = SVGFEPointLightElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFEPointLightElement where
  toJSRef = return . unSVGFEPointLightElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFEPointLightElement where
  fromJSRef = return . fmap SVGFEPointLightElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFEPointLightElement
instance IsElement SVGFEPointLightElement
instance IsNode SVGFEPointLightElement
instance IsEventTarget SVGFEPointLightElement
instance IsGObject SVGFEPointLightElement where
  toGObject = GObject . unSVGFEPointLightElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFEPointLightElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFEPointLightElement :: IsGObject obj => obj -> SVGFEPointLightElement
castToSVGFEPointLightElement = castTo gTypeSVGFEPointLightElement "SVGFEPointLightElement"

foreign import javascript unsafe "window[\"SVGFEPointLightElement\"]" gTypeSVGFEPointLightElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFESpecularLightingElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFESpecularLightingElement Mozilla SVGFESpecularLightingElement documentation>
newtype SVGFESpecularLightingElement = SVGFESpecularLightingElement { unSVGFESpecularLightingElement :: JSRef }

instance Eq (SVGFESpecularLightingElement) where
  (SVGFESpecularLightingElement a) == (SVGFESpecularLightingElement b) = js_eq a b

instance PToJSRef SVGFESpecularLightingElement where
  pToJSRef = unSVGFESpecularLightingElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFESpecularLightingElement where
  pFromJSRef = SVGFESpecularLightingElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFESpecularLightingElement where
  toJSRef = return . unSVGFESpecularLightingElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFESpecularLightingElement where
  fromJSRef = return . fmap SVGFESpecularLightingElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFESpecularLightingElement
instance IsElement SVGFESpecularLightingElement
instance IsNode SVGFESpecularLightingElement
instance IsEventTarget SVGFESpecularLightingElement
instance IsGObject SVGFESpecularLightingElement where
  toGObject = GObject . unSVGFESpecularLightingElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFESpecularLightingElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFESpecularLightingElement :: IsGObject obj => obj -> SVGFESpecularLightingElement
castToSVGFESpecularLightingElement = castTo gTypeSVGFESpecularLightingElement "SVGFESpecularLightingElement"

foreign import javascript unsafe "window[\"SVGFESpecularLightingElement\"]" gTypeSVGFESpecularLightingElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFESpotLightElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFESpotLightElement Mozilla SVGFESpotLightElement documentation>
newtype SVGFESpotLightElement = SVGFESpotLightElement { unSVGFESpotLightElement :: JSRef }

instance Eq (SVGFESpotLightElement) where
  (SVGFESpotLightElement a) == (SVGFESpotLightElement b) = js_eq a b

instance PToJSRef SVGFESpotLightElement where
  pToJSRef = unSVGFESpotLightElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFESpotLightElement where
  pFromJSRef = SVGFESpotLightElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFESpotLightElement where
  toJSRef = return . unSVGFESpotLightElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFESpotLightElement where
  fromJSRef = return . fmap SVGFESpotLightElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFESpotLightElement
instance IsElement SVGFESpotLightElement
instance IsNode SVGFESpotLightElement
instance IsEventTarget SVGFESpotLightElement
instance IsGObject SVGFESpotLightElement where
  toGObject = GObject . unSVGFESpotLightElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFESpotLightElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFESpotLightElement :: IsGObject obj => obj -> SVGFESpotLightElement
castToSVGFESpotLightElement = castTo gTypeSVGFESpotLightElement "SVGFESpotLightElement"

foreign import javascript unsafe "window[\"SVGFESpotLightElement\"]" gTypeSVGFESpotLightElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFETileElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFETileElement Mozilla SVGFETileElement documentation>
newtype SVGFETileElement = SVGFETileElement { unSVGFETileElement :: JSRef }

instance Eq (SVGFETileElement) where
  (SVGFETileElement a) == (SVGFETileElement b) = js_eq a b

instance PToJSRef SVGFETileElement where
  pToJSRef = unSVGFETileElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFETileElement where
  pFromJSRef = SVGFETileElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFETileElement where
  toJSRef = return . unSVGFETileElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFETileElement where
  fromJSRef = return . fmap SVGFETileElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFETileElement
instance IsElement SVGFETileElement
instance IsNode SVGFETileElement
instance IsEventTarget SVGFETileElement
instance IsGObject SVGFETileElement where
  toGObject = GObject . unSVGFETileElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFETileElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFETileElement :: IsGObject obj => obj -> SVGFETileElement
castToSVGFETileElement = castTo gTypeSVGFETileElement "SVGFETileElement"

foreign import javascript unsafe "window[\"SVGFETileElement\"]" gTypeSVGFETileElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFETurbulenceElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFETurbulenceElement Mozilla SVGFETurbulenceElement documentation>
newtype SVGFETurbulenceElement = SVGFETurbulenceElement { unSVGFETurbulenceElement :: JSRef }

instance Eq (SVGFETurbulenceElement) where
  (SVGFETurbulenceElement a) == (SVGFETurbulenceElement b) = js_eq a b

instance PToJSRef SVGFETurbulenceElement where
  pToJSRef = unSVGFETurbulenceElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFETurbulenceElement where
  pFromJSRef = SVGFETurbulenceElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFETurbulenceElement where
  toJSRef = return . unSVGFETurbulenceElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFETurbulenceElement where
  fromJSRef = return . fmap SVGFETurbulenceElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFETurbulenceElement
instance IsElement SVGFETurbulenceElement
instance IsNode SVGFETurbulenceElement
instance IsEventTarget SVGFETurbulenceElement
instance IsGObject SVGFETurbulenceElement where
  toGObject = GObject . unSVGFETurbulenceElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFETurbulenceElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFETurbulenceElement :: IsGObject obj => obj -> SVGFETurbulenceElement
castToSVGFETurbulenceElement = castTo gTypeSVGFETurbulenceElement "SVGFETurbulenceElement"

foreign import javascript unsafe "window[\"SVGFETurbulenceElement\"]" gTypeSVGFETurbulenceElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFilterElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFilterElement Mozilla SVGFilterElement documentation>
newtype SVGFilterElement = SVGFilterElement { unSVGFilterElement :: JSRef }

instance Eq (SVGFilterElement) where
  (SVGFilterElement a) == (SVGFilterElement b) = js_eq a b

instance PToJSRef SVGFilterElement where
  pToJSRef = unSVGFilterElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFilterElement where
  pFromJSRef = SVGFilterElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFilterElement where
  toJSRef = return . unSVGFilterElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFilterElement where
  fromJSRef = return . fmap SVGFilterElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFilterElement
instance IsElement SVGFilterElement
instance IsNode SVGFilterElement
instance IsEventTarget SVGFilterElement
instance IsGObject SVGFilterElement where
  toGObject = GObject . unSVGFilterElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFilterElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFilterElement :: IsGObject obj => obj -> SVGFilterElement
castToSVGFilterElement = castTo gTypeSVGFilterElement "SVGFilterElement"

foreign import javascript unsafe "window[\"SVGFilterElement\"]" gTypeSVGFilterElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFilterPrimitiveStandardAttributes".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFilterPrimitiveStandardAttributes Mozilla SVGFilterPrimitiveStandardAttributes documentation>
newtype SVGFilterPrimitiveStandardAttributes = SVGFilterPrimitiveStandardAttributes { unSVGFilterPrimitiveStandardAttributes :: JSRef }

instance Eq (SVGFilterPrimitiveStandardAttributes) where
  (SVGFilterPrimitiveStandardAttributes a) == (SVGFilterPrimitiveStandardAttributes b) = js_eq a b

instance PToJSRef SVGFilterPrimitiveStandardAttributes where
  pToJSRef = unSVGFilterPrimitiveStandardAttributes
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFilterPrimitiveStandardAttributes where
  pFromJSRef = SVGFilterPrimitiveStandardAttributes
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFilterPrimitiveStandardAttributes where
  toJSRef = return . unSVGFilterPrimitiveStandardAttributes
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFilterPrimitiveStandardAttributes where
  fromJSRef = return . fmap SVGFilterPrimitiveStandardAttributes . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGFilterPrimitiveStandardAttributes where
  toGObject = GObject . unSVGFilterPrimitiveStandardAttributes
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFilterPrimitiveStandardAttributes . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFilterPrimitiveStandardAttributes :: IsGObject obj => obj -> SVGFilterPrimitiveStandardAttributes
castToSVGFilterPrimitiveStandardAttributes = castTo gTypeSVGFilterPrimitiveStandardAttributes "SVGFilterPrimitiveStandardAttributes"

foreign import javascript unsafe "window[\"SVGFilterPrimitiveStandardAttributes\"]" gTypeSVGFilterPrimitiveStandardAttributes :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFitToViewBox".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFitToViewBox Mozilla SVGFitToViewBox documentation>
newtype SVGFitToViewBox = SVGFitToViewBox { unSVGFitToViewBox :: JSRef }

instance Eq (SVGFitToViewBox) where
  (SVGFitToViewBox a) == (SVGFitToViewBox b) = js_eq a b

instance PToJSRef SVGFitToViewBox where
  pToJSRef = unSVGFitToViewBox
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFitToViewBox where
  pFromJSRef = SVGFitToViewBox
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFitToViewBox where
  toJSRef = return . unSVGFitToViewBox
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFitToViewBox where
  fromJSRef = return . fmap SVGFitToViewBox . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGFitToViewBox where
  toGObject = GObject . unSVGFitToViewBox
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFitToViewBox . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFitToViewBox :: IsGObject obj => obj -> SVGFitToViewBox
castToSVGFitToViewBox = castTo gTypeSVGFitToViewBox "SVGFitToViewBox"

foreign import javascript unsafe "window[\"SVGFitToViewBox\"]" gTypeSVGFitToViewBox :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFontElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFontElement Mozilla SVGFontElement documentation>
newtype SVGFontElement = SVGFontElement { unSVGFontElement :: JSRef }

instance Eq (SVGFontElement) where
  (SVGFontElement a) == (SVGFontElement b) = js_eq a b

instance PToJSRef SVGFontElement where
  pToJSRef = unSVGFontElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFontElement where
  pFromJSRef = SVGFontElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFontElement where
  toJSRef = return . unSVGFontElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFontElement where
  fromJSRef = return . fmap SVGFontElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFontElement
instance IsElement SVGFontElement
instance IsNode SVGFontElement
instance IsEventTarget SVGFontElement
instance IsGObject SVGFontElement where
  toGObject = GObject . unSVGFontElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFontElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFontElement :: IsGObject obj => obj -> SVGFontElement
castToSVGFontElement = castTo gTypeSVGFontElement "SVGFontElement"

foreign import javascript unsafe "window[\"SVGFontElement\"]" gTypeSVGFontElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFontFaceElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFontFaceElement Mozilla SVGFontFaceElement documentation>
newtype SVGFontFaceElement = SVGFontFaceElement { unSVGFontFaceElement :: JSRef }

instance Eq (SVGFontFaceElement) where
  (SVGFontFaceElement a) == (SVGFontFaceElement b) = js_eq a b

instance PToJSRef SVGFontFaceElement where
  pToJSRef = unSVGFontFaceElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFontFaceElement where
  pFromJSRef = SVGFontFaceElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFontFaceElement where
  toJSRef = return . unSVGFontFaceElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFontFaceElement where
  fromJSRef = return . fmap SVGFontFaceElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFontFaceElement
instance IsElement SVGFontFaceElement
instance IsNode SVGFontFaceElement
instance IsEventTarget SVGFontFaceElement
instance IsGObject SVGFontFaceElement where
  toGObject = GObject . unSVGFontFaceElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFontFaceElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFontFaceElement :: IsGObject obj => obj -> SVGFontFaceElement
castToSVGFontFaceElement = castTo gTypeSVGFontFaceElement "SVGFontFaceElement"

foreign import javascript unsafe "window[\"SVGFontFaceElement\"]" gTypeSVGFontFaceElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFontFaceFormatElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFontFaceFormatElement Mozilla SVGFontFaceFormatElement documentation>
newtype SVGFontFaceFormatElement = SVGFontFaceFormatElement { unSVGFontFaceFormatElement :: JSRef }

instance Eq (SVGFontFaceFormatElement) where
  (SVGFontFaceFormatElement a) == (SVGFontFaceFormatElement b) = js_eq a b

instance PToJSRef SVGFontFaceFormatElement where
  pToJSRef = unSVGFontFaceFormatElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFontFaceFormatElement where
  pFromJSRef = SVGFontFaceFormatElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFontFaceFormatElement where
  toJSRef = return . unSVGFontFaceFormatElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFontFaceFormatElement where
  fromJSRef = return . fmap SVGFontFaceFormatElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFontFaceFormatElement
instance IsElement SVGFontFaceFormatElement
instance IsNode SVGFontFaceFormatElement
instance IsEventTarget SVGFontFaceFormatElement
instance IsGObject SVGFontFaceFormatElement where
  toGObject = GObject . unSVGFontFaceFormatElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFontFaceFormatElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFontFaceFormatElement :: IsGObject obj => obj -> SVGFontFaceFormatElement
castToSVGFontFaceFormatElement = castTo gTypeSVGFontFaceFormatElement "SVGFontFaceFormatElement"

foreign import javascript unsafe "window[\"SVGFontFaceFormatElement\"]" gTypeSVGFontFaceFormatElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFontFaceNameElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFontFaceNameElement Mozilla SVGFontFaceNameElement documentation>
newtype SVGFontFaceNameElement = SVGFontFaceNameElement { unSVGFontFaceNameElement :: JSRef }

instance Eq (SVGFontFaceNameElement) where
  (SVGFontFaceNameElement a) == (SVGFontFaceNameElement b) = js_eq a b

instance PToJSRef SVGFontFaceNameElement where
  pToJSRef = unSVGFontFaceNameElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFontFaceNameElement where
  pFromJSRef = SVGFontFaceNameElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFontFaceNameElement where
  toJSRef = return . unSVGFontFaceNameElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFontFaceNameElement where
  fromJSRef = return . fmap SVGFontFaceNameElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFontFaceNameElement
instance IsElement SVGFontFaceNameElement
instance IsNode SVGFontFaceNameElement
instance IsEventTarget SVGFontFaceNameElement
instance IsGObject SVGFontFaceNameElement where
  toGObject = GObject . unSVGFontFaceNameElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFontFaceNameElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFontFaceNameElement :: IsGObject obj => obj -> SVGFontFaceNameElement
castToSVGFontFaceNameElement = castTo gTypeSVGFontFaceNameElement "SVGFontFaceNameElement"

foreign import javascript unsafe "window[\"SVGFontFaceNameElement\"]" gTypeSVGFontFaceNameElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFontFaceSrcElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFontFaceSrcElement Mozilla SVGFontFaceSrcElement documentation>
newtype SVGFontFaceSrcElement = SVGFontFaceSrcElement { unSVGFontFaceSrcElement :: JSRef }

instance Eq (SVGFontFaceSrcElement) where
  (SVGFontFaceSrcElement a) == (SVGFontFaceSrcElement b) = js_eq a b

instance PToJSRef SVGFontFaceSrcElement where
  pToJSRef = unSVGFontFaceSrcElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFontFaceSrcElement where
  pFromJSRef = SVGFontFaceSrcElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFontFaceSrcElement where
  toJSRef = return . unSVGFontFaceSrcElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFontFaceSrcElement where
  fromJSRef = return . fmap SVGFontFaceSrcElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFontFaceSrcElement
instance IsElement SVGFontFaceSrcElement
instance IsNode SVGFontFaceSrcElement
instance IsEventTarget SVGFontFaceSrcElement
instance IsGObject SVGFontFaceSrcElement where
  toGObject = GObject . unSVGFontFaceSrcElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFontFaceSrcElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFontFaceSrcElement :: IsGObject obj => obj -> SVGFontFaceSrcElement
castToSVGFontFaceSrcElement = castTo gTypeSVGFontFaceSrcElement "SVGFontFaceSrcElement"

foreign import javascript unsafe "window[\"SVGFontFaceSrcElement\"]" gTypeSVGFontFaceSrcElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGFontFaceUriElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGFontFaceUriElement Mozilla SVGFontFaceUriElement documentation>
newtype SVGFontFaceUriElement = SVGFontFaceUriElement { unSVGFontFaceUriElement :: JSRef }

instance Eq (SVGFontFaceUriElement) where
  (SVGFontFaceUriElement a) == (SVGFontFaceUriElement b) = js_eq a b

instance PToJSRef SVGFontFaceUriElement where
  pToJSRef = unSVGFontFaceUriElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGFontFaceUriElement where
  pFromJSRef = SVGFontFaceUriElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGFontFaceUriElement where
  toJSRef = return . unSVGFontFaceUriElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGFontFaceUriElement where
  fromJSRef = return . fmap SVGFontFaceUriElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGFontFaceUriElement
instance IsElement SVGFontFaceUriElement
instance IsNode SVGFontFaceUriElement
instance IsEventTarget SVGFontFaceUriElement
instance IsGObject SVGFontFaceUriElement where
  toGObject = GObject . unSVGFontFaceUriElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGFontFaceUriElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGFontFaceUriElement :: IsGObject obj => obj -> SVGFontFaceUriElement
castToSVGFontFaceUriElement = castTo gTypeSVGFontFaceUriElement "SVGFontFaceUriElement"

foreign import javascript unsafe "window[\"SVGFontFaceUriElement\"]" gTypeSVGFontFaceUriElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGForeignObjectElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGForeignObjectElement Mozilla SVGForeignObjectElement documentation>
newtype SVGForeignObjectElement = SVGForeignObjectElement { unSVGForeignObjectElement :: JSRef }

instance Eq (SVGForeignObjectElement) where
  (SVGForeignObjectElement a) == (SVGForeignObjectElement b) = js_eq a b

instance PToJSRef SVGForeignObjectElement where
  pToJSRef = unSVGForeignObjectElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGForeignObjectElement where
  pFromJSRef = SVGForeignObjectElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGForeignObjectElement where
  toJSRef = return . unSVGForeignObjectElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGForeignObjectElement where
  fromJSRef = return . fmap SVGForeignObjectElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGraphicsElement SVGForeignObjectElement
instance IsSVGElement SVGForeignObjectElement
instance IsElement SVGForeignObjectElement
instance IsNode SVGForeignObjectElement
instance IsEventTarget SVGForeignObjectElement
instance IsGObject SVGForeignObjectElement where
  toGObject = GObject . unSVGForeignObjectElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGForeignObjectElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGForeignObjectElement :: IsGObject obj => obj -> SVGForeignObjectElement
castToSVGForeignObjectElement = castTo gTypeSVGForeignObjectElement "SVGForeignObjectElement"

foreign import javascript unsafe "window[\"SVGForeignObjectElement\"]" gTypeSVGForeignObjectElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGGElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGGElement Mozilla SVGGElement documentation>
newtype SVGGElement = SVGGElement { unSVGGElement :: JSRef }

instance Eq (SVGGElement) where
  (SVGGElement a) == (SVGGElement b) = js_eq a b

instance PToJSRef SVGGElement where
  pToJSRef = unSVGGElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGGElement where
  pFromJSRef = SVGGElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGGElement where
  toJSRef = return . unSVGGElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGGElement where
  fromJSRef = return . fmap SVGGElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGraphicsElement SVGGElement
instance IsSVGElement SVGGElement
instance IsElement SVGGElement
instance IsNode SVGGElement
instance IsEventTarget SVGGElement
instance IsGObject SVGGElement where
  toGObject = GObject . unSVGGElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGGElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGGElement :: IsGObject obj => obj -> SVGGElement
castToSVGGElement = castTo gTypeSVGGElement "SVGGElement"

foreign import javascript unsafe "window[\"SVGGElement\"]" gTypeSVGGElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGGlyphElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGGlyphElement Mozilla SVGGlyphElement documentation>
newtype SVGGlyphElement = SVGGlyphElement { unSVGGlyphElement :: JSRef }

instance Eq (SVGGlyphElement) where
  (SVGGlyphElement a) == (SVGGlyphElement b) = js_eq a b

instance PToJSRef SVGGlyphElement where
  pToJSRef = unSVGGlyphElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGGlyphElement where
  pFromJSRef = SVGGlyphElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGGlyphElement where
  toJSRef = return . unSVGGlyphElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGGlyphElement where
  fromJSRef = return . fmap SVGGlyphElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGGlyphElement
instance IsElement SVGGlyphElement
instance IsNode SVGGlyphElement
instance IsEventTarget SVGGlyphElement
instance IsGObject SVGGlyphElement where
  toGObject = GObject . unSVGGlyphElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGGlyphElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGGlyphElement :: IsGObject obj => obj -> SVGGlyphElement
castToSVGGlyphElement = castTo gTypeSVGGlyphElement "SVGGlyphElement"

foreign import javascript unsafe "window[\"SVGGlyphElement\"]" gTypeSVGGlyphElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGGlyphRefElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGGlyphRefElement Mozilla SVGGlyphRefElement documentation>
newtype SVGGlyphRefElement = SVGGlyphRefElement { unSVGGlyphRefElement :: JSRef }

instance Eq (SVGGlyphRefElement) where
  (SVGGlyphRefElement a) == (SVGGlyphRefElement b) = js_eq a b

instance PToJSRef SVGGlyphRefElement where
  pToJSRef = unSVGGlyphRefElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGGlyphRefElement where
  pFromJSRef = SVGGlyphRefElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGGlyphRefElement where
  toJSRef = return . unSVGGlyphRefElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGGlyphRefElement where
  fromJSRef = return . fmap SVGGlyphRefElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGGlyphRefElement
instance IsElement SVGGlyphRefElement
instance IsNode SVGGlyphRefElement
instance IsEventTarget SVGGlyphRefElement
instance IsGObject SVGGlyphRefElement where
  toGObject = GObject . unSVGGlyphRefElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGGlyphRefElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGGlyphRefElement :: IsGObject obj => obj -> SVGGlyphRefElement
castToSVGGlyphRefElement = castTo gTypeSVGGlyphRefElement "SVGGlyphRefElement"

foreign import javascript unsafe "window[\"SVGGlyphRefElement\"]" gTypeSVGGlyphRefElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGGradientElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGGradientElement Mozilla SVGGradientElement documentation>
newtype SVGGradientElement = SVGGradientElement { unSVGGradientElement :: JSRef }

instance Eq (SVGGradientElement) where
  (SVGGradientElement a) == (SVGGradientElement b) = js_eq a b

instance PToJSRef SVGGradientElement where
  pToJSRef = unSVGGradientElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGGradientElement where
  pFromJSRef = SVGGradientElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGGradientElement where
  toJSRef = return . unSVGGradientElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGGradientElement where
  fromJSRef = return . fmap SVGGradientElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsSVGElement o => IsSVGGradientElement o
toSVGGradientElement :: IsSVGGradientElement o => o -> SVGGradientElement
toSVGGradientElement = unsafeCastGObject . toGObject

instance IsSVGGradientElement SVGGradientElement
instance IsSVGElement SVGGradientElement
instance IsElement SVGGradientElement
instance IsNode SVGGradientElement
instance IsEventTarget SVGGradientElement
instance IsGObject SVGGradientElement where
  toGObject = GObject . unSVGGradientElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGGradientElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGGradientElement :: IsGObject obj => obj -> SVGGradientElement
castToSVGGradientElement = castTo gTypeSVGGradientElement "SVGGradientElement"

foreign import javascript unsafe "window[\"SVGGradientElement\"]" gTypeSVGGradientElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGGraphicsElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGGraphicsElement Mozilla SVGGraphicsElement documentation>
newtype SVGGraphicsElement = SVGGraphicsElement { unSVGGraphicsElement :: JSRef }

instance Eq (SVGGraphicsElement) where
  (SVGGraphicsElement a) == (SVGGraphicsElement b) = js_eq a b

instance PToJSRef SVGGraphicsElement where
  pToJSRef = unSVGGraphicsElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGGraphicsElement where
  pFromJSRef = SVGGraphicsElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGGraphicsElement where
  toJSRef = return . unSVGGraphicsElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGGraphicsElement where
  fromJSRef = return . fmap SVGGraphicsElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsSVGElement o => IsSVGGraphicsElement o
toSVGGraphicsElement :: IsSVGGraphicsElement o => o -> SVGGraphicsElement
toSVGGraphicsElement = unsafeCastGObject . toGObject

instance IsSVGGraphicsElement SVGGraphicsElement
instance IsSVGElement SVGGraphicsElement
instance IsElement SVGGraphicsElement
instance IsNode SVGGraphicsElement
instance IsEventTarget SVGGraphicsElement
instance IsGObject SVGGraphicsElement where
  toGObject = GObject . unSVGGraphicsElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGGraphicsElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGGraphicsElement :: IsGObject obj => obj -> SVGGraphicsElement
castToSVGGraphicsElement = castTo gTypeSVGGraphicsElement "SVGGraphicsElement"

foreign import javascript unsafe "window[\"SVGGraphicsElement\"]" gTypeSVGGraphicsElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGHKernElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGHKernElement Mozilla SVGHKernElement documentation>
newtype SVGHKernElement = SVGHKernElement { unSVGHKernElement :: JSRef }

instance Eq (SVGHKernElement) where
  (SVGHKernElement a) == (SVGHKernElement b) = js_eq a b

instance PToJSRef SVGHKernElement where
  pToJSRef = unSVGHKernElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGHKernElement where
  pFromJSRef = SVGHKernElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGHKernElement where
  toJSRef = return . unSVGHKernElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGHKernElement where
  fromJSRef = return . fmap SVGHKernElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGHKernElement
instance IsElement SVGHKernElement
instance IsNode SVGHKernElement
instance IsEventTarget SVGHKernElement
instance IsGObject SVGHKernElement where
  toGObject = GObject . unSVGHKernElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGHKernElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGHKernElement :: IsGObject obj => obj -> SVGHKernElement
castToSVGHKernElement = castTo gTypeSVGHKernElement "SVGHKernElement"

foreign import javascript unsafe "window[\"SVGHKernElement\"]" gTypeSVGHKernElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGImageElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGImageElement Mozilla SVGImageElement documentation>
newtype SVGImageElement = SVGImageElement { unSVGImageElement :: JSRef }

instance Eq (SVGImageElement) where
  (SVGImageElement a) == (SVGImageElement b) = js_eq a b

instance PToJSRef SVGImageElement where
  pToJSRef = unSVGImageElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGImageElement where
  pFromJSRef = SVGImageElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGImageElement where
  toJSRef = return . unSVGImageElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGImageElement where
  fromJSRef = return . fmap SVGImageElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGraphicsElement SVGImageElement
instance IsSVGElement SVGImageElement
instance IsElement SVGImageElement
instance IsNode SVGImageElement
instance IsEventTarget SVGImageElement
instance IsGObject SVGImageElement where
  toGObject = GObject . unSVGImageElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGImageElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGImageElement :: IsGObject obj => obj -> SVGImageElement
castToSVGImageElement = castTo gTypeSVGImageElement "SVGImageElement"

foreign import javascript unsafe "window[\"SVGImageElement\"]" gTypeSVGImageElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGLength".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGLength Mozilla SVGLength documentation>
newtype SVGLength = SVGLength { unSVGLength :: JSRef }

instance Eq (SVGLength) where
  (SVGLength a) == (SVGLength b) = js_eq a b

instance PToJSRef SVGLength where
  pToJSRef = unSVGLength
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGLength where
  pFromJSRef = SVGLength
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGLength where
  toJSRef = return . unSVGLength
  {-# INLINE toJSRef #-}

instance FromJSRef SVGLength where
  fromJSRef = return . fmap SVGLength . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGLength where
  toGObject = GObject . unSVGLength
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGLength . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGLength :: IsGObject obj => obj -> SVGLength
castToSVGLength = castTo gTypeSVGLength "SVGLength"

foreign import javascript unsafe "window[\"SVGLength\"]" gTypeSVGLength :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGLengthList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGLengthList Mozilla SVGLengthList documentation>
newtype SVGLengthList = SVGLengthList { unSVGLengthList :: JSRef }

instance Eq (SVGLengthList) where
  (SVGLengthList a) == (SVGLengthList b) = js_eq a b

instance PToJSRef SVGLengthList where
  pToJSRef = unSVGLengthList
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGLengthList where
  pFromJSRef = SVGLengthList
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGLengthList where
  toJSRef = return . unSVGLengthList
  {-# INLINE toJSRef #-}

instance FromJSRef SVGLengthList where
  fromJSRef = return . fmap SVGLengthList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGLengthList where
  toGObject = GObject . unSVGLengthList
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGLengthList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGLengthList :: IsGObject obj => obj -> SVGLengthList
castToSVGLengthList = castTo gTypeSVGLengthList "SVGLengthList"

foreign import javascript unsafe "window[\"SVGLengthList\"]" gTypeSVGLengthList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGLineElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGLineElement Mozilla SVGLineElement documentation>
newtype SVGLineElement = SVGLineElement { unSVGLineElement :: JSRef }

instance Eq (SVGLineElement) where
  (SVGLineElement a) == (SVGLineElement b) = js_eq a b

instance PToJSRef SVGLineElement where
  pToJSRef = unSVGLineElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGLineElement where
  pFromJSRef = SVGLineElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGLineElement where
  toJSRef = return . unSVGLineElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGLineElement where
  fromJSRef = return . fmap SVGLineElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGraphicsElement SVGLineElement
instance IsSVGElement SVGLineElement
instance IsElement SVGLineElement
instance IsNode SVGLineElement
instance IsEventTarget SVGLineElement
instance IsGObject SVGLineElement where
  toGObject = GObject . unSVGLineElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGLineElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGLineElement :: IsGObject obj => obj -> SVGLineElement
castToSVGLineElement = castTo gTypeSVGLineElement "SVGLineElement"

foreign import javascript unsafe "window[\"SVGLineElement\"]" gTypeSVGLineElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGLinearGradientElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGradientElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGLinearGradientElement Mozilla SVGLinearGradientElement documentation>
newtype SVGLinearGradientElement = SVGLinearGradientElement { unSVGLinearGradientElement :: JSRef }

instance Eq (SVGLinearGradientElement) where
  (SVGLinearGradientElement a) == (SVGLinearGradientElement b) = js_eq a b

instance PToJSRef SVGLinearGradientElement where
  pToJSRef = unSVGLinearGradientElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGLinearGradientElement where
  pFromJSRef = SVGLinearGradientElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGLinearGradientElement where
  toJSRef = return . unSVGLinearGradientElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGLinearGradientElement where
  fromJSRef = return . fmap SVGLinearGradientElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGradientElement SVGLinearGradientElement
instance IsSVGElement SVGLinearGradientElement
instance IsElement SVGLinearGradientElement
instance IsNode SVGLinearGradientElement
instance IsEventTarget SVGLinearGradientElement
instance IsGObject SVGLinearGradientElement where
  toGObject = GObject . unSVGLinearGradientElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGLinearGradientElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGLinearGradientElement :: IsGObject obj => obj -> SVGLinearGradientElement
castToSVGLinearGradientElement = castTo gTypeSVGLinearGradientElement "SVGLinearGradientElement"

foreign import javascript unsafe "window[\"SVGLinearGradientElement\"]" gTypeSVGLinearGradientElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGMPathElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGMPathElement Mozilla SVGMPathElement documentation>
newtype SVGMPathElement = SVGMPathElement { unSVGMPathElement :: JSRef }

instance Eq (SVGMPathElement) where
  (SVGMPathElement a) == (SVGMPathElement b) = js_eq a b

instance PToJSRef SVGMPathElement where
  pToJSRef = unSVGMPathElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGMPathElement where
  pFromJSRef = SVGMPathElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGMPathElement where
  toJSRef = return . unSVGMPathElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGMPathElement where
  fromJSRef = return . fmap SVGMPathElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGMPathElement
instance IsElement SVGMPathElement
instance IsNode SVGMPathElement
instance IsEventTarget SVGMPathElement
instance IsGObject SVGMPathElement where
  toGObject = GObject . unSVGMPathElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGMPathElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGMPathElement :: IsGObject obj => obj -> SVGMPathElement
castToSVGMPathElement = castTo gTypeSVGMPathElement "SVGMPathElement"

foreign import javascript unsafe "window[\"SVGMPathElement\"]" gTypeSVGMPathElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGMarkerElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGMarkerElement Mozilla SVGMarkerElement documentation>
newtype SVGMarkerElement = SVGMarkerElement { unSVGMarkerElement :: JSRef }

instance Eq (SVGMarkerElement) where
  (SVGMarkerElement a) == (SVGMarkerElement b) = js_eq a b

instance PToJSRef SVGMarkerElement where
  pToJSRef = unSVGMarkerElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGMarkerElement where
  pFromJSRef = SVGMarkerElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGMarkerElement where
  toJSRef = return . unSVGMarkerElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGMarkerElement where
  fromJSRef = return . fmap SVGMarkerElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGMarkerElement
instance IsElement SVGMarkerElement
instance IsNode SVGMarkerElement
instance IsEventTarget SVGMarkerElement
instance IsGObject SVGMarkerElement where
  toGObject = GObject . unSVGMarkerElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGMarkerElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGMarkerElement :: IsGObject obj => obj -> SVGMarkerElement
castToSVGMarkerElement = castTo gTypeSVGMarkerElement "SVGMarkerElement"

foreign import javascript unsafe "window[\"SVGMarkerElement\"]" gTypeSVGMarkerElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGMaskElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGMaskElement Mozilla SVGMaskElement documentation>
newtype SVGMaskElement = SVGMaskElement { unSVGMaskElement :: JSRef }

instance Eq (SVGMaskElement) where
  (SVGMaskElement a) == (SVGMaskElement b) = js_eq a b

instance PToJSRef SVGMaskElement where
  pToJSRef = unSVGMaskElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGMaskElement where
  pFromJSRef = SVGMaskElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGMaskElement where
  toJSRef = return . unSVGMaskElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGMaskElement where
  fromJSRef = return . fmap SVGMaskElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGMaskElement
instance IsElement SVGMaskElement
instance IsNode SVGMaskElement
instance IsEventTarget SVGMaskElement
instance IsGObject SVGMaskElement where
  toGObject = GObject . unSVGMaskElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGMaskElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGMaskElement :: IsGObject obj => obj -> SVGMaskElement
castToSVGMaskElement = castTo gTypeSVGMaskElement "SVGMaskElement"

foreign import javascript unsafe "window[\"SVGMaskElement\"]" gTypeSVGMaskElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGMatrix".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGMatrix Mozilla SVGMatrix documentation>
newtype SVGMatrix = SVGMatrix { unSVGMatrix :: JSRef }

instance Eq (SVGMatrix) where
  (SVGMatrix a) == (SVGMatrix b) = js_eq a b

instance PToJSRef SVGMatrix where
  pToJSRef = unSVGMatrix
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGMatrix where
  pFromJSRef = SVGMatrix
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGMatrix where
  toJSRef = return . unSVGMatrix
  {-# INLINE toJSRef #-}

instance FromJSRef SVGMatrix where
  fromJSRef = return . fmap SVGMatrix . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGMatrix where
  toGObject = GObject . unSVGMatrix
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGMatrix . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGMatrix :: IsGObject obj => obj -> SVGMatrix
castToSVGMatrix = castTo gTypeSVGMatrix "SVGMatrix"

foreign import javascript unsafe "window[\"SVGMatrix\"]" gTypeSVGMatrix :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGMetadataElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGMetadataElement Mozilla SVGMetadataElement documentation>
newtype SVGMetadataElement = SVGMetadataElement { unSVGMetadataElement :: JSRef }

instance Eq (SVGMetadataElement) where
  (SVGMetadataElement a) == (SVGMetadataElement b) = js_eq a b

instance PToJSRef SVGMetadataElement where
  pToJSRef = unSVGMetadataElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGMetadataElement where
  pFromJSRef = SVGMetadataElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGMetadataElement where
  toJSRef = return . unSVGMetadataElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGMetadataElement where
  fromJSRef = return . fmap SVGMetadataElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGMetadataElement
instance IsElement SVGMetadataElement
instance IsNode SVGMetadataElement
instance IsEventTarget SVGMetadataElement
instance IsGObject SVGMetadataElement where
  toGObject = GObject . unSVGMetadataElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGMetadataElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGMetadataElement :: IsGObject obj => obj -> SVGMetadataElement
castToSVGMetadataElement = castTo gTypeSVGMetadataElement "SVGMetadataElement"

foreign import javascript unsafe "window[\"SVGMetadataElement\"]" gTypeSVGMetadataElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGMissingGlyphElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGMissingGlyphElement Mozilla SVGMissingGlyphElement documentation>
newtype SVGMissingGlyphElement = SVGMissingGlyphElement { unSVGMissingGlyphElement :: JSRef }

instance Eq (SVGMissingGlyphElement) where
  (SVGMissingGlyphElement a) == (SVGMissingGlyphElement b) = js_eq a b

instance PToJSRef SVGMissingGlyphElement where
  pToJSRef = unSVGMissingGlyphElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGMissingGlyphElement where
  pFromJSRef = SVGMissingGlyphElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGMissingGlyphElement where
  toJSRef = return . unSVGMissingGlyphElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGMissingGlyphElement where
  fromJSRef = return . fmap SVGMissingGlyphElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGMissingGlyphElement
instance IsElement SVGMissingGlyphElement
instance IsNode SVGMissingGlyphElement
instance IsEventTarget SVGMissingGlyphElement
instance IsGObject SVGMissingGlyphElement where
  toGObject = GObject . unSVGMissingGlyphElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGMissingGlyphElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGMissingGlyphElement :: IsGObject obj => obj -> SVGMissingGlyphElement
castToSVGMissingGlyphElement = castTo gTypeSVGMissingGlyphElement "SVGMissingGlyphElement"

foreign import javascript unsafe "window[\"SVGMissingGlyphElement\"]" gTypeSVGMissingGlyphElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGNumber".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGNumber Mozilla SVGNumber documentation>
newtype SVGNumber = SVGNumber { unSVGNumber :: JSRef }

instance Eq (SVGNumber) where
  (SVGNumber a) == (SVGNumber b) = js_eq a b

instance PToJSRef SVGNumber where
  pToJSRef = unSVGNumber
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGNumber where
  pFromJSRef = SVGNumber
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGNumber where
  toJSRef = return . unSVGNumber
  {-# INLINE toJSRef #-}

instance FromJSRef SVGNumber where
  fromJSRef = return . fmap SVGNumber . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGNumber where
  toGObject = GObject . unSVGNumber
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGNumber . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGNumber :: IsGObject obj => obj -> SVGNumber
castToSVGNumber = castTo gTypeSVGNumber "SVGNumber"

foreign import javascript unsafe "window[\"SVGNumber\"]" gTypeSVGNumber :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGNumberList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGNumberList Mozilla SVGNumberList documentation>
newtype SVGNumberList = SVGNumberList { unSVGNumberList :: JSRef }

instance Eq (SVGNumberList) where
  (SVGNumberList a) == (SVGNumberList b) = js_eq a b

instance PToJSRef SVGNumberList where
  pToJSRef = unSVGNumberList
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGNumberList where
  pFromJSRef = SVGNumberList
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGNumberList where
  toJSRef = return . unSVGNumberList
  {-# INLINE toJSRef #-}

instance FromJSRef SVGNumberList where
  fromJSRef = return . fmap SVGNumberList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGNumberList where
  toGObject = GObject . unSVGNumberList
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGNumberList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGNumberList :: IsGObject obj => obj -> SVGNumberList
castToSVGNumberList = castTo gTypeSVGNumberList "SVGNumberList"

foreign import javascript unsafe "window[\"SVGNumberList\"]" gTypeSVGNumberList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPaint".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGColor"
--     * "GHCJS.DOM.CSSValue"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPaint Mozilla SVGPaint documentation>
newtype SVGPaint = SVGPaint { unSVGPaint :: JSRef }

instance Eq (SVGPaint) where
  (SVGPaint a) == (SVGPaint b) = js_eq a b

instance PToJSRef SVGPaint where
  pToJSRef = unSVGPaint
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPaint where
  pFromJSRef = SVGPaint
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPaint where
  toJSRef = return . unSVGPaint
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPaint where
  fromJSRef = return . fmap SVGPaint . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGColor SVGPaint
instance IsCSSValue SVGPaint
instance IsGObject SVGPaint where
  toGObject = GObject . unSVGPaint
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPaint . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPaint :: IsGObject obj => obj -> SVGPaint
castToSVGPaint = castTo gTypeSVGPaint "SVGPaint"

foreign import javascript unsafe "window[\"SVGPaint\"]" gTypeSVGPaint :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathElement Mozilla SVGPathElement documentation>
newtype SVGPathElement = SVGPathElement { unSVGPathElement :: JSRef }

instance Eq (SVGPathElement) where
  (SVGPathElement a) == (SVGPathElement b) = js_eq a b

instance PToJSRef SVGPathElement where
  pToJSRef = unSVGPathElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathElement where
  pFromJSRef = SVGPathElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathElement where
  toJSRef = return . unSVGPathElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathElement where
  fromJSRef = return . fmap SVGPathElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGraphicsElement SVGPathElement
instance IsSVGElement SVGPathElement
instance IsElement SVGPathElement
instance IsNode SVGPathElement
instance IsEventTarget SVGPathElement
instance IsGObject SVGPathElement where
  toGObject = GObject . unSVGPathElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathElement :: IsGObject obj => obj -> SVGPathElement
castToSVGPathElement = castTo gTypeSVGPathElement "SVGPathElement"

foreign import javascript unsafe "window[\"SVGPathElement\"]" gTypeSVGPathElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSeg".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSeg Mozilla SVGPathSeg documentation>
newtype SVGPathSeg = SVGPathSeg { unSVGPathSeg :: JSRef }

instance Eq (SVGPathSeg) where
  (SVGPathSeg a) == (SVGPathSeg b) = js_eq a b

instance PToJSRef SVGPathSeg where
  pToJSRef = unSVGPathSeg
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSeg where
  pFromJSRef = SVGPathSeg
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSeg where
  toJSRef = return . unSVGPathSeg
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSeg where
  fromJSRef = return . fmap SVGPathSeg . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsSVGPathSeg o
toSVGPathSeg :: IsSVGPathSeg o => o -> SVGPathSeg
toSVGPathSeg = unsafeCastGObject . toGObject

instance IsSVGPathSeg SVGPathSeg
instance IsGObject SVGPathSeg where
  toGObject = GObject . unSVGPathSeg
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSeg . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSeg :: IsGObject obj => obj -> SVGPathSeg
castToSVGPathSeg = castTo gTypeSVGPathSeg "SVGPathSeg"

foreign import javascript unsafe "window[\"SVGPathSeg\"]" gTypeSVGPathSeg :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegArcAbs".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegArcAbs Mozilla SVGPathSegArcAbs documentation>
newtype SVGPathSegArcAbs = SVGPathSegArcAbs { unSVGPathSegArcAbs :: JSRef }

instance Eq (SVGPathSegArcAbs) where
  (SVGPathSegArcAbs a) == (SVGPathSegArcAbs b) = js_eq a b

instance PToJSRef SVGPathSegArcAbs where
  pToJSRef = unSVGPathSegArcAbs
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegArcAbs where
  pFromJSRef = SVGPathSegArcAbs
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegArcAbs where
  toJSRef = return . unSVGPathSegArcAbs
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegArcAbs where
  fromJSRef = return . fmap SVGPathSegArcAbs . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegArcAbs
instance IsGObject SVGPathSegArcAbs where
  toGObject = GObject . unSVGPathSegArcAbs
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegArcAbs . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegArcAbs :: IsGObject obj => obj -> SVGPathSegArcAbs
castToSVGPathSegArcAbs = castTo gTypeSVGPathSegArcAbs "SVGPathSegArcAbs"

foreign import javascript unsafe "window[\"SVGPathSegArcAbs\"]" gTypeSVGPathSegArcAbs :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegArcRel".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegArcRel Mozilla SVGPathSegArcRel documentation>
newtype SVGPathSegArcRel = SVGPathSegArcRel { unSVGPathSegArcRel :: JSRef }

instance Eq (SVGPathSegArcRel) where
  (SVGPathSegArcRel a) == (SVGPathSegArcRel b) = js_eq a b

instance PToJSRef SVGPathSegArcRel where
  pToJSRef = unSVGPathSegArcRel
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegArcRel where
  pFromJSRef = SVGPathSegArcRel
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegArcRel where
  toJSRef = return . unSVGPathSegArcRel
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegArcRel where
  fromJSRef = return . fmap SVGPathSegArcRel . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegArcRel
instance IsGObject SVGPathSegArcRel where
  toGObject = GObject . unSVGPathSegArcRel
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegArcRel . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegArcRel :: IsGObject obj => obj -> SVGPathSegArcRel
castToSVGPathSegArcRel = castTo gTypeSVGPathSegArcRel "SVGPathSegArcRel"

foreign import javascript unsafe "window[\"SVGPathSegArcRel\"]" gTypeSVGPathSegArcRel :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegClosePath".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegClosePath Mozilla SVGPathSegClosePath documentation>
newtype SVGPathSegClosePath = SVGPathSegClosePath { unSVGPathSegClosePath :: JSRef }

instance Eq (SVGPathSegClosePath) where
  (SVGPathSegClosePath a) == (SVGPathSegClosePath b) = js_eq a b

instance PToJSRef SVGPathSegClosePath where
  pToJSRef = unSVGPathSegClosePath
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegClosePath where
  pFromJSRef = SVGPathSegClosePath
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegClosePath where
  toJSRef = return . unSVGPathSegClosePath
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegClosePath where
  fromJSRef = return . fmap SVGPathSegClosePath . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegClosePath
instance IsGObject SVGPathSegClosePath where
  toGObject = GObject . unSVGPathSegClosePath
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegClosePath . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegClosePath :: IsGObject obj => obj -> SVGPathSegClosePath
castToSVGPathSegClosePath = castTo gTypeSVGPathSegClosePath "SVGPathSegClosePath"

foreign import javascript unsafe "window[\"SVGPathSegClosePath\"]" gTypeSVGPathSegClosePath :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegCurvetoCubicAbs".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegCurvetoCubicAbs Mozilla SVGPathSegCurvetoCubicAbs documentation>
newtype SVGPathSegCurvetoCubicAbs = SVGPathSegCurvetoCubicAbs { unSVGPathSegCurvetoCubicAbs :: JSRef }

instance Eq (SVGPathSegCurvetoCubicAbs) where
  (SVGPathSegCurvetoCubicAbs a) == (SVGPathSegCurvetoCubicAbs b) = js_eq a b

instance PToJSRef SVGPathSegCurvetoCubicAbs where
  pToJSRef = unSVGPathSegCurvetoCubicAbs
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegCurvetoCubicAbs where
  pFromJSRef = SVGPathSegCurvetoCubicAbs
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegCurvetoCubicAbs where
  toJSRef = return . unSVGPathSegCurvetoCubicAbs
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegCurvetoCubicAbs where
  fromJSRef = return . fmap SVGPathSegCurvetoCubicAbs . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegCurvetoCubicAbs
instance IsGObject SVGPathSegCurvetoCubicAbs where
  toGObject = GObject . unSVGPathSegCurvetoCubicAbs
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegCurvetoCubicAbs . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegCurvetoCubicAbs :: IsGObject obj => obj -> SVGPathSegCurvetoCubicAbs
castToSVGPathSegCurvetoCubicAbs = castTo gTypeSVGPathSegCurvetoCubicAbs "SVGPathSegCurvetoCubicAbs"

foreign import javascript unsafe "window[\"SVGPathSegCurvetoCubicAbs\"]" gTypeSVGPathSegCurvetoCubicAbs :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegCurvetoCubicRel".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegCurvetoCubicRel Mozilla SVGPathSegCurvetoCubicRel documentation>
newtype SVGPathSegCurvetoCubicRel = SVGPathSegCurvetoCubicRel { unSVGPathSegCurvetoCubicRel :: JSRef }

instance Eq (SVGPathSegCurvetoCubicRel) where
  (SVGPathSegCurvetoCubicRel a) == (SVGPathSegCurvetoCubicRel b) = js_eq a b

instance PToJSRef SVGPathSegCurvetoCubicRel where
  pToJSRef = unSVGPathSegCurvetoCubicRel
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegCurvetoCubicRel where
  pFromJSRef = SVGPathSegCurvetoCubicRel
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegCurvetoCubicRel where
  toJSRef = return . unSVGPathSegCurvetoCubicRel
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegCurvetoCubicRel where
  fromJSRef = return . fmap SVGPathSegCurvetoCubicRel . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegCurvetoCubicRel
instance IsGObject SVGPathSegCurvetoCubicRel where
  toGObject = GObject . unSVGPathSegCurvetoCubicRel
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegCurvetoCubicRel . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegCurvetoCubicRel :: IsGObject obj => obj -> SVGPathSegCurvetoCubicRel
castToSVGPathSegCurvetoCubicRel = castTo gTypeSVGPathSegCurvetoCubicRel "SVGPathSegCurvetoCubicRel"

foreign import javascript unsafe "window[\"SVGPathSegCurvetoCubicRel\"]" gTypeSVGPathSegCurvetoCubicRel :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegCurvetoCubicSmoothAbs".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegCurvetoCubicSmoothAbs Mozilla SVGPathSegCurvetoCubicSmoothAbs documentation>
newtype SVGPathSegCurvetoCubicSmoothAbs = SVGPathSegCurvetoCubicSmoothAbs { unSVGPathSegCurvetoCubicSmoothAbs :: JSRef }

instance Eq (SVGPathSegCurvetoCubicSmoothAbs) where
  (SVGPathSegCurvetoCubicSmoothAbs a) == (SVGPathSegCurvetoCubicSmoothAbs b) = js_eq a b

instance PToJSRef SVGPathSegCurvetoCubicSmoothAbs where
  pToJSRef = unSVGPathSegCurvetoCubicSmoothAbs
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegCurvetoCubicSmoothAbs where
  pFromJSRef = SVGPathSegCurvetoCubicSmoothAbs
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegCurvetoCubicSmoothAbs where
  toJSRef = return . unSVGPathSegCurvetoCubicSmoothAbs
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegCurvetoCubicSmoothAbs where
  fromJSRef = return . fmap SVGPathSegCurvetoCubicSmoothAbs . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegCurvetoCubicSmoothAbs
instance IsGObject SVGPathSegCurvetoCubicSmoothAbs where
  toGObject = GObject . unSVGPathSegCurvetoCubicSmoothAbs
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegCurvetoCubicSmoothAbs . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegCurvetoCubicSmoothAbs :: IsGObject obj => obj -> SVGPathSegCurvetoCubicSmoothAbs
castToSVGPathSegCurvetoCubicSmoothAbs = castTo gTypeSVGPathSegCurvetoCubicSmoothAbs "SVGPathSegCurvetoCubicSmoothAbs"

foreign import javascript unsafe "window[\"SVGPathSegCurvetoCubicSmoothAbs\"]" gTypeSVGPathSegCurvetoCubicSmoothAbs :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegCurvetoCubicSmoothRel".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegCurvetoCubicSmoothRel Mozilla SVGPathSegCurvetoCubicSmoothRel documentation>
newtype SVGPathSegCurvetoCubicSmoothRel = SVGPathSegCurvetoCubicSmoothRel { unSVGPathSegCurvetoCubicSmoothRel :: JSRef }

instance Eq (SVGPathSegCurvetoCubicSmoothRel) where
  (SVGPathSegCurvetoCubicSmoothRel a) == (SVGPathSegCurvetoCubicSmoothRel b) = js_eq a b

instance PToJSRef SVGPathSegCurvetoCubicSmoothRel where
  pToJSRef = unSVGPathSegCurvetoCubicSmoothRel
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegCurvetoCubicSmoothRel where
  pFromJSRef = SVGPathSegCurvetoCubicSmoothRel
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegCurvetoCubicSmoothRel where
  toJSRef = return . unSVGPathSegCurvetoCubicSmoothRel
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegCurvetoCubicSmoothRel where
  fromJSRef = return . fmap SVGPathSegCurvetoCubicSmoothRel . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegCurvetoCubicSmoothRel
instance IsGObject SVGPathSegCurvetoCubicSmoothRel where
  toGObject = GObject . unSVGPathSegCurvetoCubicSmoothRel
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegCurvetoCubicSmoothRel . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegCurvetoCubicSmoothRel :: IsGObject obj => obj -> SVGPathSegCurvetoCubicSmoothRel
castToSVGPathSegCurvetoCubicSmoothRel = castTo gTypeSVGPathSegCurvetoCubicSmoothRel "SVGPathSegCurvetoCubicSmoothRel"

foreign import javascript unsafe "window[\"SVGPathSegCurvetoCubicSmoothRel\"]" gTypeSVGPathSegCurvetoCubicSmoothRel :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegCurvetoQuadraticAbs".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegCurvetoQuadraticAbs Mozilla SVGPathSegCurvetoQuadraticAbs documentation>
newtype SVGPathSegCurvetoQuadraticAbs = SVGPathSegCurvetoQuadraticAbs { unSVGPathSegCurvetoQuadraticAbs :: JSRef }

instance Eq (SVGPathSegCurvetoQuadraticAbs) where
  (SVGPathSegCurvetoQuadraticAbs a) == (SVGPathSegCurvetoQuadraticAbs b) = js_eq a b

instance PToJSRef SVGPathSegCurvetoQuadraticAbs where
  pToJSRef = unSVGPathSegCurvetoQuadraticAbs
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegCurvetoQuadraticAbs where
  pFromJSRef = SVGPathSegCurvetoQuadraticAbs
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegCurvetoQuadraticAbs where
  toJSRef = return . unSVGPathSegCurvetoQuadraticAbs
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegCurvetoQuadraticAbs where
  fromJSRef = return . fmap SVGPathSegCurvetoQuadraticAbs . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegCurvetoQuadraticAbs
instance IsGObject SVGPathSegCurvetoQuadraticAbs where
  toGObject = GObject . unSVGPathSegCurvetoQuadraticAbs
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegCurvetoQuadraticAbs . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegCurvetoQuadraticAbs :: IsGObject obj => obj -> SVGPathSegCurvetoQuadraticAbs
castToSVGPathSegCurvetoQuadraticAbs = castTo gTypeSVGPathSegCurvetoQuadraticAbs "SVGPathSegCurvetoQuadraticAbs"

foreign import javascript unsafe "window[\"SVGPathSegCurvetoQuadraticAbs\"]" gTypeSVGPathSegCurvetoQuadraticAbs :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegCurvetoQuadraticRel".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegCurvetoQuadraticRel Mozilla SVGPathSegCurvetoQuadraticRel documentation>
newtype SVGPathSegCurvetoQuadraticRel = SVGPathSegCurvetoQuadraticRel { unSVGPathSegCurvetoQuadraticRel :: JSRef }

instance Eq (SVGPathSegCurvetoQuadraticRel) where
  (SVGPathSegCurvetoQuadraticRel a) == (SVGPathSegCurvetoQuadraticRel b) = js_eq a b

instance PToJSRef SVGPathSegCurvetoQuadraticRel where
  pToJSRef = unSVGPathSegCurvetoQuadraticRel
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegCurvetoQuadraticRel where
  pFromJSRef = SVGPathSegCurvetoQuadraticRel
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegCurvetoQuadraticRel where
  toJSRef = return . unSVGPathSegCurvetoQuadraticRel
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegCurvetoQuadraticRel where
  fromJSRef = return . fmap SVGPathSegCurvetoQuadraticRel . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegCurvetoQuadraticRel
instance IsGObject SVGPathSegCurvetoQuadraticRel where
  toGObject = GObject . unSVGPathSegCurvetoQuadraticRel
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegCurvetoQuadraticRel . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegCurvetoQuadraticRel :: IsGObject obj => obj -> SVGPathSegCurvetoQuadraticRel
castToSVGPathSegCurvetoQuadraticRel = castTo gTypeSVGPathSegCurvetoQuadraticRel "SVGPathSegCurvetoQuadraticRel"

foreign import javascript unsafe "window[\"SVGPathSegCurvetoQuadraticRel\"]" gTypeSVGPathSegCurvetoQuadraticRel :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegCurvetoQuadraticSmoothAbs".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegCurvetoQuadraticSmoothAbs Mozilla SVGPathSegCurvetoQuadraticSmoothAbs documentation>
newtype SVGPathSegCurvetoQuadraticSmoothAbs = SVGPathSegCurvetoQuadraticSmoothAbs { unSVGPathSegCurvetoQuadraticSmoothAbs :: JSRef }

instance Eq (SVGPathSegCurvetoQuadraticSmoothAbs) where
  (SVGPathSegCurvetoQuadraticSmoothAbs a) == (SVGPathSegCurvetoQuadraticSmoothAbs b) = js_eq a b

instance PToJSRef SVGPathSegCurvetoQuadraticSmoothAbs where
  pToJSRef = unSVGPathSegCurvetoQuadraticSmoothAbs
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegCurvetoQuadraticSmoothAbs where
  pFromJSRef = SVGPathSegCurvetoQuadraticSmoothAbs
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegCurvetoQuadraticSmoothAbs where
  toJSRef = return . unSVGPathSegCurvetoQuadraticSmoothAbs
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegCurvetoQuadraticSmoothAbs where
  fromJSRef = return . fmap SVGPathSegCurvetoQuadraticSmoothAbs . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegCurvetoQuadraticSmoothAbs
instance IsGObject SVGPathSegCurvetoQuadraticSmoothAbs where
  toGObject = GObject . unSVGPathSegCurvetoQuadraticSmoothAbs
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegCurvetoQuadraticSmoothAbs . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegCurvetoQuadraticSmoothAbs :: IsGObject obj => obj -> SVGPathSegCurvetoQuadraticSmoothAbs
castToSVGPathSegCurvetoQuadraticSmoothAbs = castTo gTypeSVGPathSegCurvetoQuadraticSmoothAbs "SVGPathSegCurvetoQuadraticSmoothAbs"

foreign import javascript unsafe "window[\"SVGPathSegCurvetoQuadraticSmoothAbs\"]" gTypeSVGPathSegCurvetoQuadraticSmoothAbs :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegCurvetoQuadraticSmoothRel".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegCurvetoQuadraticSmoothRel Mozilla SVGPathSegCurvetoQuadraticSmoothRel documentation>
newtype SVGPathSegCurvetoQuadraticSmoothRel = SVGPathSegCurvetoQuadraticSmoothRel { unSVGPathSegCurvetoQuadraticSmoothRel :: JSRef }

instance Eq (SVGPathSegCurvetoQuadraticSmoothRel) where
  (SVGPathSegCurvetoQuadraticSmoothRel a) == (SVGPathSegCurvetoQuadraticSmoothRel b) = js_eq a b

instance PToJSRef SVGPathSegCurvetoQuadraticSmoothRel where
  pToJSRef = unSVGPathSegCurvetoQuadraticSmoothRel
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegCurvetoQuadraticSmoothRel where
  pFromJSRef = SVGPathSegCurvetoQuadraticSmoothRel
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegCurvetoQuadraticSmoothRel where
  toJSRef = return . unSVGPathSegCurvetoQuadraticSmoothRel
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegCurvetoQuadraticSmoothRel where
  fromJSRef = return . fmap SVGPathSegCurvetoQuadraticSmoothRel . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegCurvetoQuadraticSmoothRel
instance IsGObject SVGPathSegCurvetoQuadraticSmoothRel where
  toGObject = GObject . unSVGPathSegCurvetoQuadraticSmoothRel
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegCurvetoQuadraticSmoothRel . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegCurvetoQuadraticSmoothRel :: IsGObject obj => obj -> SVGPathSegCurvetoQuadraticSmoothRel
castToSVGPathSegCurvetoQuadraticSmoothRel = castTo gTypeSVGPathSegCurvetoQuadraticSmoothRel "SVGPathSegCurvetoQuadraticSmoothRel"

foreign import javascript unsafe "window[\"SVGPathSegCurvetoQuadraticSmoothRel\"]" gTypeSVGPathSegCurvetoQuadraticSmoothRel :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegLinetoAbs".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegLinetoAbs Mozilla SVGPathSegLinetoAbs documentation>
newtype SVGPathSegLinetoAbs = SVGPathSegLinetoAbs { unSVGPathSegLinetoAbs :: JSRef }

instance Eq (SVGPathSegLinetoAbs) where
  (SVGPathSegLinetoAbs a) == (SVGPathSegLinetoAbs b) = js_eq a b

instance PToJSRef SVGPathSegLinetoAbs where
  pToJSRef = unSVGPathSegLinetoAbs
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegLinetoAbs where
  pFromJSRef = SVGPathSegLinetoAbs
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegLinetoAbs where
  toJSRef = return . unSVGPathSegLinetoAbs
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegLinetoAbs where
  fromJSRef = return . fmap SVGPathSegLinetoAbs . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegLinetoAbs
instance IsGObject SVGPathSegLinetoAbs where
  toGObject = GObject . unSVGPathSegLinetoAbs
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegLinetoAbs . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegLinetoAbs :: IsGObject obj => obj -> SVGPathSegLinetoAbs
castToSVGPathSegLinetoAbs = castTo gTypeSVGPathSegLinetoAbs "SVGPathSegLinetoAbs"

foreign import javascript unsafe "window[\"SVGPathSegLinetoAbs\"]" gTypeSVGPathSegLinetoAbs :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegLinetoHorizontalAbs".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegLinetoHorizontalAbs Mozilla SVGPathSegLinetoHorizontalAbs documentation>
newtype SVGPathSegLinetoHorizontalAbs = SVGPathSegLinetoHorizontalAbs { unSVGPathSegLinetoHorizontalAbs :: JSRef }

instance Eq (SVGPathSegLinetoHorizontalAbs) where
  (SVGPathSegLinetoHorizontalAbs a) == (SVGPathSegLinetoHorizontalAbs b) = js_eq a b

instance PToJSRef SVGPathSegLinetoHorizontalAbs where
  pToJSRef = unSVGPathSegLinetoHorizontalAbs
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegLinetoHorizontalAbs where
  pFromJSRef = SVGPathSegLinetoHorizontalAbs
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegLinetoHorizontalAbs where
  toJSRef = return . unSVGPathSegLinetoHorizontalAbs
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegLinetoHorizontalAbs where
  fromJSRef = return . fmap SVGPathSegLinetoHorizontalAbs . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegLinetoHorizontalAbs
instance IsGObject SVGPathSegLinetoHorizontalAbs where
  toGObject = GObject . unSVGPathSegLinetoHorizontalAbs
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegLinetoHorizontalAbs . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegLinetoHorizontalAbs :: IsGObject obj => obj -> SVGPathSegLinetoHorizontalAbs
castToSVGPathSegLinetoHorizontalAbs = castTo gTypeSVGPathSegLinetoHorizontalAbs "SVGPathSegLinetoHorizontalAbs"

foreign import javascript unsafe "window[\"SVGPathSegLinetoHorizontalAbs\"]" gTypeSVGPathSegLinetoHorizontalAbs :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegLinetoHorizontalRel".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegLinetoHorizontalRel Mozilla SVGPathSegLinetoHorizontalRel documentation>
newtype SVGPathSegLinetoHorizontalRel = SVGPathSegLinetoHorizontalRel { unSVGPathSegLinetoHorizontalRel :: JSRef }

instance Eq (SVGPathSegLinetoHorizontalRel) where
  (SVGPathSegLinetoHorizontalRel a) == (SVGPathSegLinetoHorizontalRel b) = js_eq a b

instance PToJSRef SVGPathSegLinetoHorizontalRel where
  pToJSRef = unSVGPathSegLinetoHorizontalRel
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegLinetoHorizontalRel where
  pFromJSRef = SVGPathSegLinetoHorizontalRel
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegLinetoHorizontalRel where
  toJSRef = return . unSVGPathSegLinetoHorizontalRel
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegLinetoHorizontalRel where
  fromJSRef = return . fmap SVGPathSegLinetoHorizontalRel . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegLinetoHorizontalRel
instance IsGObject SVGPathSegLinetoHorizontalRel where
  toGObject = GObject . unSVGPathSegLinetoHorizontalRel
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegLinetoHorizontalRel . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegLinetoHorizontalRel :: IsGObject obj => obj -> SVGPathSegLinetoHorizontalRel
castToSVGPathSegLinetoHorizontalRel = castTo gTypeSVGPathSegLinetoHorizontalRel "SVGPathSegLinetoHorizontalRel"

foreign import javascript unsafe "window[\"SVGPathSegLinetoHorizontalRel\"]" gTypeSVGPathSegLinetoHorizontalRel :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegLinetoRel".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegLinetoRel Mozilla SVGPathSegLinetoRel documentation>
newtype SVGPathSegLinetoRel = SVGPathSegLinetoRel { unSVGPathSegLinetoRel :: JSRef }

instance Eq (SVGPathSegLinetoRel) where
  (SVGPathSegLinetoRel a) == (SVGPathSegLinetoRel b) = js_eq a b

instance PToJSRef SVGPathSegLinetoRel where
  pToJSRef = unSVGPathSegLinetoRel
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegLinetoRel where
  pFromJSRef = SVGPathSegLinetoRel
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegLinetoRel where
  toJSRef = return . unSVGPathSegLinetoRel
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegLinetoRel where
  fromJSRef = return . fmap SVGPathSegLinetoRel . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegLinetoRel
instance IsGObject SVGPathSegLinetoRel where
  toGObject = GObject . unSVGPathSegLinetoRel
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegLinetoRel . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegLinetoRel :: IsGObject obj => obj -> SVGPathSegLinetoRel
castToSVGPathSegLinetoRel = castTo gTypeSVGPathSegLinetoRel "SVGPathSegLinetoRel"

foreign import javascript unsafe "window[\"SVGPathSegLinetoRel\"]" gTypeSVGPathSegLinetoRel :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegLinetoVerticalAbs".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegLinetoVerticalAbs Mozilla SVGPathSegLinetoVerticalAbs documentation>
newtype SVGPathSegLinetoVerticalAbs = SVGPathSegLinetoVerticalAbs { unSVGPathSegLinetoVerticalAbs :: JSRef }

instance Eq (SVGPathSegLinetoVerticalAbs) where
  (SVGPathSegLinetoVerticalAbs a) == (SVGPathSegLinetoVerticalAbs b) = js_eq a b

instance PToJSRef SVGPathSegLinetoVerticalAbs where
  pToJSRef = unSVGPathSegLinetoVerticalAbs
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegLinetoVerticalAbs where
  pFromJSRef = SVGPathSegLinetoVerticalAbs
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegLinetoVerticalAbs where
  toJSRef = return . unSVGPathSegLinetoVerticalAbs
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegLinetoVerticalAbs where
  fromJSRef = return . fmap SVGPathSegLinetoVerticalAbs . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegLinetoVerticalAbs
instance IsGObject SVGPathSegLinetoVerticalAbs where
  toGObject = GObject . unSVGPathSegLinetoVerticalAbs
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegLinetoVerticalAbs . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegLinetoVerticalAbs :: IsGObject obj => obj -> SVGPathSegLinetoVerticalAbs
castToSVGPathSegLinetoVerticalAbs = castTo gTypeSVGPathSegLinetoVerticalAbs "SVGPathSegLinetoVerticalAbs"

foreign import javascript unsafe "window[\"SVGPathSegLinetoVerticalAbs\"]" gTypeSVGPathSegLinetoVerticalAbs :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegLinetoVerticalRel".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegLinetoVerticalRel Mozilla SVGPathSegLinetoVerticalRel documentation>
newtype SVGPathSegLinetoVerticalRel = SVGPathSegLinetoVerticalRel { unSVGPathSegLinetoVerticalRel :: JSRef }

instance Eq (SVGPathSegLinetoVerticalRel) where
  (SVGPathSegLinetoVerticalRel a) == (SVGPathSegLinetoVerticalRel b) = js_eq a b

instance PToJSRef SVGPathSegLinetoVerticalRel where
  pToJSRef = unSVGPathSegLinetoVerticalRel
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegLinetoVerticalRel where
  pFromJSRef = SVGPathSegLinetoVerticalRel
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegLinetoVerticalRel where
  toJSRef = return . unSVGPathSegLinetoVerticalRel
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegLinetoVerticalRel where
  fromJSRef = return . fmap SVGPathSegLinetoVerticalRel . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegLinetoVerticalRel
instance IsGObject SVGPathSegLinetoVerticalRel where
  toGObject = GObject . unSVGPathSegLinetoVerticalRel
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegLinetoVerticalRel . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegLinetoVerticalRel :: IsGObject obj => obj -> SVGPathSegLinetoVerticalRel
castToSVGPathSegLinetoVerticalRel = castTo gTypeSVGPathSegLinetoVerticalRel "SVGPathSegLinetoVerticalRel"

foreign import javascript unsafe "window[\"SVGPathSegLinetoVerticalRel\"]" gTypeSVGPathSegLinetoVerticalRel :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegList Mozilla SVGPathSegList documentation>
newtype SVGPathSegList = SVGPathSegList { unSVGPathSegList :: JSRef }

instance Eq (SVGPathSegList) where
  (SVGPathSegList a) == (SVGPathSegList b) = js_eq a b

instance PToJSRef SVGPathSegList where
  pToJSRef = unSVGPathSegList
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegList where
  pFromJSRef = SVGPathSegList
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegList where
  toJSRef = return . unSVGPathSegList
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegList where
  fromJSRef = return . fmap SVGPathSegList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGPathSegList where
  toGObject = GObject . unSVGPathSegList
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegList :: IsGObject obj => obj -> SVGPathSegList
castToSVGPathSegList = castTo gTypeSVGPathSegList "SVGPathSegList"

foreign import javascript unsafe "window[\"SVGPathSegList\"]" gTypeSVGPathSegList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegMovetoAbs".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegMovetoAbs Mozilla SVGPathSegMovetoAbs documentation>
newtype SVGPathSegMovetoAbs = SVGPathSegMovetoAbs { unSVGPathSegMovetoAbs :: JSRef }

instance Eq (SVGPathSegMovetoAbs) where
  (SVGPathSegMovetoAbs a) == (SVGPathSegMovetoAbs b) = js_eq a b

instance PToJSRef SVGPathSegMovetoAbs where
  pToJSRef = unSVGPathSegMovetoAbs
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegMovetoAbs where
  pFromJSRef = SVGPathSegMovetoAbs
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegMovetoAbs where
  toJSRef = return . unSVGPathSegMovetoAbs
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegMovetoAbs where
  fromJSRef = return . fmap SVGPathSegMovetoAbs . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegMovetoAbs
instance IsGObject SVGPathSegMovetoAbs where
  toGObject = GObject . unSVGPathSegMovetoAbs
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegMovetoAbs . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegMovetoAbs :: IsGObject obj => obj -> SVGPathSegMovetoAbs
castToSVGPathSegMovetoAbs = castTo gTypeSVGPathSegMovetoAbs "SVGPathSegMovetoAbs"

foreign import javascript unsafe "window[\"SVGPathSegMovetoAbs\"]" gTypeSVGPathSegMovetoAbs :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPathSegMovetoRel".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGPathSeg"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPathSegMovetoRel Mozilla SVGPathSegMovetoRel documentation>
newtype SVGPathSegMovetoRel = SVGPathSegMovetoRel { unSVGPathSegMovetoRel :: JSRef }

instance Eq (SVGPathSegMovetoRel) where
  (SVGPathSegMovetoRel a) == (SVGPathSegMovetoRel b) = js_eq a b

instance PToJSRef SVGPathSegMovetoRel where
  pToJSRef = unSVGPathSegMovetoRel
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPathSegMovetoRel where
  pFromJSRef = SVGPathSegMovetoRel
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPathSegMovetoRel where
  toJSRef = return . unSVGPathSegMovetoRel
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPathSegMovetoRel where
  fromJSRef = return . fmap SVGPathSegMovetoRel . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGPathSeg SVGPathSegMovetoRel
instance IsGObject SVGPathSegMovetoRel where
  toGObject = GObject . unSVGPathSegMovetoRel
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPathSegMovetoRel . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPathSegMovetoRel :: IsGObject obj => obj -> SVGPathSegMovetoRel
castToSVGPathSegMovetoRel = castTo gTypeSVGPathSegMovetoRel "SVGPathSegMovetoRel"

foreign import javascript unsafe "window[\"SVGPathSegMovetoRel\"]" gTypeSVGPathSegMovetoRel :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPatternElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPatternElement Mozilla SVGPatternElement documentation>
newtype SVGPatternElement = SVGPatternElement { unSVGPatternElement :: JSRef }

instance Eq (SVGPatternElement) where
  (SVGPatternElement a) == (SVGPatternElement b) = js_eq a b

instance PToJSRef SVGPatternElement where
  pToJSRef = unSVGPatternElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPatternElement where
  pFromJSRef = SVGPatternElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPatternElement where
  toJSRef = return . unSVGPatternElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPatternElement where
  fromJSRef = return . fmap SVGPatternElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGPatternElement
instance IsElement SVGPatternElement
instance IsNode SVGPatternElement
instance IsEventTarget SVGPatternElement
instance IsGObject SVGPatternElement where
  toGObject = GObject . unSVGPatternElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPatternElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPatternElement :: IsGObject obj => obj -> SVGPatternElement
castToSVGPatternElement = castTo gTypeSVGPatternElement "SVGPatternElement"

foreign import javascript unsafe "window[\"SVGPatternElement\"]" gTypeSVGPatternElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPoint".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPoint Mozilla SVGPoint documentation>
newtype SVGPoint = SVGPoint { unSVGPoint :: JSRef }

instance Eq (SVGPoint) where
  (SVGPoint a) == (SVGPoint b) = js_eq a b

instance PToJSRef SVGPoint where
  pToJSRef = unSVGPoint
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPoint where
  pFromJSRef = SVGPoint
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPoint where
  toJSRef = return . unSVGPoint
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPoint where
  fromJSRef = return . fmap SVGPoint . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGPoint where
  toGObject = GObject . unSVGPoint
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPoint . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPoint :: IsGObject obj => obj -> SVGPoint
castToSVGPoint = castTo gTypeSVGPoint "SVGPoint"

foreign import javascript unsafe "window[\"SVGPoint\"]" gTypeSVGPoint :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPointList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPointList Mozilla SVGPointList documentation>
newtype SVGPointList = SVGPointList { unSVGPointList :: JSRef }

instance Eq (SVGPointList) where
  (SVGPointList a) == (SVGPointList b) = js_eq a b

instance PToJSRef SVGPointList where
  pToJSRef = unSVGPointList
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPointList where
  pFromJSRef = SVGPointList
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPointList where
  toJSRef = return . unSVGPointList
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPointList where
  fromJSRef = return . fmap SVGPointList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGPointList where
  toGObject = GObject . unSVGPointList
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPointList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPointList :: IsGObject obj => obj -> SVGPointList
castToSVGPointList = castTo gTypeSVGPointList "SVGPointList"

foreign import javascript unsafe "window[\"SVGPointList\"]" gTypeSVGPointList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPolygonElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPolygonElement Mozilla SVGPolygonElement documentation>
newtype SVGPolygonElement = SVGPolygonElement { unSVGPolygonElement :: JSRef }

instance Eq (SVGPolygonElement) where
  (SVGPolygonElement a) == (SVGPolygonElement b) = js_eq a b

instance PToJSRef SVGPolygonElement where
  pToJSRef = unSVGPolygonElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPolygonElement where
  pFromJSRef = SVGPolygonElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPolygonElement where
  toJSRef = return . unSVGPolygonElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPolygonElement where
  fromJSRef = return . fmap SVGPolygonElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGraphicsElement SVGPolygonElement
instance IsSVGElement SVGPolygonElement
instance IsElement SVGPolygonElement
instance IsNode SVGPolygonElement
instance IsEventTarget SVGPolygonElement
instance IsGObject SVGPolygonElement where
  toGObject = GObject . unSVGPolygonElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPolygonElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPolygonElement :: IsGObject obj => obj -> SVGPolygonElement
castToSVGPolygonElement = castTo gTypeSVGPolygonElement "SVGPolygonElement"

foreign import javascript unsafe "window[\"SVGPolygonElement\"]" gTypeSVGPolygonElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPolylineElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPolylineElement Mozilla SVGPolylineElement documentation>
newtype SVGPolylineElement = SVGPolylineElement { unSVGPolylineElement :: JSRef }

instance Eq (SVGPolylineElement) where
  (SVGPolylineElement a) == (SVGPolylineElement b) = js_eq a b

instance PToJSRef SVGPolylineElement where
  pToJSRef = unSVGPolylineElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPolylineElement where
  pFromJSRef = SVGPolylineElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPolylineElement where
  toJSRef = return . unSVGPolylineElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPolylineElement where
  fromJSRef = return . fmap SVGPolylineElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGraphicsElement SVGPolylineElement
instance IsSVGElement SVGPolylineElement
instance IsElement SVGPolylineElement
instance IsNode SVGPolylineElement
instance IsEventTarget SVGPolylineElement
instance IsGObject SVGPolylineElement where
  toGObject = GObject . unSVGPolylineElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPolylineElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPolylineElement :: IsGObject obj => obj -> SVGPolylineElement
castToSVGPolylineElement = castTo gTypeSVGPolylineElement "SVGPolylineElement"

foreign import javascript unsafe "window[\"SVGPolylineElement\"]" gTypeSVGPolylineElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGPreserveAspectRatio".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGPreserveAspectRatio Mozilla SVGPreserveAspectRatio documentation>
newtype SVGPreserveAspectRatio = SVGPreserveAspectRatio { unSVGPreserveAspectRatio :: JSRef }

instance Eq (SVGPreserveAspectRatio) where
  (SVGPreserveAspectRatio a) == (SVGPreserveAspectRatio b) = js_eq a b

instance PToJSRef SVGPreserveAspectRatio where
  pToJSRef = unSVGPreserveAspectRatio
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGPreserveAspectRatio where
  pFromJSRef = SVGPreserveAspectRatio
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGPreserveAspectRatio where
  toJSRef = return . unSVGPreserveAspectRatio
  {-# INLINE toJSRef #-}

instance FromJSRef SVGPreserveAspectRatio where
  fromJSRef = return . fmap SVGPreserveAspectRatio . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGPreserveAspectRatio where
  toGObject = GObject . unSVGPreserveAspectRatio
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGPreserveAspectRatio . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGPreserveAspectRatio :: IsGObject obj => obj -> SVGPreserveAspectRatio
castToSVGPreserveAspectRatio = castTo gTypeSVGPreserveAspectRatio "SVGPreserveAspectRatio"

foreign import javascript unsafe "window[\"SVGPreserveAspectRatio\"]" gTypeSVGPreserveAspectRatio :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGRadialGradientElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGradientElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGRadialGradientElement Mozilla SVGRadialGradientElement documentation>
newtype SVGRadialGradientElement = SVGRadialGradientElement { unSVGRadialGradientElement :: JSRef }

instance Eq (SVGRadialGradientElement) where
  (SVGRadialGradientElement a) == (SVGRadialGradientElement b) = js_eq a b

instance PToJSRef SVGRadialGradientElement where
  pToJSRef = unSVGRadialGradientElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGRadialGradientElement where
  pFromJSRef = SVGRadialGradientElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGRadialGradientElement where
  toJSRef = return . unSVGRadialGradientElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGRadialGradientElement where
  fromJSRef = return . fmap SVGRadialGradientElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGradientElement SVGRadialGradientElement
instance IsSVGElement SVGRadialGradientElement
instance IsElement SVGRadialGradientElement
instance IsNode SVGRadialGradientElement
instance IsEventTarget SVGRadialGradientElement
instance IsGObject SVGRadialGradientElement where
  toGObject = GObject . unSVGRadialGradientElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGRadialGradientElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGRadialGradientElement :: IsGObject obj => obj -> SVGRadialGradientElement
castToSVGRadialGradientElement = castTo gTypeSVGRadialGradientElement "SVGRadialGradientElement"

foreign import javascript unsafe "window[\"SVGRadialGradientElement\"]" gTypeSVGRadialGradientElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGRect".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGRect Mozilla SVGRect documentation>
newtype SVGRect = SVGRect { unSVGRect :: JSRef }

instance Eq (SVGRect) where
  (SVGRect a) == (SVGRect b) = js_eq a b

instance PToJSRef SVGRect where
  pToJSRef = unSVGRect
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGRect where
  pFromJSRef = SVGRect
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGRect where
  toJSRef = return . unSVGRect
  {-# INLINE toJSRef #-}

instance FromJSRef SVGRect where
  fromJSRef = return . fmap SVGRect . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGRect where
  toGObject = GObject . unSVGRect
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGRect . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGRect :: IsGObject obj => obj -> SVGRect
castToSVGRect = castTo gTypeSVGRect "SVGRect"

foreign import javascript unsafe "window[\"SVGRect\"]" gTypeSVGRect :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGRectElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGRectElement Mozilla SVGRectElement documentation>
newtype SVGRectElement = SVGRectElement { unSVGRectElement :: JSRef }

instance Eq (SVGRectElement) where
  (SVGRectElement a) == (SVGRectElement b) = js_eq a b

instance PToJSRef SVGRectElement where
  pToJSRef = unSVGRectElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGRectElement where
  pFromJSRef = SVGRectElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGRectElement where
  toJSRef = return . unSVGRectElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGRectElement where
  fromJSRef = return . fmap SVGRectElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGraphicsElement SVGRectElement
instance IsSVGElement SVGRectElement
instance IsElement SVGRectElement
instance IsNode SVGRectElement
instance IsEventTarget SVGRectElement
instance IsGObject SVGRectElement where
  toGObject = GObject . unSVGRectElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGRectElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGRectElement :: IsGObject obj => obj -> SVGRectElement
castToSVGRectElement = castTo gTypeSVGRectElement "SVGRectElement"

foreign import javascript unsafe "window[\"SVGRectElement\"]" gTypeSVGRectElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGRenderingIntent".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGRenderingIntent Mozilla SVGRenderingIntent documentation>
newtype SVGRenderingIntent = SVGRenderingIntent { unSVGRenderingIntent :: JSRef }

instance Eq (SVGRenderingIntent) where
  (SVGRenderingIntent a) == (SVGRenderingIntent b) = js_eq a b

instance PToJSRef SVGRenderingIntent where
  pToJSRef = unSVGRenderingIntent
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGRenderingIntent where
  pFromJSRef = SVGRenderingIntent
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGRenderingIntent where
  toJSRef = return . unSVGRenderingIntent
  {-# INLINE toJSRef #-}

instance FromJSRef SVGRenderingIntent where
  fromJSRef = return . fmap SVGRenderingIntent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGRenderingIntent where
  toGObject = GObject . unSVGRenderingIntent
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGRenderingIntent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGRenderingIntent :: IsGObject obj => obj -> SVGRenderingIntent
castToSVGRenderingIntent = castTo gTypeSVGRenderingIntent "SVGRenderingIntent"

foreign import javascript unsafe "window[\"SVGRenderingIntent\"]" gTypeSVGRenderingIntent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGSVGElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGSVGElement Mozilla SVGSVGElement documentation>
newtype SVGSVGElement = SVGSVGElement { unSVGSVGElement :: JSRef }

instance Eq (SVGSVGElement) where
  (SVGSVGElement a) == (SVGSVGElement b) = js_eq a b

instance PToJSRef SVGSVGElement where
  pToJSRef = unSVGSVGElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGSVGElement where
  pFromJSRef = SVGSVGElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGSVGElement where
  toJSRef = return . unSVGSVGElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGSVGElement where
  fromJSRef = return . fmap SVGSVGElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGraphicsElement SVGSVGElement
instance IsSVGElement SVGSVGElement
instance IsElement SVGSVGElement
instance IsNode SVGSVGElement
instance IsEventTarget SVGSVGElement
instance IsGObject SVGSVGElement where
  toGObject = GObject . unSVGSVGElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGSVGElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGSVGElement :: IsGObject obj => obj -> SVGSVGElement
castToSVGSVGElement = castTo gTypeSVGSVGElement "SVGSVGElement"

foreign import javascript unsafe "window[\"SVGSVGElement\"]" gTypeSVGSVGElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGScriptElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGScriptElement Mozilla SVGScriptElement documentation>
newtype SVGScriptElement = SVGScriptElement { unSVGScriptElement :: JSRef }

instance Eq (SVGScriptElement) where
  (SVGScriptElement a) == (SVGScriptElement b) = js_eq a b

instance PToJSRef SVGScriptElement where
  pToJSRef = unSVGScriptElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGScriptElement where
  pFromJSRef = SVGScriptElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGScriptElement where
  toJSRef = return . unSVGScriptElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGScriptElement where
  fromJSRef = return . fmap SVGScriptElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGScriptElement
instance IsElement SVGScriptElement
instance IsNode SVGScriptElement
instance IsEventTarget SVGScriptElement
instance IsGObject SVGScriptElement where
  toGObject = GObject . unSVGScriptElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGScriptElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGScriptElement :: IsGObject obj => obj -> SVGScriptElement
castToSVGScriptElement = castTo gTypeSVGScriptElement "SVGScriptElement"

foreign import javascript unsafe "window[\"SVGScriptElement\"]" gTypeSVGScriptElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGSetElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGAnimationElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGSetElement Mozilla SVGSetElement documentation>
newtype SVGSetElement = SVGSetElement { unSVGSetElement :: JSRef }

instance Eq (SVGSetElement) where
  (SVGSetElement a) == (SVGSetElement b) = js_eq a b

instance PToJSRef SVGSetElement where
  pToJSRef = unSVGSetElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGSetElement where
  pFromJSRef = SVGSetElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGSetElement where
  toJSRef = return . unSVGSetElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGSetElement where
  fromJSRef = return . fmap SVGSetElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGAnimationElement SVGSetElement
instance IsSVGElement SVGSetElement
instance IsElement SVGSetElement
instance IsNode SVGSetElement
instance IsEventTarget SVGSetElement
instance IsGObject SVGSetElement where
  toGObject = GObject . unSVGSetElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGSetElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGSetElement :: IsGObject obj => obj -> SVGSetElement
castToSVGSetElement = castTo gTypeSVGSetElement "SVGSetElement"

foreign import javascript unsafe "window[\"SVGSetElement\"]" gTypeSVGSetElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGStopElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGStopElement Mozilla SVGStopElement documentation>
newtype SVGStopElement = SVGStopElement { unSVGStopElement :: JSRef }

instance Eq (SVGStopElement) where
  (SVGStopElement a) == (SVGStopElement b) = js_eq a b

instance PToJSRef SVGStopElement where
  pToJSRef = unSVGStopElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGStopElement where
  pFromJSRef = SVGStopElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGStopElement where
  toJSRef = return . unSVGStopElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGStopElement where
  fromJSRef = return . fmap SVGStopElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGStopElement
instance IsElement SVGStopElement
instance IsNode SVGStopElement
instance IsEventTarget SVGStopElement
instance IsGObject SVGStopElement where
  toGObject = GObject . unSVGStopElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGStopElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGStopElement :: IsGObject obj => obj -> SVGStopElement
castToSVGStopElement = castTo gTypeSVGStopElement "SVGStopElement"

foreign import javascript unsafe "window[\"SVGStopElement\"]" gTypeSVGStopElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGStringList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGStringList Mozilla SVGStringList documentation>
newtype SVGStringList = SVGStringList { unSVGStringList :: JSRef }

instance Eq (SVGStringList) where
  (SVGStringList a) == (SVGStringList b) = js_eq a b

instance PToJSRef SVGStringList where
  pToJSRef = unSVGStringList
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGStringList where
  pFromJSRef = SVGStringList
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGStringList where
  toJSRef = return . unSVGStringList
  {-# INLINE toJSRef #-}

instance FromJSRef SVGStringList where
  fromJSRef = return . fmap SVGStringList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGStringList where
  toGObject = GObject . unSVGStringList
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGStringList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGStringList :: IsGObject obj => obj -> SVGStringList
castToSVGStringList = castTo gTypeSVGStringList "SVGStringList"

foreign import javascript unsafe "window[\"SVGStringList\"]" gTypeSVGStringList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGStyleElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGStyleElement Mozilla SVGStyleElement documentation>
newtype SVGStyleElement = SVGStyleElement { unSVGStyleElement :: JSRef }

instance Eq (SVGStyleElement) where
  (SVGStyleElement a) == (SVGStyleElement b) = js_eq a b

instance PToJSRef SVGStyleElement where
  pToJSRef = unSVGStyleElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGStyleElement where
  pFromJSRef = SVGStyleElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGStyleElement where
  toJSRef = return . unSVGStyleElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGStyleElement where
  fromJSRef = return . fmap SVGStyleElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGStyleElement
instance IsElement SVGStyleElement
instance IsNode SVGStyleElement
instance IsEventTarget SVGStyleElement
instance IsGObject SVGStyleElement where
  toGObject = GObject . unSVGStyleElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGStyleElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGStyleElement :: IsGObject obj => obj -> SVGStyleElement
castToSVGStyleElement = castTo gTypeSVGStyleElement "SVGStyleElement"

foreign import javascript unsafe "window[\"SVGStyleElement\"]" gTypeSVGStyleElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGSwitchElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGSwitchElement Mozilla SVGSwitchElement documentation>
newtype SVGSwitchElement = SVGSwitchElement { unSVGSwitchElement :: JSRef }

instance Eq (SVGSwitchElement) where
  (SVGSwitchElement a) == (SVGSwitchElement b) = js_eq a b

instance PToJSRef SVGSwitchElement where
  pToJSRef = unSVGSwitchElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGSwitchElement where
  pFromJSRef = SVGSwitchElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGSwitchElement where
  toJSRef = return . unSVGSwitchElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGSwitchElement where
  fromJSRef = return . fmap SVGSwitchElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGraphicsElement SVGSwitchElement
instance IsSVGElement SVGSwitchElement
instance IsElement SVGSwitchElement
instance IsNode SVGSwitchElement
instance IsEventTarget SVGSwitchElement
instance IsGObject SVGSwitchElement where
  toGObject = GObject . unSVGSwitchElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGSwitchElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGSwitchElement :: IsGObject obj => obj -> SVGSwitchElement
castToSVGSwitchElement = castTo gTypeSVGSwitchElement "SVGSwitchElement"

foreign import javascript unsafe "window[\"SVGSwitchElement\"]" gTypeSVGSwitchElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGSymbolElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGSymbolElement Mozilla SVGSymbolElement documentation>
newtype SVGSymbolElement = SVGSymbolElement { unSVGSymbolElement :: JSRef }

instance Eq (SVGSymbolElement) where
  (SVGSymbolElement a) == (SVGSymbolElement b) = js_eq a b

instance PToJSRef SVGSymbolElement where
  pToJSRef = unSVGSymbolElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGSymbolElement where
  pFromJSRef = SVGSymbolElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGSymbolElement where
  toJSRef = return . unSVGSymbolElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGSymbolElement where
  fromJSRef = return . fmap SVGSymbolElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGSymbolElement
instance IsElement SVGSymbolElement
instance IsNode SVGSymbolElement
instance IsEventTarget SVGSymbolElement
instance IsGObject SVGSymbolElement where
  toGObject = GObject . unSVGSymbolElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGSymbolElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGSymbolElement :: IsGObject obj => obj -> SVGSymbolElement
castToSVGSymbolElement = castTo gTypeSVGSymbolElement "SVGSymbolElement"

foreign import javascript unsafe "window[\"SVGSymbolElement\"]" gTypeSVGSymbolElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGTRefElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGTextPositioningElement"
--     * "GHCJS.DOM.SVGTextContentElement"
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGTRefElement Mozilla SVGTRefElement documentation>
newtype SVGTRefElement = SVGTRefElement { unSVGTRefElement :: JSRef }

instance Eq (SVGTRefElement) where
  (SVGTRefElement a) == (SVGTRefElement b) = js_eq a b

instance PToJSRef SVGTRefElement where
  pToJSRef = unSVGTRefElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGTRefElement where
  pFromJSRef = SVGTRefElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGTRefElement where
  toJSRef = return . unSVGTRefElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGTRefElement where
  fromJSRef = return . fmap SVGTRefElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGTextPositioningElement SVGTRefElement
instance IsSVGTextContentElement SVGTRefElement
instance IsSVGGraphicsElement SVGTRefElement
instance IsSVGElement SVGTRefElement
instance IsElement SVGTRefElement
instance IsNode SVGTRefElement
instance IsEventTarget SVGTRefElement
instance IsGObject SVGTRefElement where
  toGObject = GObject . unSVGTRefElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGTRefElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGTRefElement :: IsGObject obj => obj -> SVGTRefElement
castToSVGTRefElement = castTo gTypeSVGTRefElement "SVGTRefElement"

foreign import javascript unsafe "window[\"SVGTRefElement\"]" gTypeSVGTRefElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGTSpanElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGTextPositioningElement"
--     * "GHCJS.DOM.SVGTextContentElement"
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGTSpanElement Mozilla SVGTSpanElement documentation>
newtype SVGTSpanElement = SVGTSpanElement { unSVGTSpanElement :: JSRef }

instance Eq (SVGTSpanElement) where
  (SVGTSpanElement a) == (SVGTSpanElement b) = js_eq a b

instance PToJSRef SVGTSpanElement where
  pToJSRef = unSVGTSpanElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGTSpanElement where
  pFromJSRef = SVGTSpanElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGTSpanElement where
  toJSRef = return . unSVGTSpanElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGTSpanElement where
  fromJSRef = return . fmap SVGTSpanElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGTextPositioningElement SVGTSpanElement
instance IsSVGTextContentElement SVGTSpanElement
instance IsSVGGraphicsElement SVGTSpanElement
instance IsSVGElement SVGTSpanElement
instance IsElement SVGTSpanElement
instance IsNode SVGTSpanElement
instance IsEventTarget SVGTSpanElement
instance IsGObject SVGTSpanElement where
  toGObject = GObject . unSVGTSpanElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGTSpanElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGTSpanElement :: IsGObject obj => obj -> SVGTSpanElement
castToSVGTSpanElement = castTo gTypeSVGTSpanElement "SVGTSpanElement"

foreign import javascript unsafe "window[\"SVGTSpanElement\"]" gTypeSVGTSpanElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGTests".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGTests Mozilla SVGTests documentation>
newtype SVGTests = SVGTests { unSVGTests :: JSRef }

instance Eq (SVGTests) where
  (SVGTests a) == (SVGTests b) = js_eq a b

instance PToJSRef SVGTests where
  pToJSRef = unSVGTests
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGTests where
  pFromJSRef = SVGTests
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGTests where
  toJSRef = return . unSVGTests
  {-# INLINE toJSRef #-}

instance FromJSRef SVGTests where
  fromJSRef = return . fmap SVGTests . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGTests where
  toGObject = GObject . unSVGTests
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGTests . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGTests :: IsGObject obj => obj -> SVGTests
castToSVGTests = castTo gTypeSVGTests "SVGTests"

foreign import javascript unsafe "window[\"SVGTests\"]" gTypeSVGTests :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGTextContentElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGTextContentElement Mozilla SVGTextContentElement documentation>
newtype SVGTextContentElement = SVGTextContentElement { unSVGTextContentElement :: JSRef }

instance Eq (SVGTextContentElement) where
  (SVGTextContentElement a) == (SVGTextContentElement b) = js_eq a b

instance PToJSRef SVGTextContentElement where
  pToJSRef = unSVGTextContentElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGTextContentElement where
  pFromJSRef = SVGTextContentElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGTextContentElement where
  toJSRef = return . unSVGTextContentElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGTextContentElement where
  fromJSRef = return . fmap SVGTextContentElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsSVGGraphicsElement o => IsSVGTextContentElement o
toSVGTextContentElement :: IsSVGTextContentElement o => o -> SVGTextContentElement
toSVGTextContentElement = unsafeCastGObject . toGObject

instance IsSVGTextContentElement SVGTextContentElement
instance IsSVGGraphicsElement SVGTextContentElement
instance IsSVGElement SVGTextContentElement
instance IsElement SVGTextContentElement
instance IsNode SVGTextContentElement
instance IsEventTarget SVGTextContentElement
instance IsGObject SVGTextContentElement where
  toGObject = GObject . unSVGTextContentElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGTextContentElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGTextContentElement :: IsGObject obj => obj -> SVGTextContentElement
castToSVGTextContentElement = castTo gTypeSVGTextContentElement "SVGTextContentElement"

foreign import javascript unsafe "window[\"SVGTextContentElement\"]" gTypeSVGTextContentElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGTextElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGTextPositioningElement"
--     * "GHCJS.DOM.SVGTextContentElement"
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGTextElement Mozilla SVGTextElement documentation>
newtype SVGTextElement = SVGTextElement { unSVGTextElement :: JSRef }

instance Eq (SVGTextElement) where
  (SVGTextElement a) == (SVGTextElement b) = js_eq a b

instance PToJSRef SVGTextElement where
  pToJSRef = unSVGTextElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGTextElement where
  pFromJSRef = SVGTextElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGTextElement where
  toJSRef = return . unSVGTextElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGTextElement where
  fromJSRef = return . fmap SVGTextElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGTextPositioningElement SVGTextElement
instance IsSVGTextContentElement SVGTextElement
instance IsSVGGraphicsElement SVGTextElement
instance IsSVGElement SVGTextElement
instance IsElement SVGTextElement
instance IsNode SVGTextElement
instance IsEventTarget SVGTextElement
instance IsGObject SVGTextElement where
  toGObject = GObject . unSVGTextElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGTextElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGTextElement :: IsGObject obj => obj -> SVGTextElement
castToSVGTextElement = castTo gTypeSVGTextElement "SVGTextElement"

foreign import javascript unsafe "window[\"SVGTextElement\"]" gTypeSVGTextElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGTextPathElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGTextContentElement"
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGTextPathElement Mozilla SVGTextPathElement documentation>
newtype SVGTextPathElement = SVGTextPathElement { unSVGTextPathElement :: JSRef }

instance Eq (SVGTextPathElement) where
  (SVGTextPathElement a) == (SVGTextPathElement b) = js_eq a b

instance PToJSRef SVGTextPathElement where
  pToJSRef = unSVGTextPathElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGTextPathElement where
  pFromJSRef = SVGTextPathElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGTextPathElement where
  toJSRef = return . unSVGTextPathElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGTextPathElement where
  fromJSRef = return . fmap SVGTextPathElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGTextContentElement SVGTextPathElement
instance IsSVGGraphicsElement SVGTextPathElement
instance IsSVGElement SVGTextPathElement
instance IsElement SVGTextPathElement
instance IsNode SVGTextPathElement
instance IsEventTarget SVGTextPathElement
instance IsGObject SVGTextPathElement where
  toGObject = GObject . unSVGTextPathElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGTextPathElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGTextPathElement :: IsGObject obj => obj -> SVGTextPathElement
castToSVGTextPathElement = castTo gTypeSVGTextPathElement "SVGTextPathElement"

foreign import javascript unsafe "window[\"SVGTextPathElement\"]" gTypeSVGTextPathElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGTextPositioningElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGTextContentElement"
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGTextPositioningElement Mozilla SVGTextPositioningElement documentation>
newtype SVGTextPositioningElement = SVGTextPositioningElement { unSVGTextPositioningElement :: JSRef }

instance Eq (SVGTextPositioningElement) where
  (SVGTextPositioningElement a) == (SVGTextPositioningElement b) = js_eq a b

instance PToJSRef SVGTextPositioningElement where
  pToJSRef = unSVGTextPositioningElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGTextPositioningElement where
  pFromJSRef = SVGTextPositioningElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGTextPositioningElement where
  toJSRef = return . unSVGTextPositioningElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGTextPositioningElement where
  fromJSRef = return . fmap SVGTextPositioningElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsSVGTextContentElement o => IsSVGTextPositioningElement o
toSVGTextPositioningElement :: IsSVGTextPositioningElement o => o -> SVGTextPositioningElement
toSVGTextPositioningElement = unsafeCastGObject . toGObject

instance IsSVGTextPositioningElement SVGTextPositioningElement
instance IsSVGTextContentElement SVGTextPositioningElement
instance IsSVGGraphicsElement SVGTextPositioningElement
instance IsSVGElement SVGTextPositioningElement
instance IsElement SVGTextPositioningElement
instance IsNode SVGTextPositioningElement
instance IsEventTarget SVGTextPositioningElement
instance IsGObject SVGTextPositioningElement where
  toGObject = GObject . unSVGTextPositioningElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGTextPositioningElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGTextPositioningElement :: IsGObject obj => obj -> SVGTextPositioningElement
castToSVGTextPositioningElement = castTo gTypeSVGTextPositioningElement "SVGTextPositioningElement"

foreign import javascript unsafe "window[\"SVGTextPositioningElement\"]" gTypeSVGTextPositioningElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGTitleElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGTitleElement Mozilla SVGTitleElement documentation>
newtype SVGTitleElement = SVGTitleElement { unSVGTitleElement :: JSRef }

instance Eq (SVGTitleElement) where
  (SVGTitleElement a) == (SVGTitleElement b) = js_eq a b

instance PToJSRef SVGTitleElement where
  pToJSRef = unSVGTitleElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGTitleElement where
  pFromJSRef = SVGTitleElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGTitleElement where
  toJSRef = return . unSVGTitleElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGTitleElement where
  fromJSRef = return . fmap SVGTitleElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGTitleElement
instance IsElement SVGTitleElement
instance IsNode SVGTitleElement
instance IsEventTarget SVGTitleElement
instance IsGObject SVGTitleElement where
  toGObject = GObject . unSVGTitleElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGTitleElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGTitleElement :: IsGObject obj => obj -> SVGTitleElement
castToSVGTitleElement = castTo gTypeSVGTitleElement "SVGTitleElement"

foreign import javascript unsafe "window[\"SVGTitleElement\"]" gTypeSVGTitleElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGTransform".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGTransform Mozilla SVGTransform documentation>
newtype SVGTransform = SVGTransform { unSVGTransform :: JSRef }

instance Eq (SVGTransform) where
  (SVGTransform a) == (SVGTransform b) = js_eq a b

instance PToJSRef SVGTransform where
  pToJSRef = unSVGTransform
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGTransform where
  pFromJSRef = SVGTransform
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGTransform where
  toJSRef = return . unSVGTransform
  {-# INLINE toJSRef #-}

instance FromJSRef SVGTransform where
  fromJSRef = return . fmap SVGTransform . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGTransform where
  toGObject = GObject . unSVGTransform
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGTransform . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGTransform :: IsGObject obj => obj -> SVGTransform
castToSVGTransform = castTo gTypeSVGTransform "SVGTransform"

foreign import javascript unsafe "window[\"SVGTransform\"]" gTypeSVGTransform :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGTransformList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGTransformList Mozilla SVGTransformList documentation>
newtype SVGTransformList = SVGTransformList { unSVGTransformList :: JSRef }

instance Eq (SVGTransformList) where
  (SVGTransformList a) == (SVGTransformList b) = js_eq a b

instance PToJSRef SVGTransformList where
  pToJSRef = unSVGTransformList
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGTransformList where
  pFromJSRef = SVGTransformList
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGTransformList where
  toJSRef = return . unSVGTransformList
  {-# INLINE toJSRef #-}

instance FromJSRef SVGTransformList where
  fromJSRef = return . fmap SVGTransformList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGTransformList where
  toGObject = GObject . unSVGTransformList
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGTransformList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGTransformList :: IsGObject obj => obj -> SVGTransformList
castToSVGTransformList = castTo gTypeSVGTransformList "SVGTransformList"

foreign import javascript unsafe "window[\"SVGTransformList\"]" gTypeSVGTransformList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGURIReference".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGURIReference Mozilla SVGURIReference documentation>
newtype SVGURIReference = SVGURIReference { unSVGURIReference :: JSRef }

instance Eq (SVGURIReference) where
  (SVGURIReference a) == (SVGURIReference b) = js_eq a b

instance PToJSRef SVGURIReference where
  pToJSRef = unSVGURIReference
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGURIReference where
  pFromJSRef = SVGURIReference
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGURIReference where
  toJSRef = return . unSVGURIReference
  {-# INLINE toJSRef #-}

instance FromJSRef SVGURIReference where
  fromJSRef = return . fmap SVGURIReference . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGURIReference where
  toGObject = GObject . unSVGURIReference
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGURIReference . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGURIReference :: IsGObject obj => obj -> SVGURIReference
castToSVGURIReference = castTo gTypeSVGURIReference "SVGURIReference"

foreign import javascript unsafe "window[\"SVGURIReference\"]" gTypeSVGURIReference :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGUnitTypes".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGUnitTypes Mozilla SVGUnitTypes documentation>
newtype SVGUnitTypes = SVGUnitTypes { unSVGUnitTypes :: JSRef }

instance Eq (SVGUnitTypes) where
  (SVGUnitTypes a) == (SVGUnitTypes b) = js_eq a b

instance PToJSRef SVGUnitTypes where
  pToJSRef = unSVGUnitTypes
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGUnitTypes where
  pFromJSRef = SVGUnitTypes
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGUnitTypes where
  toJSRef = return . unSVGUnitTypes
  {-# INLINE toJSRef #-}

instance FromJSRef SVGUnitTypes where
  fromJSRef = return . fmap SVGUnitTypes . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGUnitTypes where
  toGObject = GObject . unSVGUnitTypes
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGUnitTypes . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGUnitTypes :: IsGObject obj => obj -> SVGUnitTypes
castToSVGUnitTypes = castTo gTypeSVGUnitTypes "SVGUnitTypes"

foreign import javascript unsafe "window[\"SVGUnitTypes\"]" gTypeSVGUnitTypes :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGUseElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGGraphicsElement"
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGUseElement Mozilla SVGUseElement documentation>
newtype SVGUseElement = SVGUseElement { unSVGUseElement :: JSRef }

instance Eq (SVGUseElement) where
  (SVGUseElement a) == (SVGUseElement b) = js_eq a b

instance PToJSRef SVGUseElement where
  pToJSRef = unSVGUseElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGUseElement where
  pFromJSRef = SVGUseElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGUseElement where
  toJSRef = return . unSVGUseElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGUseElement where
  fromJSRef = return . fmap SVGUseElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGGraphicsElement SVGUseElement
instance IsSVGElement SVGUseElement
instance IsElement SVGUseElement
instance IsNode SVGUseElement
instance IsEventTarget SVGUseElement
instance IsGObject SVGUseElement where
  toGObject = GObject . unSVGUseElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGUseElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGUseElement :: IsGObject obj => obj -> SVGUseElement
castToSVGUseElement = castTo gTypeSVGUseElement "SVGUseElement"

foreign import javascript unsafe "window[\"SVGUseElement\"]" gTypeSVGUseElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGVKernElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGVKernElement Mozilla SVGVKernElement documentation>
newtype SVGVKernElement = SVGVKernElement { unSVGVKernElement :: JSRef }

instance Eq (SVGVKernElement) where
  (SVGVKernElement a) == (SVGVKernElement b) = js_eq a b

instance PToJSRef SVGVKernElement where
  pToJSRef = unSVGVKernElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGVKernElement where
  pFromJSRef = SVGVKernElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGVKernElement where
  toJSRef = return . unSVGVKernElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGVKernElement where
  fromJSRef = return . fmap SVGVKernElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGVKernElement
instance IsElement SVGVKernElement
instance IsNode SVGVKernElement
instance IsEventTarget SVGVKernElement
instance IsGObject SVGVKernElement where
  toGObject = GObject . unSVGVKernElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGVKernElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGVKernElement :: IsGObject obj => obj -> SVGVKernElement
castToSVGVKernElement = castTo gTypeSVGVKernElement "SVGVKernElement"

foreign import javascript unsafe "window[\"SVGVKernElement\"]" gTypeSVGVKernElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGViewElement".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.SVGElement"
--     * "GHCJS.DOM.Element"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGViewElement Mozilla SVGViewElement documentation>
newtype SVGViewElement = SVGViewElement { unSVGViewElement :: JSRef }

instance Eq (SVGViewElement) where
  (SVGViewElement a) == (SVGViewElement b) = js_eq a b

instance PToJSRef SVGViewElement where
  pToJSRef = unSVGViewElement
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGViewElement where
  pFromJSRef = SVGViewElement
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGViewElement where
  toJSRef = return . unSVGViewElement
  {-# INLINE toJSRef #-}

instance FromJSRef SVGViewElement where
  fromJSRef = return . fmap SVGViewElement . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsSVGElement SVGViewElement
instance IsElement SVGViewElement
instance IsNode SVGViewElement
instance IsEventTarget SVGViewElement
instance IsGObject SVGViewElement where
  toGObject = GObject . unSVGViewElement
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGViewElement . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGViewElement :: IsGObject obj => obj -> SVGViewElement
castToSVGViewElement = castTo gTypeSVGViewElement "SVGViewElement"

foreign import javascript unsafe "window[\"SVGViewElement\"]" gTypeSVGViewElement :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGViewSpec".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGViewSpec Mozilla SVGViewSpec documentation>
newtype SVGViewSpec = SVGViewSpec { unSVGViewSpec :: JSRef }

instance Eq (SVGViewSpec) where
  (SVGViewSpec a) == (SVGViewSpec b) = js_eq a b

instance PToJSRef SVGViewSpec where
  pToJSRef = unSVGViewSpec
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGViewSpec where
  pFromJSRef = SVGViewSpec
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGViewSpec where
  toJSRef = return . unSVGViewSpec
  {-# INLINE toJSRef #-}

instance FromJSRef SVGViewSpec where
  fromJSRef = return . fmap SVGViewSpec . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGViewSpec where
  toGObject = GObject . unSVGViewSpec
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGViewSpec . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGViewSpec :: IsGObject obj => obj -> SVGViewSpec
castToSVGViewSpec = castTo gTypeSVGViewSpec "SVGViewSpec"

foreign import javascript unsafe "window[\"SVGViewSpec\"]" gTypeSVGViewSpec :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGZoomAndPan".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGZoomAndPan Mozilla SVGZoomAndPan documentation>
newtype SVGZoomAndPan = SVGZoomAndPan { unSVGZoomAndPan :: JSRef }

instance Eq (SVGZoomAndPan) where
  (SVGZoomAndPan a) == (SVGZoomAndPan b) = js_eq a b

instance PToJSRef SVGZoomAndPan where
  pToJSRef = unSVGZoomAndPan
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGZoomAndPan where
  pFromJSRef = SVGZoomAndPan
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGZoomAndPan where
  toJSRef = return . unSVGZoomAndPan
  {-# INLINE toJSRef #-}

instance FromJSRef SVGZoomAndPan where
  fromJSRef = return . fmap SVGZoomAndPan . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SVGZoomAndPan where
  toGObject = GObject . unSVGZoomAndPan
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGZoomAndPan . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGZoomAndPan :: IsGObject obj => obj -> SVGZoomAndPan
castToSVGZoomAndPan = castTo gTypeSVGZoomAndPan "SVGZoomAndPan"

foreign import javascript unsafe "window[\"SVGZoomAndPan\"]" gTypeSVGZoomAndPan :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SVGZoomEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.UIEvent"
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SVGZoomEvent Mozilla SVGZoomEvent documentation>
newtype SVGZoomEvent = SVGZoomEvent { unSVGZoomEvent :: JSRef }

instance Eq (SVGZoomEvent) where
  (SVGZoomEvent a) == (SVGZoomEvent b) = js_eq a b

instance PToJSRef SVGZoomEvent where
  pToJSRef = unSVGZoomEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef SVGZoomEvent where
  pFromJSRef = SVGZoomEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef SVGZoomEvent where
  toJSRef = return . unSVGZoomEvent
  {-# INLINE toJSRef #-}

instance FromJSRef SVGZoomEvent where
  fromJSRef = return . fmap SVGZoomEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsUIEvent SVGZoomEvent
instance IsEvent SVGZoomEvent
instance IsGObject SVGZoomEvent where
  toGObject = GObject . unSVGZoomEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = SVGZoomEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSVGZoomEvent :: IsGObject obj => obj -> SVGZoomEvent
castToSVGZoomEvent = castTo gTypeSVGZoomEvent "SVGZoomEvent"

foreign import javascript unsafe "window[\"SVGZoomEvent\"]" gTypeSVGZoomEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Screen".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Screen Mozilla Screen documentation>
newtype Screen = Screen { unScreen :: JSRef }

instance Eq (Screen) where
  (Screen a) == (Screen b) = js_eq a b

instance PToJSRef Screen where
  pToJSRef = unScreen
  {-# INLINE pToJSRef #-}

instance PFromJSRef Screen where
  pFromJSRef = Screen
  {-# INLINE pFromJSRef #-}

instance ToJSRef Screen where
  toJSRef = return . unScreen
  {-# INLINE toJSRef #-}

instance FromJSRef Screen where
  fromJSRef = return . fmap Screen . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Screen where
  toGObject = GObject . unScreen
  {-# INLINE toGObject #-}
  unsafeCastGObject = Screen . unGObject
  {-# INLINE unsafeCastGObject #-}

castToScreen :: IsGObject obj => obj -> Screen
castToScreen = castTo gTypeScreen "Screen"

foreign import javascript unsafe "window[\"Screen\"]" gTypeScreen :: GType
#else
type IsScreen o = ScreenClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ScriptProcessorNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ScriptProcessorNode Mozilla ScriptProcessorNode documentation>
newtype ScriptProcessorNode = ScriptProcessorNode { unScriptProcessorNode :: JSRef }

instance Eq (ScriptProcessorNode) where
  (ScriptProcessorNode a) == (ScriptProcessorNode b) = js_eq a b

instance PToJSRef ScriptProcessorNode where
  pToJSRef = unScriptProcessorNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef ScriptProcessorNode where
  pFromJSRef = ScriptProcessorNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef ScriptProcessorNode where
  toJSRef = return . unScriptProcessorNode
  {-# INLINE toJSRef #-}

instance FromJSRef ScriptProcessorNode where
  fromJSRef = return . fmap ScriptProcessorNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode ScriptProcessorNode
instance IsEventTarget ScriptProcessorNode
instance IsGObject ScriptProcessorNode where
  toGObject = GObject . unScriptProcessorNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = ScriptProcessorNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToScriptProcessorNode :: IsGObject obj => obj -> ScriptProcessorNode
castToScriptProcessorNode = castTo gTypeScriptProcessorNode "ScriptProcessorNode"

foreign import javascript unsafe "window[\"ScriptProcessorNode\"]" gTypeScriptProcessorNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ScriptProfile".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ScriptProfile Mozilla ScriptProfile documentation>
newtype ScriptProfile = ScriptProfile { unScriptProfile :: JSRef }

instance Eq (ScriptProfile) where
  (ScriptProfile a) == (ScriptProfile b) = js_eq a b

instance PToJSRef ScriptProfile where
  pToJSRef = unScriptProfile
  {-# INLINE pToJSRef #-}

instance PFromJSRef ScriptProfile where
  pFromJSRef = ScriptProfile
  {-# INLINE pFromJSRef #-}

instance ToJSRef ScriptProfile where
  toJSRef = return . unScriptProfile
  {-# INLINE toJSRef #-}

instance FromJSRef ScriptProfile where
  fromJSRef = return . fmap ScriptProfile . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject ScriptProfile where
  toGObject = GObject . unScriptProfile
  {-# INLINE toGObject #-}
  unsafeCastGObject = ScriptProfile . unGObject
  {-# INLINE unsafeCastGObject #-}

castToScriptProfile :: IsGObject obj => obj -> ScriptProfile
castToScriptProfile = castTo gTypeScriptProfile "ScriptProfile"

foreign import javascript unsafe "window[\"ScriptProfile\"]" gTypeScriptProfile :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ScriptProfileNode".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ScriptProfileNode Mozilla ScriptProfileNode documentation>
newtype ScriptProfileNode = ScriptProfileNode { unScriptProfileNode :: JSRef }

instance Eq (ScriptProfileNode) where
  (ScriptProfileNode a) == (ScriptProfileNode b) = js_eq a b

instance PToJSRef ScriptProfileNode where
  pToJSRef = unScriptProfileNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef ScriptProfileNode where
  pFromJSRef = ScriptProfileNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef ScriptProfileNode where
  toJSRef = return . unScriptProfileNode
  {-# INLINE toJSRef #-}

instance FromJSRef ScriptProfileNode where
  fromJSRef = return . fmap ScriptProfileNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject ScriptProfileNode where
  toGObject = GObject . unScriptProfileNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = ScriptProfileNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToScriptProfileNode :: IsGObject obj => obj -> ScriptProfileNode
castToScriptProfileNode = castTo gTypeScriptProfileNode "ScriptProfileNode"

foreign import javascript unsafe "window[\"ScriptProfileNode\"]" gTypeScriptProfileNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SecurityPolicy".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SecurityPolicy Mozilla SecurityPolicy documentation>
newtype SecurityPolicy = SecurityPolicy { unSecurityPolicy :: JSRef }

instance Eq (SecurityPolicy) where
  (SecurityPolicy a) == (SecurityPolicy b) = js_eq a b

instance PToJSRef SecurityPolicy where
  pToJSRef = unSecurityPolicy
  {-# INLINE pToJSRef #-}

instance PFromJSRef SecurityPolicy where
  pFromJSRef = SecurityPolicy
  {-# INLINE pFromJSRef #-}

instance ToJSRef SecurityPolicy where
  toJSRef = return . unSecurityPolicy
  {-# INLINE toJSRef #-}

instance FromJSRef SecurityPolicy where
  fromJSRef = return . fmap SecurityPolicy . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SecurityPolicy where
  toGObject = GObject . unSecurityPolicy
  {-# INLINE toGObject #-}
  unsafeCastGObject = SecurityPolicy . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSecurityPolicy :: IsGObject obj => obj -> SecurityPolicy
castToSecurityPolicy = castTo gTypeSecurityPolicy "SecurityPolicy"

foreign import javascript unsafe "window[\"SecurityPolicy\"]" gTypeSecurityPolicy :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsSecurityPolicy o = SecurityPolicyClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SecurityPolicyViolationEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SecurityPolicyViolationEvent Mozilla SecurityPolicyViolationEvent documentation>
newtype SecurityPolicyViolationEvent = SecurityPolicyViolationEvent { unSecurityPolicyViolationEvent :: JSRef }

instance Eq (SecurityPolicyViolationEvent) where
  (SecurityPolicyViolationEvent a) == (SecurityPolicyViolationEvent b) = js_eq a b

instance PToJSRef SecurityPolicyViolationEvent where
  pToJSRef = unSecurityPolicyViolationEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef SecurityPolicyViolationEvent where
  pFromJSRef = SecurityPolicyViolationEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef SecurityPolicyViolationEvent where
  toJSRef = return . unSecurityPolicyViolationEvent
  {-# INLINE toJSRef #-}

instance FromJSRef SecurityPolicyViolationEvent where
  fromJSRef = return . fmap SecurityPolicyViolationEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent SecurityPolicyViolationEvent
instance IsGObject SecurityPolicyViolationEvent where
  toGObject = GObject . unSecurityPolicyViolationEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = SecurityPolicyViolationEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSecurityPolicyViolationEvent :: IsGObject obj => obj -> SecurityPolicyViolationEvent
castToSecurityPolicyViolationEvent = castTo gTypeSecurityPolicyViolationEvent "SecurityPolicyViolationEvent"

foreign import javascript unsafe "window[\"SecurityPolicyViolationEvent\"]" gTypeSecurityPolicyViolationEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Selection".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Selection Mozilla Selection documentation>
newtype Selection = Selection { unSelection :: JSRef }

instance Eq (Selection) where
  (Selection a) == (Selection b) = js_eq a b

instance PToJSRef Selection where
  pToJSRef = unSelection
  {-# INLINE pToJSRef #-}

instance PFromJSRef Selection where
  pFromJSRef = Selection
  {-# INLINE pFromJSRef #-}

instance ToJSRef Selection where
  toJSRef = return . unSelection
  {-# INLINE toJSRef #-}

instance FromJSRef Selection where
  fromJSRef = return . fmap Selection . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Selection where
  toGObject = GObject . unSelection
  {-# INLINE toGObject #-}
  unsafeCastGObject = Selection . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSelection :: IsGObject obj => obj -> Selection
castToSelection = castTo gTypeSelection "Selection"

foreign import javascript unsafe "window[\"Selection\"]" gTypeSelection :: GType
#else
type IsSelection o = SelectionClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SourceBuffer".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SourceBuffer Mozilla SourceBuffer documentation>
newtype SourceBuffer = SourceBuffer { unSourceBuffer :: JSRef }

instance Eq (SourceBuffer) where
  (SourceBuffer a) == (SourceBuffer b) = js_eq a b

instance PToJSRef SourceBuffer where
  pToJSRef = unSourceBuffer
  {-# INLINE pToJSRef #-}

instance PFromJSRef SourceBuffer where
  pFromJSRef = SourceBuffer
  {-# INLINE pFromJSRef #-}

instance ToJSRef SourceBuffer where
  toJSRef = return . unSourceBuffer
  {-# INLINE toJSRef #-}

instance FromJSRef SourceBuffer where
  fromJSRef = return . fmap SourceBuffer . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget SourceBuffer
instance IsGObject SourceBuffer where
  toGObject = GObject . unSourceBuffer
  {-# INLINE toGObject #-}
  unsafeCastGObject = SourceBuffer . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSourceBuffer :: IsGObject obj => obj -> SourceBuffer
castToSourceBuffer = castTo gTypeSourceBuffer "SourceBuffer"

foreign import javascript unsafe "window[\"SourceBuffer\"]" gTypeSourceBuffer :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SourceBufferList".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SourceBufferList Mozilla SourceBufferList documentation>
newtype SourceBufferList = SourceBufferList { unSourceBufferList :: JSRef }

instance Eq (SourceBufferList) where
  (SourceBufferList a) == (SourceBufferList b) = js_eq a b

instance PToJSRef SourceBufferList where
  pToJSRef = unSourceBufferList
  {-# INLINE pToJSRef #-}

instance PFromJSRef SourceBufferList where
  pFromJSRef = SourceBufferList
  {-# INLINE pFromJSRef #-}

instance ToJSRef SourceBufferList where
  toJSRef = return . unSourceBufferList
  {-# INLINE toJSRef #-}

instance FromJSRef SourceBufferList where
  fromJSRef = return . fmap SourceBufferList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget SourceBufferList
instance IsGObject SourceBufferList where
  toGObject = GObject . unSourceBufferList
  {-# INLINE toGObject #-}
  unsafeCastGObject = SourceBufferList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSourceBufferList :: IsGObject obj => obj -> SourceBufferList
castToSourceBufferList = castTo gTypeSourceBufferList "SourceBufferList"

foreign import javascript unsafe "window[\"SourceBufferList\"]" gTypeSourceBufferList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SourceInfo".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SourceInfo Mozilla SourceInfo documentation>
newtype SourceInfo = SourceInfo { unSourceInfo :: JSRef }

instance Eq (SourceInfo) where
  (SourceInfo a) == (SourceInfo b) = js_eq a b

instance PToJSRef SourceInfo where
  pToJSRef = unSourceInfo
  {-# INLINE pToJSRef #-}

instance PFromJSRef SourceInfo where
  pFromJSRef = SourceInfo
  {-# INLINE pFromJSRef #-}

instance ToJSRef SourceInfo where
  toJSRef = return . unSourceInfo
  {-# INLINE toJSRef #-}

instance FromJSRef SourceInfo where
  fromJSRef = return . fmap SourceInfo . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SourceInfo where
  toGObject = GObject . unSourceInfo
  {-# INLINE toGObject #-}
  unsafeCastGObject = SourceInfo . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSourceInfo :: IsGObject obj => obj -> SourceInfo
castToSourceInfo = castTo gTypeSourceInfo "SourceInfo"

foreign import javascript unsafe "window[\"SourceInfo\"]" gTypeSourceInfo :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SpeechSynthesis".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis Mozilla SpeechSynthesis documentation>
newtype SpeechSynthesis = SpeechSynthesis { unSpeechSynthesis :: JSRef }

instance Eq (SpeechSynthesis) where
  (SpeechSynthesis a) == (SpeechSynthesis b) = js_eq a b

instance PToJSRef SpeechSynthesis where
  pToJSRef = unSpeechSynthesis
  {-# INLINE pToJSRef #-}

instance PFromJSRef SpeechSynthesis where
  pFromJSRef = SpeechSynthesis
  {-# INLINE pFromJSRef #-}

instance ToJSRef SpeechSynthesis where
  toJSRef = return . unSpeechSynthesis
  {-# INLINE toJSRef #-}

instance FromJSRef SpeechSynthesis where
  fromJSRef = return . fmap SpeechSynthesis . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SpeechSynthesis where
  toGObject = GObject . unSpeechSynthesis
  {-# INLINE toGObject #-}
  unsafeCastGObject = SpeechSynthesis . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSpeechSynthesis :: IsGObject obj => obj -> SpeechSynthesis
castToSpeechSynthesis = castTo gTypeSpeechSynthesis "SpeechSynthesis"

foreign import javascript unsafe "window[\"SpeechSynthesis\"]" gTypeSpeechSynthesis :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SpeechSynthesisEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisEvent Mozilla SpeechSynthesisEvent documentation>
newtype SpeechSynthesisEvent = SpeechSynthesisEvent { unSpeechSynthesisEvent :: JSRef }

instance Eq (SpeechSynthesisEvent) where
  (SpeechSynthesisEvent a) == (SpeechSynthesisEvent b) = js_eq a b

instance PToJSRef SpeechSynthesisEvent where
  pToJSRef = unSpeechSynthesisEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef SpeechSynthesisEvent where
  pFromJSRef = SpeechSynthesisEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef SpeechSynthesisEvent where
  toJSRef = return . unSpeechSynthesisEvent
  {-# INLINE toJSRef #-}

instance FromJSRef SpeechSynthesisEvent where
  fromJSRef = return . fmap SpeechSynthesisEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent SpeechSynthesisEvent
instance IsGObject SpeechSynthesisEvent where
  toGObject = GObject . unSpeechSynthesisEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = SpeechSynthesisEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSpeechSynthesisEvent :: IsGObject obj => obj -> SpeechSynthesisEvent
castToSpeechSynthesisEvent = castTo gTypeSpeechSynthesisEvent "SpeechSynthesisEvent"

foreign import javascript unsafe "window[\"SpeechSynthesisEvent\"]" gTypeSpeechSynthesisEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SpeechSynthesisUtterance".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance Mozilla SpeechSynthesisUtterance documentation>
newtype SpeechSynthesisUtterance = SpeechSynthesisUtterance { unSpeechSynthesisUtterance :: JSRef }

instance Eq (SpeechSynthesisUtterance) where
  (SpeechSynthesisUtterance a) == (SpeechSynthesisUtterance b) = js_eq a b

instance PToJSRef SpeechSynthesisUtterance where
  pToJSRef = unSpeechSynthesisUtterance
  {-# INLINE pToJSRef #-}

instance PFromJSRef SpeechSynthesisUtterance where
  pFromJSRef = SpeechSynthesisUtterance
  {-# INLINE pFromJSRef #-}

instance ToJSRef SpeechSynthesisUtterance where
  toJSRef = return . unSpeechSynthesisUtterance
  {-# INLINE toJSRef #-}

instance FromJSRef SpeechSynthesisUtterance where
  fromJSRef = return . fmap SpeechSynthesisUtterance . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget SpeechSynthesisUtterance
instance IsGObject SpeechSynthesisUtterance where
  toGObject = GObject . unSpeechSynthesisUtterance
  {-# INLINE toGObject #-}
  unsafeCastGObject = SpeechSynthesisUtterance . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSpeechSynthesisUtterance :: IsGObject obj => obj -> SpeechSynthesisUtterance
castToSpeechSynthesisUtterance = castTo gTypeSpeechSynthesisUtterance "SpeechSynthesisUtterance"

foreign import javascript unsafe "window[\"SpeechSynthesisUtterance\"]" gTypeSpeechSynthesisUtterance :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SpeechSynthesisVoice".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisVoice Mozilla SpeechSynthesisVoice documentation>
newtype SpeechSynthesisVoice = SpeechSynthesisVoice { unSpeechSynthesisVoice :: JSRef }

instance Eq (SpeechSynthesisVoice) where
  (SpeechSynthesisVoice a) == (SpeechSynthesisVoice b) = js_eq a b

instance PToJSRef SpeechSynthesisVoice where
  pToJSRef = unSpeechSynthesisVoice
  {-# INLINE pToJSRef #-}

instance PFromJSRef SpeechSynthesisVoice where
  pFromJSRef = SpeechSynthesisVoice
  {-# INLINE pFromJSRef #-}

instance ToJSRef SpeechSynthesisVoice where
  toJSRef = return . unSpeechSynthesisVoice
  {-# INLINE toJSRef #-}

instance FromJSRef SpeechSynthesisVoice where
  fromJSRef = return . fmap SpeechSynthesisVoice . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SpeechSynthesisVoice where
  toGObject = GObject . unSpeechSynthesisVoice
  {-# INLINE toGObject #-}
  unsafeCastGObject = SpeechSynthesisVoice . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSpeechSynthesisVoice :: IsGObject obj => obj -> SpeechSynthesisVoice
castToSpeechSynthesisVoice = castTo gTypeSpeechSynthesisVoice "SpeechSynthesisVoice"

foreign import javascript unsafe "window[\"SpeechSynthesisVoice\"]" gTypeSpeechSynthesisVoice :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Storage".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Storage Mozilla Storage documentation>
newtype Storage = Storage { unStorage :: JSRef }

instance Eq (Storage) where
  (Storage a) == (Storage b) = js_eq a b

instance PToJSRef Storage where
  pToJSRef = unStorage
  {-# INLINE pToJSRef #-}

instance PFromJSRef Storage where
  pFromJSRef = Storage
  {-# INLINE pFromJSRef #-}

instance ToJSRef Storage where
  toJSRef = return . unStorage
  {-# INLINE toJSRef #-}

instance FromJSRef Storage where
  fromJSRef = return . fmap Storage . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Storage where
  toGObject = GObject . unStorage
  {-# INLINE toGObject #-}
  unsafeCastGObject = Storage . unGObject
  {-# INLINE unsafeCastGObject #-}

castToStorage :: IsGObject obj => obj -> Storage
castToStorage = castTo gTypeStorage "Storage"

foreign import javascript unsafe "window[\"Storage\"]" gTypeStorage :: GType
#else
type IsStorage o = StorageClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.StorageEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/StorageEvent Mozilla StorageEvent documentation>
newtype StorageEvent = StorageEvent { unStorageEvent :: JSRef }

instance Eq (StorageEvent) where
  (StorageEvent a) == (StorageEvent b) = js_eq a b

instance PToJSRef StorageEvent where
  pToJSRef = unStorageEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef StorageEvent where
  pFromJSRef = StorageEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef StorageEvent where
  toJSRef = return . unStorageEvent
  {-# INLINE toJSRef #-}

instance FromJSRef StorageEvent where
  fromJSRef = return . fmap StorageEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent StorageEvent
instance IsGObject StorageEvent where
  toGObject = GObject . unStorageEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = StorageEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToStorageEvent :: IsGObject obj => obj -> StorageEvent
castToStorageEvent = castTo gTypeStorageEvent "StorageEvent"

foreign import javascript unsafe "window[\"StorageEvent\"]" gTypeStorageEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.StorageInfo".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/StorageInfo Mozilla StorageInfo documentation>
newtype StorageInfo = StorageInfo { unStorageInfo :: JSRef }

instance Eq (StorageInfo) where
  (StorageInfo a) == (StorageInfo b) = js_eq a b

instance PToJSRef StorageInfo where
  pToJSRef = unStorageInfo
  {-# INLINE pToJSRef #-}

instance PFromJSRef StorageInfo where
  pFromJSRef = StorageInfo
  {-# INLINE pFromJSRef #-}

instance ToJSRef StorageInfo where
  toJSRef = return . unStorageInfo
  {-# INLINE toJSRef #-}

instance FromJSRef StorageInfo where
  fromJSRef = return . fmap StorageInfo . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject StorageInfo where
  toGObject = GObject . unStorageInfo
  {-# INLINE toGObject #-}
  unsafeCastGObject = StorageInfo . unGObject
  {-# INLINE unsafeCastGObject #-}

castToStorageInfo :: IsGObject obj => obj -> StorageInfo
castToStorageInfo = castTo gTypeStorageInfo "StorageInfo"

foreign import javascript unsafe "window[\"StorageInfo\"]" gTypeStorageInfo :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsStorageInfo o = StorageInfoClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.StorageQuota".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/StorageQuota Mozilla StorageQuota documentation>
newtype StorageQuota = StorageQuota { unStorageQuota :: JSRef }

instance Eq (StorageQuota) where
  (StorageQuota a) == (StorageQuota b) = js_eq a b

instance PToJSRef StorageQuota where
  pToJSRef = unStorageQuota
  {-# INLINE pToJSRef #-}

instance PFromJSRef StorageQuota where
  pFromJSRef = StorageQuota
  {-# INLINE pFromJSRef #-}

instance ToJSRef StorageQuota where
  toJSRef = return . unStorageQuota
  {-# INLINE toJSRef #-}

instance FromJSRef StorageQuota where
  fromJSRef = return . fmap StorageQuota . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject StorageQuota where
  toGObject = GObject . unStorageQuota
  {-# INLINE toGObject #-}
  unsafeCastGObject = StorageQuota . unGObject
  {-# INLINE unsafeCastGObject #-}

castToStorageQuota :: IsGObject obj => obj -> StorageQuota
castToStorageQuota = castTo gTypeStorageQuota "StorageQuota"

foreign import javascript unsafe "window[\"StorageQuota\"]" gTypeStorageQuota :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsStorageQuota o = StorageQuotaClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.StyleMedia".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/StyleMedia Mozilla StyleMedia documentation>
newtype StyleMedia = StyleMedia { unStyleMedia :: JSRef }

instance Eq (StyleMedia) where
  (StyleMedia a) == (StyleMedia b) = js_eq a b

instance PToJSRef StyleMedia where
  pToJSRef = unStyleMedia
  {-# INLINE pToJSRef #-}

instance PFromJSRef StyleMedia where
  pFromJSRef = StyleMedia
  {-# INLINE pFromJSRef #-}

instance ToJSRef StyleMedia where
  toJSRef = return . unStyleMedia
  {-# INLINE toJSRef #-}

instance FromJSRef StyleMedia where
  fromJSRef = return . fmap StyleMedia . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject StyleMedia where
  toGObject = GObject . unStyleMedia
  {-# INLINE toGObject #-}
  unsafeCastGObject = StyleMedia . unGObject
  {-# INLINE unsafeCastGObject #-}

castToStyleMedia :: IsGObject obj => obj -> StyleMedia
castToStyleMedia = castTo gTypeStyleMedia "StyleMedia"

foreign import javascript unsafe "window[\"StyleMedia\"]" gTypeStyleMedia :: GType
#else
type IsStyleMedia o = StyleMediaClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.StyleSheet".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/StyleSheet Mozilla StyleSheet documentation>
newtype StyleSheet = StyleSheet { unStyleSheet :: JSRef }

instance Eq (StyleSheet) where
  (StyleSheet a) == (StyleSheet b) = js_eq a b

instance PToJSRef StyleSheet where
  pToJSRef = unStyleSheet
  {-# INLINE pToJSRef #-}

instance PFromJSRef StyleSheet where
  pFromJSRef = StyleSheet
  {-# INLINE pFromJSRef #-}

instance ToJSRef StyleSheet where
  toJSRef = return . unStyleSheet
  {-# INLINE toJSRef #-}

instance FromJSRef StyleSheet where
  fromJSRef = return . fmap StyleSheet . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsGObject o => IsStyleSheet o
toStyleSheet :: IsStyleSheet o => o -> StyleSheet
toStyleSheet = unsafeCastGObject . toGObject

instance IsStyleSheet StyleSheet
instance IsGObject StyleSheet where
  toGObject = GObject . unStyleSheet
  {-# INLINE toGObject #-}
  unsafeCastGObject = StyleSheet . unGObject
  {-# INLINE unsafeCastGObject #-}

castToStyleSheet :: IsGObject obj => obj -> StyleSheet
castToStyleSheet = castTo gTypeStyleSheet "StyleSheet"

foreign import javascript unsafe "window[\"StyleSheet\"]" gTypeStyleSheet :: GType
#else
type IsStyleSheet o = StyleSheetClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.StyleSheetList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/StyleSheetList Mozilla StyleSheetList documentation>
newtype StyleSheetList = StyleSheetList { unStyleSheetList :: JSRef }

instance Eq (StyleSheetList) where
  (StyleSheetList a) == (StyleSheetList b) = js_eq a b

instance PToJSRef StyleSheetList where
  pToJSRef = unStyleSheetList
  {-# INLINE pToJSRef #-}

instance PFromJSRef StyleSheetList where
  pFromJSRef = StyleSheetList
  {-# INLINE pFromJSRef #-}

instance ToJSRef StyleSheetList where
  toJSRef = return . unStyleSheetList
  {-# INLINE toJSRef #-}

instance FromJSRef StyleSheetList where
  fromJSRef = return . fmap StyleSheetList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject StyleSheetList where
  toGObject = GObject . unStyleSheetList
  {-# INLINE toGObject #-}
  unsafeCastGObject = StyleSheetList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToStyleSheetList :: IsGObject obj => obj -> StyleSheetList
castToStyleSheetList = castTo gTypeStyleSheetList "StyleSheetList"

foreign import javascript unsafe "window[\"StyleSheetList\"]" gTypeStyleSheetList :: GType
#else
type IsStyleSheetList o = StyleSheetListClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.SubtleCrypto".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitSubtleCrypto Mozilla WebKitSubtleCrypto documentation>
newtype SubtleCrypto = SubtleCrypto { unSubtleCrypto :: JSRef }

instance Eq (SubtleCrypto) where
  (SubtleCrypto a) == (SubtleCrypto b) = js_eq a b

instance PToJSRef SubtleCrypto where
  pToJSRef = unSubtleCrypto
  {-# INLINE pToJSRef #-}

instance PFromJSRef SubtleCrypto where
  pFromJSRef = SubtleCrypto
  {-# INLINE pFromJSRef #-}

instance ToJSRef SubtleCrypto where
  toJSRef = return . unSubtleCrypto
  {-# INLINE toJSRef #-}

instance FromJSRef SubtleCrypto where
  fromJSRef = return . fmap SubtleCrypto . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject SubtleCrypto where
  toGObject = GObject . unSubtleCrypto
  {-# INLINE toGObject #-}
  unsafeCastGObject = SubtleCrypto . unGObject
  {-# INLINE unsafeCastGObject #-}

castToSubtleCrypto :: IsGObject obj => obj -> SubtleCrypto
castToSubtleCrypto = castTo gTypeSubtleCrypto "SubtleCrypto"

foreign import javascript unsafe "window[\"WebKitSubtleCrypto\"]" gTypeSubtleCrypto :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Text".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CharacterData"
--     * "GHCJS.DOM.Node"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Text Mozilla Text documentation>
newtype Text = Text { unText :: JSRef }

instance Eq (Text) where
  (Text a) == (Text b) = js_eq a b

instance PToJSRef Text where
  pToJSRef = unText
  {-# INLINE pToJSRef #-}

instance PFromJSRef Text where
  pFromJSRef = Text
  {-# INLINE pFromJSRef #-}

instance ToJSRef Text where
  toJSRef = return . unText
  {-# INLINE toJSRef #-}

instance FromJSRef Text where
  fromJSRef = return . fmap Text . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsCharacterData o => IsText o
toText :: IsText o => o -> Text
toText = unsafeCastGObject . toGObject

instance IsText Text
instance IsCharacterData Text
instance IsNode Text
instance IsEventTarget Text
instance IsGObject Text where
  toGObject = GObject . unText
  {-# INLINE toGObject #-}
  unsafeCastGObject = Text . unGObject
  {-# INLINE unsafeCastGObject #-}

castToText :: IsGObject obj => obj -> Text
castToText = castTo gTypeText "Text"

foreign import javascript unsafe "window[\"Text\"]" gTypeText :: GType
#else
type IsText o = TextClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.TextEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.UIEvent"
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/TextEvent Mozilla TextEvent documentation>
newtype TextEvent = TextEvent { unTextEvent :: JSRef }

instance Eq (TextEvent) where
  (TextEvent a) == (TextEvent b) = js_eq a b

instance PToJSRef TextEvent where
  pToJSRef = unTextEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef TextEvent where
  pFromJSRef = TextEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef TextEvent where
  toJSRef = return . unTextEvent
  {-# INLINE toJSRef #-}

instance FromJSRef TextEvent where
  fromJSRef = return . fmap TextEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsUIEvent TextEvent
instance IsEvent TextEvent
instance IsGObject TextEvent where
  toGObject = GObject . unTextEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = TextEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToTextEvent :: IsGObject obj => obj -> TextEvent
castToTextEvent = castTo gTypeTextEvent "TextEvent"

foreign import javascript unsafe "window[\"TextEvent\"]" gTypeTextEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.TextMetrics".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/TextMetrics Mozilla TextMetrics documentation>
newtype TextMetrics = TextMetrics { unTextMetrics :: JSRef }

instance Eq (TextMetrics) where
  (TextMetrics a) == (TextMetrics b) = js_eq a b

instance PToJSRef TextMetrics where
  pToJSRef = unTextMetrics
  {-# INLINE pToJSRef #-}

instance PFromJSRef TextMetrics where
  pFromJSRef = TextMetrics
  {-# INLINE pFromJSRef #-}

instance ToJSRef TextMetrics where
  toJSRef = return . unTextMetrics
  {-# INLINE toJSRef #-}

instance FromJSRef TextMetrics where
  fromJSRef = return . fmap TextMetrics . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject TextMetrics where
  toGObject = GObject . unTextMetrics
  {-# INLINE toGObject #-}
  unsafeCastGObject = TextMetrics . unGObject
  {-# INLINE unsafeCastGObject #-}

castToTextMetrics :: IsGObject obj => obj -> TextMetrics
castToTextMetrics = castTo gTypeTextMetrics "TextMetrics"

foreign import javascript unsafe "window[\"TextMetrics\"]" gTypeTextMetrics :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.TextTrack".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/TextTrack Mozilla TextTrack documentation>
newtype TextTrack = TextTrack { unTextTrack :: JSRef }

instance Eq (TextTrack) where
  (TextTrack a) == (TextTrack b) = js_eq a b

instance PToJSRef TextTrack where
  pToJSRef = unTextTrack
  {-# INLINE pToJSRef #-}

instance PFromJSRef TextTrack where
  pFromJSRef = TextTrack
  {-# INLINE pFromJSRef #-}

instance ToJSRef TextTrack where
  toJSRef = return . unTextTrack
  {-# INLINE toJSRef #-}

instance FromJSRef TextTrack where
  fromJSRef = return . fmap TextTrack . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget TextTrack
instance IsGObject TextTrack where
  toGObject = GObject . unTextTrack
  {-# INLINE toGObject #-}
  unsafeCastGObject = TextTrack . unGObject
  {-# INLINE unsafeCastGObject #-}

castToTextTrack :: IsGObject obj => obj -> TextTrack
castToTextTrack = castTo gTypeTextTrack "TextTrack"

foreign import javascript unsafe "window[\"TextTrack\"]" gTypeTextTrack :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsTextTrack o = TextTrackClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.TextTrackCue".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/TextTrackCue Mozilla TextTrackCue documentation>
newtype TextTrackCue = TextTrackCue { unTextTrackCue :: JSRef }

instance Eq (TextTrackCue) where
  (TextTrackCue a) == (TextTrackCue b) = js_eq a b

instance PToJSRef TextTrackCue where
  pToJSRef = unTextTrackCue
  {-# INLINE pToJSRef #-}

instance PFromJSRef TextTrackCue where
  pFromJSRef = TextTrackCue
  {-# INLINE pFromJSRef #-}

instance ToJSRef TextTrackCue where
  toJSRef = return . unTextTrackCue
  {-# INLINE toJSRef #-}

instance FromJSRef TextTrackCue where
  fromJSRef = return . fmap TextTrackCue . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsEventTarget o => IsTextTrackCue o
toTextTrackCue :: IsTextTrackCue o => o -> TextTrackCue
toTextTrackCue = unsafeCastGObject . toGObject

instance IsTextTrackCue TextTrackCue
instance IsEventTarget TextTrackCue
instance IsGObject TextTrackCue where
  toGObject = GObject . unTextTrackCue
  {-# INLINE toGObject #-}
  unsafeCastGObject = TextTrackCue . unGObject
  {-# INLINE unsafeCastGObject #-}

castToTextTrackCue :: IsGObject obj => obj -> TextTrackCue
castToTextTrackCue = castTo gTypeTextTrackCue "TextTrackCue"

foreign import javascript unsafe "window[\"TextTrackCue\"]" gTypeTextTrackCue :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsTextTrackCue o = TextTrackCueClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.TextTrackCueList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/TextTrackCueList Mozilla TextTrackCueList documentation>
newtype TextTrackCueList = TextTrackCueList { unTextTrackCueList :: JSRef }

instance Eq (TextTrackCueList) where
  (TextTrackCueList a) == (TextTrackCueList b) = js_eq a b

instance PToJSRef TextTrackCueList where
  pToJSRef = unTextTrackCueList
  {-# INLINE pToJSRef #-}

instance PFromJSRef TextTrackCueList where
  pFromJSRef = TextTrackCueList
  {-# INLINE pFromJSRef #-}

instance ToJSRef TextTrackCueList where
  toJSRef = return . unTextTrackCueList
  {-# INLINE toJSRef #-}

instance FromJSRef TextTrackCueList where
  fromJSRef = return . fmap TextTrackCueList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject TextTrackCueList where
  toGObject = GObject . unTextTrackCueList
  {-# INLINE toGObject #-}
  unsafeCastGObject = TextTrackCueList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToTextTrackCueList :: IsGObject obj => obj -> TextTrackCueList
castToTextTrackCueList = castTo gTypeTextTrackCueList "TextTrackCueList"

foreign import javascript unsafe "window[\"TextTrackCueList\"]" gTypeTextTrackCueList :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsTextTrackCueList o = TextTrackCueListClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.TextTrackList".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/TextTrackList Mozilla TextTrackList documentation>
newtype TextTrackList = TextTrackList { unTextTrackList :: JSRef }

instance Eq (TextTrackList) where
  (TextTrackList a) == (TextTrackList b) = js_eq a b

instance PToJSRef TextTrackList where
  pToJSRef = unTextTrackList
  {-# INLINE pToJSRef #-}

instance PFromJSRef TextTrackList where
  pFromJSRef = TextTrackList
  {-# INLINE pFromJSRef #-}

instance ToJSRef TextTrackList where
  toJSRef = return . unTextTrackList
  {-# INLINE toJSRef #-}

instance FromJSRef TextTrackList where
  fromJSRef = return . fmap TextTrackList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget TextTrackList
instance IsGObject TextTrackList where
  toGObject = GObject . unTextTrackList
  {-# INLINE toGObject #-}
  unsafeCastGObject = TextTrackList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToTextTrackList :: IsGObject obj => obj -> TextTrackList
castToTextTrackList = castTo gTypeTextTrackList "TextTrackList"

foreign import javascript unsafe "window[\"TextTrackList\"]" gTypeTextTrackList :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsTextTrackList o = TextTrackListClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.TimeRanges".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/TimeRanges Mozilla TimeRanges documentation>
newtype TimeRanges = TimeRanges { unTimeRanges :: JSRef }

instance Eq (TimeRanges) where
  (TimeRanges a) == (TimeRanges b) = js_eq a b

instance PToJSRef TimeRanges where
  pToJSRef = unTimeRanges
  {-# INLINE pToJSRef #-}

instance PFromJSRef TimeRanges where
  pFromJSRef = TimeRanges
  {-# INLINE pFromJSRef #-}

instance ToJSRef TimeRanges where
  toJSRef = return . unTimeRanges
  {-# INLINE toJSRef #-}

instance FromJSRef TimeRanges where
  fromJSRef = return . fmap TimeRanges . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject TimeRanges where
  toGObject = GObject . unTimeRanges
  {-# INLINE toGObject #-}
  unsafeCastGObject = TimeRanges . unGObject
  {-# INLINE unsafeCastGObject #-}

castToTimeRanges :: IsGObject obj => obj -> TimeRanges
castToTimeRanges = castTo gTypeTimeRanges "TimeRanges"

foreign import javascript unsafe "window[\"TimeRanges\"]" gTypeTimeRanges :: GType
#else
type IsTimeRanges o = TimeRangesClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Touch".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Touch Mozilla Touch documentation>
newtype Touch = Touch { unTouch :: JSRef }

instance Eq (Touch) where
  (Touch a) == (Touch b) = js_eq a b

instance PToJSRef Touch where
  pToJSRef = unTouch
  {-# INLINE pToJSRef #-}

instance PFromJSRef Touch where
  pFromJSRef = Touch
  {-# INLINE pFromJSRef #-}

instance ToJSRef Touch where
  toJSRef = return . unTouch
  {-# INLINE toJSRef #-}

instance FromJSRef Touch where
  fromJSRef = return . fmap Touch . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject Touch where
  toGObject = GObject . unTouch
  {-# INLINE toGObject #-}
  unsafeCastGObject = Touch . unGObject
  {-# INLINE unsafeCastGObject #-}

castToTouch :: IsGObject obj => obj -> Touch
castToTouch = castTo gTypeTouch "Touch"

foreign import javascript unsafe "window[\"Touch\"]" gTypeTouch :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsTouch o = TouchClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.TouchEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.UIEvent"
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/TouchEvent Mozilla TouchEvent documentation>
newtype TouchEvent = TouchEvent { unTouchEvent :: JSRef }

instance Eq (TouchEvent) where
  (TouchEvent a) == (TouchEvent b) = js_eq a b

instance PToJSRef TouchEvent where
  pToJSRef = unTouchEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef TouchEvent where
  pFromJSRef = TouchEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef TouchEvent where
  toJSRef = return . unTouchEvent
  {-# INLINE toJSRef #-}

instance FromJSRef TouchEvent where
  fromJSRef = return . fmap TouchEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsUIEvent TouchEvent
instance IsEvent TouchEvent
instance IsGObject TouchEvent where
  toGObject = GObject . unTouchEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = TouchEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToTouchEvent :: IsGObject obj => obj -> TouchEvent
castToTouchEvent = castTo gTypeTouchEvent "TouchEvent"

foreign import javascript unsafe "window[\"TouchEvent\"]" gTypeTouchEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.TouchList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/TouchList Mozilla TouchList documentation>
newtype TouchList = TouchList { unTouchList :: JSRef }

instance Eq (TouchList) where
  (TouchList a) == (TouchList b) = js_eq a b

instance PToJSRef TouchList where
  pToJSRef = unTouchList
  {-# INLINE pToJSRef #-}

instance PFromJSRef TouchList where
  pFromJSRef = TouchList
  {-# INLINE pFromJSRef #-}

instance ToJSRef TouchList where
  toJSRef = return . unTouchList
  {-# INLINE toJSRef #-}

instance FromJSRef TouchList where
  fromJSRef = return . fmap TouchList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject TouchList where
  toGObject = GObject . unTouchList
  {-# INLINE toGObject #-}
  unsafeCastGObject = TouchList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToTouchList :: IsGObject obj => obj -> TouchList
castToTouchList = castTo gTypeTouchList "TouchList"

foreign import javascript unsafe "window[\"TouchList\"]" gTypeTouchList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.TrackEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/TrackEvent Mozilla TrackEvent documentation>
newtype TrackEvent = TrackEvent { unTrackEvent :: JSRef }

instance Eq (TrackEvent) where
  (TrackEvent a) == (TrackEvent b) = js_eq a b

instance PToJSRef TrackEvent where
  pToJSRef = unTrackEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef TrackEvent where
  pFromJSRef = TrackEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef TrackEvent where
  toJSRef = return . unTrackEvent
  {-# INLINE toJSRef #-}

instance FromJSRef TrackEvent where
  fromJSRef = return . fmap TrackEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent TrackEvent
instance IsGObject TrackEvent where
  toGObject = GObject . unTrackEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = TrackEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToTrackEvent :: IsGObject obj => obj -> TrackEvent
castToTrackEvent = castTo gTypeTrackEvent "TrackEvent"

foreign import javascript unsafe "window[\"TrackEvent\"]" gTypeTrackEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.TransitionEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/TransitionEvent Mozilla TransitionEvent documentation>
newtype TransitionEvent = TransitionEvent { unTransitionEvent :: JSRef }

instance Eq (TransitionEvent) where
  (TransitionEvent a) == (TransitionEvent b) = js_eq a b

instance PToJSRef TransitionEvent where
  pToJSRef = unTransitionEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef TransitionEvent where
  pFromJSRef = TransitionEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef TransitionEvent where
  toJSRef = return . unTransitionEvent
  {-# INLINE toJSRef #-}

instance FromJSRef TransitionEvent where
  fromJSRef = return . fmap TransitionEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent TransitionEvent
instance IsGObject TransitionEvent where
  toGObject = GObject . unTransitionEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = TransitionEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToTransitionEvent :: IsGObject obj => obj -> TransitionEvent
castToTransitionEvent = castTo gTypeTransitionEvent "TransitionEvent"

foreign import javascript unsafe "window[\"TransitionEvent\"]" gTypeTransitionEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.TreeWalker".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/TreeWalker Mozilla TreeWalker documentation>
newtype TreeWalker = TreeWalker { unTreeWalker :: JSRef }

instance Eq (TreeWalker) where
  (TreeWalker a) == (TreeWalker b) = js_eq a b

instance PToJSRef TreeWalker where
  pToJSRef = unTreeWalker
  {-# INLINE pToJSRef #-}

instance PFromJSRef TreeWalker where
  pFromJSRef = TreeWalker
  {-# INLINE pFromJSRef #-}

instance ToJSRef TreeWalker where
  toJSRef = return . unTreeWalker
  {-# INLINE toJSRef #-}

instance FromJSRef TreeWalker where
  fromJSRef = return . fmap TreeWalker . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject TreeWalker where
  toGObject = GObject . unTreeWalker
  {-# INLINE toGObject #-}
  unsafeCastGObject = TreeWalker . unGObject
  {-# INLINE unsafeCastGObject #-}

castToTreeWalker :: IsGObject obj => obj -> TreeWalker
castToTreeWalker = castTo gTypeTreeWalker "TreeWalker"

foreign import javascript unsafe "window[\"TreeWalker\"]" gTypeTreeWalker :: GType
#else
type IsTreeWalker o = TreeWalkerClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.TypeConversions".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/TypeConversions Mozilla TypeConversions documentation>
newtype TypeConversions = TypeConversions { unTypeConversions :: JSRef }

instance Eq (TypeConversions) where
  (TypeConversions a) == (TypeConversions b) = js_eq a b

instance PToJSRef TypeConversions where
  pToJSRef = unTypeConversions
  {-# INLINE pToJSRef #-}

instance PFromJSRef TypeConversions where
  pFromJSRef = TypeConversions
  {-# INLINE pFromJSRef #-}

instance ToJSRef TypeConversions where
  toJSRef = return . unTypeConversions
  {-# INLINE toJSRef #-}

instance FromJSRef TypeConversions where
  fromJSRef = return . fmap TypeConversions . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject TypeConversions where
  toGObject = GObject . unTypeConversions
  {-# INLINE toGObject #-}
  unsafeCastGObject = TypeConversions . unGObject
  {-# INLINE unsafeCastGObject #-}

castToTypeConversions :: IsGObject obj => obj -> TypeConversions
castToTypeConversions = castTo gTypeTypeConversions "TypeConversions"

foreign import javascript unsafe "window[\"TypeConversions\"]" gTypeTypeConversions :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.UIEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/UIEvent Mozilla UIEvent documentation>
newtype UIEvent = UIEvent { unUIEvent :: JSRef }

instance Eq (UIEvent) where
  (UIEvent a) == (UIEvent b) = js_eq a b

instance PToJSRef UIEvent where
  pToJSRef = unUIEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef UIEvent where
  pFromJSRef = UIEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef UIEvent where
  toJSRef = return . unUIEvent
  {-# INLINE toJSRef #-}

instance FromJSRef UIEvent where
  fromJSRef = return . fmap UIEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsEvent o => IsUIEvent o
toUIEvent :: IsUIEvent o => o -> UIEvent
toUIEvent = unsafeCastGObject . toGObject

instance IsUIEvent UIEvent
instance IsEvent UIEvent
instance IsGObject UIEvent where
  toGObject = GObject . unUIEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = UIEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToUIEvent :: IsGObject obj => obj -> UIEvent
castToUIEvent = castTo gTypeUIEvent "UIEvent"

foreign import javascript unsafe "window[\"UIEvent\"]" gTypeUIEvent :: GType
#else
type IsUIEvent o = UIEventClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.UIRequestEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.UIEvent"
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/UIRequestEvent Mozilla UIRequestEvent documentation>
newtype UIRequestEvent = UIRequestEvent { unUIRequestEvent :: JSRef }

instance Eq (UIRequestEvent) where
  (UIRequestEvent a) == (UIRequestEvent b) = js_eq a b

instance PToJSRef UIRequestEvent where
  pToJSRef = unUIRequestEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef UIRequestEvent where
  pFromJSRef = UIRequestEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef UIRequestEvent where
  toJSRef = return . unUIRequestEvent
  {-# INLINE toJSRef #-}

instance FromJSRef UIRequestEvent where
  fromJSRef = return . fmap UIRequestEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsUIEvent UIRequestEvent
instance IsEvent UIRequestEvent
instance IsGObject UIRequestEvent where
  toGObject = GObject . unUIRequestEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = UIRequestEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToUIRequestEvent :: IsGObject obj => obj -> UIRequestEvent
castToUIRequestEvent = castTo gTypeUIRequestEvent "UIRequestEvent"

foreign import javascript unsafe "window[\"UIRequestEvent\"]" gTypeUIRequestEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.URL".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/URL Mozilla URL documentation>
newtype URL = URL { unURL :: JSRef }

instance Eq (URL) where
  (URL a) == (URL b) = js_eq a b

instance PToJSRef URL where
  pToJSRef = unURL
  {-# INLINE pToJSRef #-}

instance PFromJSRef URL where
  pFromJSRef = URL
  {-# INLINE pFromJSRef #-}

instance ToJSRef URL where
  toJSRef = return . unURL
  {-# INLINE toJSRef #-}

instance FromJSRef URL where
  fromJSRef = return . fmap URL . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject URL where
  toGObject = GObject . unURL
  {-# INLINE toGObject #-}
  unsafeCastGObject = URL . unGObject
  {-# INLINE unsafeCastGObject #-}

castToURL :: IsGObject obj => obj -> URL
castToURL = castTo gTypeURL "URL"

foreign import javascript unsafe "window[\"URL\"]" gTypeURL :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.URLUtils".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/URLUtils Mozilla URLUtils documentation>
newtype URLUtils = URLUtils { unURLUtils :: JSRef }

instance Eq (URLUtils) where
  (URLUtils a) == (URLUtils b) = js_eq a b

instance PToJSRef URLUtils where
  pToJSRef = unURLUtils
  {-# INLINE pToJSRef #-}

instance PFromJSRef URLUtils where
  pFromJSRef = URLUtils
  {-# INLINE pFromJSRef #-}

instance ToJSRef URLUtils where
  toJSRef = return . unURLUtils
  {-# INLINE toJSRef #-}

instance FromJSRef URLUtils where
  fromJSRef = return . fmap URLUtils . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject URLUtils where
  toGObject = GObject . unURLUtils
  {-# INLINE toGObject #-}
  unsafeCastGObject = URLUtils . unGObject
  {-# INLINE unsafeCastGObject #-}

castToURLUtils :: IsGObject obj => obj -> URLUtils
castToURLUtils = castTo gTypeURLUtils "URLUtils"

foreign import javascript unsafe "window[\"URLUtils\"]" gTypeURLUtils :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.UserMessageHandler".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/UserMessageHandler Mozilla UserMessageHandler documentation>
newtype UserMessageHandler = UserMessageHandler { unUserMessageHandler :: JSRef }

instance Eq (UserMessageHandler) where
  (UserMessageHandler a) == (UserMessageHandler b) = js_eq a b

instance PToJSRef UserMessageHandler where
  pToJSRef = unUserMessageHandler
  {-# INLINE pToJSRef #-}

instance PFromJSRef UserMessageHandler where
  pFromJSRef = UserMessageHandler
  {-# INLINE pFromJSRef #-}

instance ToJSRef UserMessageHandler where
  toJSRef = return . unUserMessageHandler
  {-# INLINE toJSRef #-}

instance FromJSRef UserMessageHandler where
  fromJSRef = return . fmap UserMessageHandler . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject UserMessageHandler where
  toGObject = GObject . unUserMessageHandler
  {-# INLINE toGObject #-}
  unsafeCastGObject = UserMessageHandler . unGObject
  {-# INLINE unsafeCastGObject #-}

castToUserMessageHandler :: IsGObject obj => obj -> UserMessageHandler
castToUserMessageHandler = castTo gTypeUserMessageHandler "UserMessageHandler"

foreign import javascript unsafe "window[\"UserMessageHandler\"]" gTypeUserMessageHandler :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.UserMessageHandlersNamespace".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/UserMessageHandlersNamespace Mozilla UserMessageHandlersNamespace documentation>
newtype UserMessageHandlersNamespace = UserMessageHandlersNamespace { unUserMessageHandlersNamespace :: JSRef }

instance Eq (UserMessageHandlersNamespace) where
  (UserMessageHandlersNamespace a) == (UserMessageHandlersNamespace b) = js_eq a b

instance PToJSRef UserMessageHandlersNamespace where
  pToJSRef = unUserMessageHandlersNamespace
  {-# INLINE pToJSRef #-}

instance PFromJSRef UserMessageHandlersNamespace where
  pFromJSRef = UserMessageHandlersNamespace
  {-# INLINE pFromJSRef #-}

instance ToJSRef UserMessageHandlersNamespace where
  toJSRef = return . unUserMessageHandlersNamespace
  {-# INLINE toJSRef #-}

instance FromJSRef UserMessageHandlersNamespace where
  fromJSRef = return . fmap UserMessageHandlersNamespace . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject UserMessageHandlersNamespace where
  toGObject = GObject . unUserMessageHandlersNamespace
  {-# INLINE toGObject #-}
  unsafeCastGObject = UserMessageHandlersNamespace . unGObject
  {-# INLINE unsafeCastGObject #-}

castToUserMessageHandlersNamespace :: IsGObject obj => obj -> UserMessageHandlersNamespace
castToUserMessageHandlersNamespace = castTo gTypeUserMessageHandlersNamespace "UserMessageHandlersNamespace"

foreign import javascript unsafe "window[\"UserMessageHandlersNamespace\"]" gTypeUserMessageHandlersNamespace :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.VTTCue".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.TextTrackCue"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/VTTCue Mozilla VTTCue documentation>
newtype VTTCue = VTTCue { unVTTCue :: JSRef }

instance Eq (VTTCue) where
  (VTTCue a) == (VTTCue b) = js_eq a b

instance PToJSRef VTTCue where
  pToJSRef = unVTTCue
  {-# INLINE pToJSRef #-}

instance PFromJSRef VTTCue where
  pFromJSRef = VTTCue
  {-# INLINE pFromJSRef #-}

instance ToJSRef VTTCue where
  toJSRef = return . unVTTCue
  {-# INLINE toJSRef #-}

instance FromJSRef VTTCue where
  fromJSRef = return . fmap VTTCue . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsTextTrackCue VTTCue
instance IsEventTarget VTTCue
instance IsGObject VTTCue where
  toGObject = GObject . unVTTCue
  {-# INLINE toGObject #-}
  unsafeCastGObject = VTTCue . unGObject
  {-# INLINE unsafeCastGObject #-}

castToVTTCue :: IsGObject obj => obj -> VTTCue
castToVTTCue = castTo gTypeVTTCue "VTTCue"

foreign import javascript unsafe "window[\"VTTCue\"]" gTypeVTTCue :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.VTTRegion".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/VTTRegion Mozilla VTTRegion documentation>
newtype VTTRegion = VTTRegion { unVTTRegion :: JSRef }

instance Eq (VTTRegion) where
  (VTTRegion a) == (VTTRegion b) = js_eq a b

instance PToJSRef VTTRegion where
  pToJSRef = unVTTRegion
  {-# INLINE pToJSRef #-}

instance PFromJSRef VTTRegion where
  pFromJSRef = VTTRegion
  {-# INLINE pFromJSRef #-}

instance ToJSRef VTTRegion where
  toJSRef = return . unVTTRegion
  {-# INLINE toJSRef #-}

instance FromJSRef VTTRegion where
  fromJSRef = return . fmap VTTRegion . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject VTTRegion where
  toGObject = GObject . unVTTRegion
  {-# INLINE toGObject #-}
  unsafeCastGObject = VTTRegion . unGObject
  {-# INLINE unsafeCastGObject #-}

castToVTTRegion :: IsGObject obj => obj -> VTTRegion
castToVTTRegion = castTo gTypeVTTRegion "VTTRegion"

foreign import javascript unsafe "window[\"VTTRegion\"]" gTypeVTTRegion :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.VTTRegionList".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/VTTRegionList Mozilla VTTRegionList documentation>
newtype VTTRegionList = VTTRegionList { unVTTRegionList :: JSRef }

instance Eq (VTTRegionList) where
  (VTTRegionList a) == (VTTRegionList b) = js_eq a b

instance PToJSRef VTTRegionList where
  pToJSRef = unVTTRegionList
  {-# INLINE pToJSRef #-}

instance PFromJSRef VTTRegionList where
  pFromJSRef = VTTRegionList
  {-# INLINE pFromJSRef #-}

instance ToJSRef VTTRegionList where
  toJSRef = return . unVTTRegionList
  {-# INLINE toJSRef #-}

instance FromJSRef VTTRegionList where
  fromJSRef = return . fmap VTTRegionList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject VTTRegionList where
  toGObject = GObject . unVTTRegionList
  {-# INLINE toGObject #-}
  unsafeCastGObject = VTTRegionList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToVTTRegionList :: IsGObject obj => obj -> VTTRegionList
castToVTTRegionList = castTo gTypeVTTRegionList "VTTRegionList"

foreign import javascript unsafe "window[\"VTTRegionList\"]" gTypeVTTRegionList :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.ValidityState".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/ValidityState Mozilla ValidityState documentation>
newtype ValidityState = ValidityState { unValidityState :: JSRef }

instance Eq (ValidityState) where
  (ValidityState a) == (ValidityState b) = js_eq a b

instance PToJSRef ValidityState where
  pToJSRef = unValidityState
  {-# INLINE pToJSRef #-}

instance PFromJSRef ValidityState where
  pFromJSRef = ValidityState
  {-# INLINE pFromJSRef #-}

instance ToJSRef ValidityState where
  toJSRef = return . unValidityState
  {-# INLINE toJSRef #-}

instance FromJSRef ValidityState where
  fromJSRef = return . fmap ValidityState . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject ValidityState where
  toGObject = GObject . unValidityState
  {-# INLINE toGObject #-}
  unsafeCastGObject = ValidityState . unGObject
  {-# INLINE unsafeCastGObject #-}

castToValidityState :: IsGObject obj => obj -> ValidityState
castToValidityState = castTo gTypeValidityState "ValidityState"

foreign import javascript unsafe "window[\"ValidityState\"]" gTypeValidityState :: GType
#else
type IsValidityState o = ValidityStateClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.VideoPlaybackQuality".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/VideoPlaybackQuality Mozilla VideoPlaybackQuality documentation>
newtype VideoPlaybackQuality = VideoPlaybackQuality { unVideoPlaybackQuality :: JSRef }

instance Eq (VideoPlaybackQuality) where
  (VideoPlaybackQuality a) == (VideoPlaybackQuality b) = js_eq a b

instance PToJSRef VideoPlaybackQuality where
  pToJSRef = unVideoPlaybackQuality
  {-# INLINE pToJSRef #-}

instance PFromJSRef VideoPlaybackQuality where
  pFromJSRef = VideoPlaybackQuality
  {-# INLINE pFromJSRef #-}

instance ToJSRef VideoPlaybackQuality where
  toJSRef = return . unVideoPlaybackQuality
  {-# INLINE toJSRef #-}

instance FromJSRef VideoPlaybackQuality where
  fromJSRef = return . fmap VideoPlaybackQuality . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject VideoPlaybackQuality where
  toGObject = GObject . unVideoPlaybackQuality
  {-# INLINE toGObject #-}
  unsafeCastGObject = VideoPlaybackQuality . unGObject
  {-# INLINE unsafeCastGObject #-}

castToVideoPlaybackQuality :: IsGObject obj => obj -> VideoPlaybackQuality
castToVideoPlaybackQuality = castTo gTypeVideoPlaybackQuality "VideoPlaybackQuality"

foreign import javascript unsafe "window[\"VideoPlaybackQuality\"]" gTypeVideoPlaybackQuality :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.VideoStreamTrack".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.MediaStreamTrack"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/VideoStreamTrack Mozilla VideoStreamTrack documentation>
newtype VideoStreamTrack = VideoStreamTrack { unVideoStreamTrack :: JSRef }

instance Eq (VideoStreamTrack) where
  (VideoStreamTrack a) == (VideoStreamTrack b) = js_eq a b

instance PToJSRef VideoStreamTrack where
  pToJSRef = unVideoStreamTrack
  {-# INLINE pToJSRef #-}

instance PFromJSRef VideoStreamTrack where
  pFromJSRef = VideoStreamTrack
  {-# INLINE pFromJSRef #-}

instance ToJSRef VideoStreamTrack where
  toJSRef = return . unVideoStreamTrack
  {-# INLINE toJSRef #-}

instance FromJSRef VideoStreamTrack where
  fromJSRef = return . fmap VideoStreamTrack . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsMediaStreamTrack VideoStreamTrack
instance IsEventTarget VideoStreamTrack
instance IsGObject VideoStreamTrack where
  toGObject = GObject . unVideoStreamTrack
  {-# INLINE toGObject #-}
  unsafeCastGObject = VideoStreamTrack . unGObject
  {-# INLINE unsafeCastGObject #-}

castToVideoStreamTrack :: IsGObject obj => obj -> VideoStreamTrack
castToVideoStreamTrack = castTo gTypeVideoStreamTrack "VideoStreamTrack"

foreign import javascript unsafe "window[\"VideoStreamTrack\"]" gTypeVideoStreamTrack :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.VideoTrack".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/VideoTrack Mozilla VideoTrack documentation>
newtype VideoTrack = VideoTrack { unVideoTrack :: JSRef }

instance Eq (VideoTrack) where
  (VideoTrack a) == (VideoTrack b) = js_eq a b

instance PToJSRef VideoTrack where
  pToJSRef = unVideoTrack
  {-# INLINE pToJSRef #-}

instance PFromJSRef VideoTrack where
  pFromJSRef = VideoTrack
  {-# INLINE pFromJSRef #-}

instance ToJSRef VideoTrack where
  toJSRef = return . unVideoTrack
  {-# INLINE toJSRef #-}

instance FromJSRef VideoTrack where
  fromJSRef = return . fmap VideoTrack . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject VideoTrack where
  toGObject = GObject . unVideoTrack
  {-# INLINE toGObject #-}
  unsafeCastGObject = VideoTrack . unGObject
  {-# INLINE unsafeCastGObject #-}

castToVideoTrack :: IsGObject obj => obj -> VideoTrack
castToVideoTrack = castTo gTypeVideoTrack "VideoTrack"

foreign import javascript unsafe "window[\"VideoTrack\"]" gTypeVideoTrack :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsVideoTrack o = VideoTrackClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.VideoTrackList".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/VideoTrackList Mozilla VideoTrackList documentation>
newtype VideoTrackList = VideoTrackList { unVideoTrackList :: JSRef }

instance Eq (VideoTrackList) where
  (VideoTrackList a) == (VideoTrackList b) = js_eq a b

instance PToJSRef VideoTrackList where
  pToJSRef = unVideoTrackList
  {-# INLINE pToJSRef #-}

instance PFromJSRef VideoTrackList where
  pFromJSRef = VideoTrackList
  {-# INLINE pFromJSRef #-}

instance ToJSRef VideoTrackList where
  toJSRef = return . unVideoTrackList
  {-# INLINE toJSRef #-}

instance FromJSRef VideoTrackList where
  fromJSRef = return . fmap VideoTrackList . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget VideoTrackList
instance IsGObject VideoTrackList where
  toGObject = GObject . unVideoTrackList
  {-# INLINE toGObject #-}
  unsafeCastGObject = VideoTrackList . unGObject
  {-# INLINE unsafeCastGObject #-}

castToVideoTrackList :: IsGObject obj => obj -> VideoTrackList
castToVideoTrackList = castTo gTypeVideoTrackList "VideoTrackList"

foreign import javascript unsafe "window[\"VideoTrackList\"]" gTypeVideoTrackList :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsVideoTrackList o = VideoTrackListClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WaveShaperNode".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.AudioNode"
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WaveShaperNode Mozilla WaveShaperNode documentation>
newtype WaveShaperNode = WaveShaperNode { unWaveShaperNode :: JSRef }

instance Eq (WaveShaperNode) where
  (WaveShaperNode a) == (WaveShaperNode b) = js_eq a b

instance PToJSRef WaveShaperNode where
  pToJSRef = unWaveShaperNode
  {-# INLINE pToJSRef #-}

instance PFromJSRef WaveShaperNode where
  pFromJSRef = WaveShaperNode
  {-# INLINE pFromJSRef #-}

instance ToJSRef WaveShaperNode where
  toJSRef = return . unWaveShaperNode
  {-# INLINE toJSRef #-}

instance FromJSRef WaveShaperNode where
  fromJSRef = return . fmap WaveShaperNode . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsAudioNode WaveShaperNode
instance IsEventTarget WaveShaperNode
instance IsGObject WaveShaperNode where
  toGObject = GObject . unWaveShaperNode
  {-# INLINE toGObject #-}
  unsafeCastGObject = WaveShaperNode . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWaveShaperNode :: IsGObject obj => obj -> WaveShaperNode
castToWaveShaperNode = castTo gTypeWaveShaperNode "WaveShaperNode"

foreign import javascript unsafe "window[\"WaveShaperNode\"]" gTypeWaveShaperNode :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGL2RenderingContext".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.WebGLRenderingContextBase"
--     * "GHCJS.DOM.CanvasRenderingContext"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGL2RenderingContext Mozilla WebGL2RenderingContext documentation>
newtype WebGL2RenderingContext = WebGL2RenderingContext { unWebGL2RenderingContext :: JSRef }

instance Eq (WebGL2RenderingContext) where
  (WebGL2RenderingContext a) == (WebGL2RenderingContext b) = js_eq a b

instance PToJSRef WebGL2RenderingContext where
  pToJSRef = unWebGL2RenderingContext
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGL2RenderingContext where
  pFromJSRef = WebGL2RenderingContext
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGL2RenderingContext where
  toJSRef = return . unWebGL2RenderingContext
  {-# INLINE toJSRef #-}

instance FromJSRef WebGL2RenderingContext where
  fromJSRef = return . fmap WebGL2RenderingContext . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsWebGLRenderingContextBase WebGL2RenderingContext
instance IsCanvasRenderingContext WebGL2RenderingContext
instance IsGObject WebGL2RenderingContext where
  toGObject = GObject . unWebGL2RenderingContext
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGL2RenderingContext . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGL2RenderingContext :: IsGObject obj => obj -> WebGL2RenderingContext
castToWebGL2RenderingContext = castTo gTypeWebGL2RenderingContext "WebGL2RenderingContext"

foreign import javascript unsafe "window[\"WebGL2RenderingContext\"]" gTypeWebGL2RenderingContext :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLActiveInfo".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLActiveInfo Mozilla WebGLActiveInfo documentation>
newtype WebGLActiveInfo = WebGLActiveInfo { unWebGLActiveInfo :: JSRef }

instance Eq (WebGLActiveInfo) where
  (WebGLActiveInfo a) == (WebGLActiveInfo b) = js_eq a b

instance PToJSRef WebGLActiveInfo where
  pToJSRef = unWebGLActiveInfo
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLActiveInfo where
  pFromJSRef = WebGLActiveInfo
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLActiveInfo where
  toJSRef = return . unWebGLActiveInfo
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLActiveInfo where
  fromJSRef = return . fmap WebGLActiveInfo . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLActiveInfo where
  toGObject = GObject . unWebGLActiveInfo
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLActiveInfo . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLActiveInfo :: IsGObject obj => obj -> WebGLActiveInfo
castToWebGLActiveInfo = castTo gTypeWebGLActiveInfo "WebGLActiveInfo"

foreign import javascript unsafe "window[\"WebGLActiveInfo\"]" gTypeWebGLActiveInfo :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLBuffer".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLBuffer Mozilla WebGLBuffer documentation>
newtype WebGLBuffer = WebGLBuffer { unWebGLBuffer :: JSRef }

instance Eq (WebGLBuffer) where
  (WebGLBuffer a) == (WebGLBuffer b) = js_eq a b

instance PToJSRef WebGLBuffer where
  pToJSRef = unWebGLBuffer
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLBuffer where
  pFromJSRef = WebGLBuffer
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLBuffer where
  toJSRef = return . unWebGLBuffer
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLBuffer where
  fromJSRef = return . fmap WebGLBuffer . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLBuffer where
  toGObject = GObject . unWebGLBuffer
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLBuffer . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLBuffer :: IsGObject obj => obj -> WebGLBuffer
castToWebGLBuffer = castTo gTypeWebGLBuffer "WebGLBuffer"

foreign import javascript unsafe "window[\"WebGLBuffer\"]" gTypeWebGLBuffer :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLCompressedTextureATC".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLCompressedTextureATC Mozilla WebGLCompressedTextureATC documentation>
newtype WebGLCompressedTextureATC = WebGLCompressedTextureATC { unWebGLCompressedTextureATC :: JSRef }

instance Eq (WebGLCompressedTextureATC) where
  (WebGLCompressedTextureATC a) == (WebGLCompressedTextureATC b) = js_eq a b

instance PToJSRef WebGLCompressedTextureATC where
  pToJSRef = unWebGLCompressedTextureATC
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLCompressedTextureATC where
  pFromJSRef = WebGLCompressedTextureATC
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLCompressedTextureATC where
  toJSRef = return . unWebGLCompressedTextureATC
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLCompressedTextureATC where
  fromJSRef = return . fmap WebGLCompressedTextureATC . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLCompressedTextureATC where
  toGObject = GObject . unWebGLCompressedTextureATC
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLCompressedTextureATC . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLCompressedTextureATC :: IsGObject obj => obj -> WebGLCompressedTextureATC
castToWebGLCompressedTextureATC = castTo gTypeWebGLCompressedTextureATC "WebGLCompressedTextureATC"

foreign import javascript unsafe "window[\"WebGLCompressedTextureATC\"]" gTypeWebGLCompressedTextureATC :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLCompressedTexturePVRTC".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLCompressedTexturePVRTC Mozilla WebGLCompressedTexturePVRTC documentation>
newtype WebGLCompressedTexturePVRTC = WebGLCompressedTexturePVRTC { unWebGLCompressedTexturePVRTC :: JSRef }

instance Eq (WebGLCompressedTexturePVRTC) where
  (WebGLCompressedTexturePVRTC a) == (WebGLCompressedTexturePVRTC b) = js_eq a b

instance PToJSRef WebGLCompressedTexturePVRTC where
  pToJSRef = unWebGLCompressedTexturePVRTC
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLCompressedTexturePVRTC where
  pFromJSRef = WebGLCompressedTexturePVRTC
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLCompressedTexturePVRTC where
  toJSRef = return . unWebGLCompressedTexturePVRTC
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLCompressedTexturePVRTC where
  fromJSRef = return . fmap WebGLCompressedTexturePVRTC . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLCompressedTexturePVRTC where
  toGObject = GObject . unWebGLCompressedTexturePVRTC
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLCompressedTexturePVRTC . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLCompressedTexturePVRTC :: IsGObject obj => obj -> WebGLCompressedTexturePVRTC
castToWebGLCompressedTexturePVRTC = castTo gTypeWebGLCompressedTexturePVRTC "WebGLCompressedTexturePVRTC"

foreign import javascript unsafe "window[\"WebGLCompressedTexturePVRTC\"]" gTypeWebGLCompressedTexturePVRTC :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLCompressedTextureS3TC".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLCompressedTextureS3TC Mozilla WebGLCompressedTextureS3TC documentation>
newtype WebGLCompressedTextureS3TC = WebGLCompressedTextureS3TC { unWebGLCompressedTextureS3TC :: JSRef }

instance Eq (WebGLCompressedTextureS3TC) where
  (WebGLCompressedTextureS3TC a) == (WebGLCompressedTextureS3TC b) = js_eq a b

instance PToJSRef WebGLCompressedTextureS3TC where
  pToJSRef = unWebGLCompressedTextureS3TC
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLCompressedTextureS3TC where
  pFromJSRef = WebGLCompressedTextureS3TC
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLCompressedTextureS3TC where
  toJSRef = return . unWebGLCompressedTextureS3TC
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLCompressedTextureS3TC where
  fromJSRef = return . fmap WebGLCompressedTextureS3TC . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLCompressedTextureS3TC where
  toGObject = GObject . unWebGLCompressedTextureS3TC
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLCompressedTextureS3TC . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLCompressedTextureS3TC :: IsGObject obj => obj -> WebGLCompressedTextureS3TC
castToWebGLCompressedTextureS3TC = castTo gTypeWebGLCompressedTextureS3TC "WebGLCompressedTextureS3TC"

foreign import javascript unsafe "window[\"WebGLCompressedTextureS3TC\"]" gTypeWebGLCompressedTextureS3TC :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLContextAttributes".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLContextAttributes Mozilla WebGLContextAttributes documentation>
newtype WebGLContextAttributes = WebGLContextAttributes { unWebGLContextAttributes :: JSRef }

instance Eq (WebGLContextAttributes) where
  (WebGLContextAttributes a) == (WebGLContextAttributes b) = js_eq a b

instance PToJSRef WebGLContextAttributes where
  pToJSRef = unWebGLContextAttributes
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLContextAttributes where
  pFromJSRef = WebGLContextAttributes
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLContextAttributes where
  toJSRef = return . unWebGLContextAttributes
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLContextAttributes where
  fromJSRef = return . fmap WebGLContextAttributes . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLContextAttributes where
  toGObject = GObject . unWebGLContextAttributes
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLContextAttributes . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLContextAttributes :: IsGObject obj => obj -> WebGLContextAttributes
castToWebGLContextAttributes = castTo gTypeWebGLContextAttributes "WebGLContextAttributes"

foreign import javascript unsafe "window[\"WebGLContextAttributes\"]" gTypeWebGLContextAttributes :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLContextEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLContextEvent Mozilla WebGLContextEvent documentation>
newtype WebGLContextEvent = WebGLContextEvent { unWebGLContextEvent :: JSRef }

instance Eq (WebGLContextEvent) where
  (WebGLContextEvent a) == (WebGLContextEvent b) = js_eq a b

instance PToJSRef WebGLContextEvent where
  pToJSRef = unWebGLContextEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLContextEvent where
  pFromJSRef = WebGLContextEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLContextEvent where
  toJSRef = return . unWebGLContextEvent
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLContextEvent where
  fromJSRef = return . fmap WebGLContextEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent WebGLContextEvent
instance IsGObject WebGLContextEvent where
  toGObject = GObject . unWebGLContextEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLContextEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLContextEvent :: IsGObject obj => obj -> WebGLContextEvent
castToWebGLContextEvent = castTo gTypeWebGLContextEvent "WebGLContextEvent"

foreign import javascript unsafe "window[\"WebGLContextEvent\"]" gTypeWebGLContextEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLDebugRendererInfo".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLDebugRendererInfo Mozilla WebGLDebugRendererInfo documentation>
newtype WebGLDebugRendererInfo = WebGLDebugRendererInfo { unWebGLDebugRendererInfo :: JSRef }

instance Eq (WebGLDebugRendererInfo) where
  (WebGLDebugRendererInfo a) == (WebGLDebugRendererInfo b) = js_eq a b

instance PToJSRef WebGLDebugRendererInfo where
  pToJSRef = unWebGLDebugRendererInfo
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLDebugRendererInfo where
  pFromJSRef = WebGLDebugRendererInfo
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLDebugRendererInfo where
  toJSRef = return . unWebGLDebugRendererInfo
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLDebugRendererInfo where
  fromJSRef = return . fmap WebGLDebugRendererInfo . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLDebugRendererInfo where
  toGObject = GObject . unWebGLDebugRendererInfo
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLDebugRendererInfo . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLDebugRendererInfo :: IsGObject obj => obj -> WebGLDebugRendererInfo
castToWebGLDebugRendererInfo = castTo gTypeWebGLDebugRendererInfo "WebGLDebugRendererInfo"

foreign import javascript unsafe "window[\"WebGLDebugRendererInfo\"]" gTypeWebGLDebugRendererInfo :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLDebugShaders".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLDebugShaders Mozilla WebGLDebugShaders documentation>
newtype WebGLDebugShaders = WebGLDebugShaders { unWebGLDebugShaders :: JSRef }

instance Eq (WebGLDebugShaders) where
  (WebGLDebugShaders a) == (WebGLDebugShaders b) = js_eq a b

instance PToJSRef WebGLDebugShaders where
  pToJSRef = unWebGLDebugShaders
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLDebugShaders where
  pFromJSRef = WebGLDebugShaders
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLDebugShaders where
  toJSRef = return . unWebGLDebugShaders
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLDebugShaders where
  fromJSRef = return . fmap WebGLDebugShaders . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLDebugShaders where
  toGObject = GObject . unWebGLDebugShaders
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLDebugShaders . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLDebugShaders :: IsGObject obj => obj -> WebGLDebugShaders
castToWebGLDebugShaders = castTo gTypeWebGLDebugShaders "WebGLDebugShaders"

foreign import javascript unsafe "window[\"WebGLDebugShaders\"]" gTypeWebGLDebugShaders :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLDepthTexture".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLDepthTexture Mozilla WebGLDepthTexture documentation>
newtype WebGLDepthTexture = WebGLDepthTexture { unWebGLDepthTexture :: JSRef }

instance Eq (WebGLDepthTexture) where
  (WebGLDepthTexture a) == (WebGLDepthTexture b) = js_eq a b

instance PToJSRef WebGLDepthTexture where
  pToJSRef = unWebGLDepthTexture
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLDepthTexture where
  pFromJSRef = WebGLDepthTexture
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLDepthTexture where
  toJSRef = return . unWebGLDepthTexture
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLDepthTexture where
  fromJSRef = return . fmap WebGLDepthTexture . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLDepthTexture where
  toGObject = GObject . unWebGLDepthTexture
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLDepthTexture . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLDepthTexture :: IsGObject obj => obj -> WebGLDepthTexture
castToWebGLDepthTexture = castTo gTypeWebGLDepthTexture "WebGLDepthTexture"

foreign import javascript unsafe "window[\"WebGLDepthTexture\"]" gTypeWebGLDepthTexture :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLDrawBuffers".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLDrawBuffers Mozilla WebGLDrawBuffers documentation>
newtype WebGLDrawBuffers = WebGLDrawBuffers { unWebGLDrawBuffers :: JSRef }

instance Eq (WebGLDrawBuffers) where
  (WebGLDrawBuffers a) == (WebGLDrawBuffers b) = js_eq a b

instance PToJSRef WebGLDrawBuffers where
  pToJSRef = unWebGLDrawBuffers
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLDrawBuffers where
  pFromJSRef = WebGLDrawBuffers
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLDrawBuffers where
  toJSRef = return . unWebGLDrawBuffers
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLDrawBuffers where
  fromJSRef = return . fmap WebGLDrawBuffers . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLDrawBuffers where
  toGObject = GObject . unWebGLDrawBuffers
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLDrawBuffers . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLDrawBuffers :: IsGObject obj => obj -> WebGLDrawBuffers
castToWebGLDrawBuffers = castTo gTypeWebGLDrawBuffers "WebGLDrawBuffers"

foreign import javascript unsafe "window[\"WebGLDrawBuffers\"]" gTypeWebGLDrawBuffers :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLFramebuffer".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLFramebuffer Mozilla WebGLFramebuffer documentation>
newtype WebGLFramebuffer = WebGLFramebuffer { unWebGLFramebuffer :: JSRef }

instance Eq (WebGLFramebuffer) where
  (WebGLFramebuffer a) == (WebGLFramebuffer b) = js_eq a b

instance PToJSRef WebGLFramebuffer where
  pToJSRef = unWebGLFramebuffer
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLFramebuffer where
  pFromJSRef = WebGLFramebuffer
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLFramebuffer where
  toJSRef = return . unWebGLFramebuffer
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLFramebuffer where
  fromJSRef = return . fmap WebGLFramebuffer . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLFramebuffer where
  toGObject = GObject . unWebGLFramebuffer
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLFramebuffer . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLFramebuffer :: IsGObject obj => obj -> WebGLFramebuffer
castToWebGLFramebuffer = castTo gTypeWebGLFramebuffer "WebGLFramebuffer"

foreign import javascript unsafe "window[\"WebGLFramebuffer\"]" gTypeWebGLFramebuffer :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLLoseContext".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLLoseContext Mozilla WebGLLoseContext documentation>
newtype WebGLLoseContext = WebGLLoseContext { unWebGLLoseContext :: JSRef }

instance Eq (WebGLLoseContext) where
  (WebGLLoseContext a) == (WebGLLoseContext b) = js_eq a b

instance PToJSRef WebGLLoseContext where
  pToJSRef = unWebGLLoseContext
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLLoseContext where
  pFromJSRef = WebGLLoseContext
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLLoseContext where
  toJSRef = return . unWebGLLoseContext
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLLoseContext where
  fromJSRef = return . fmap WebGLLoseContext . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLLoseContext where
  toGObject = GObject . unWebGLLoseContext
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLLoseContext . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLLoseContext :: IsGObject obj => obj -> WebGLLoseContext
castToWebGLLoseContext = castTo gTypeWebGLLoseContext "WebGLLoseContext"

foreign import javascript unsafe "window[\"WebGLLoseContext\"]" gTypeWebGLLoseContext :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLProgram".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLProgram Mozilla WebGLProgram documentation>
newtype WebGLProgram = WebGLProgram { unWebGLProgram :: JSRef }

instance Eq (WebGLProgram) where
  (WebGLProgram a) == (WebGLProgram b) = js_eq a b

instance PToJSRef WebGLProgram where
  pToJSRef = unWebGLProgram
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLProgram where
  pFromJSRef = WebGLProgram
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLProgram where
  toJSRef = return . unWebGLProgram
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLProgram where
  fromJSRef = return . fmap WebGLProgram . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLProgram where
  toGObject = GObject . unWebGLProgram
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLProgram . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLProgram :: IsGObject obj => obj -> WebGLProgram
castToWebGLProgram = castTo gTypeWebGLProgram "WebGLProgram"

foreign import javascript unsafe "window[\"WebGLProgram\"]" gTypeWebGLProgram :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLQuery".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLQuery Mozilla WebGLQuery documentation>
newtype WebGLQuery = WebGLQuery { unWebGLQuery :: JSRef }

instance Eq (WebGLQuery) where
  (WebGLQuery a) == (WebGLQuery b) = js_eq a b

instance PToJSRef WebGLQuery where
  pToJSRef = unWebGLQuery
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLQuery where
  pFromJSRef = WebGLQuery
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLQuery where
  toJSRef = return . unWebGLQuery
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLQuery where
  fromJSRef = return . fmap WebGLQuery . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLQuery where
  toGObject = GObject . unWebGLQuery
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLQuery . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLQuery :: IsGObject obj => obj -> WebGLQuery
castToWebGLQuery = castTo gTypeWebGLQuery "WebGLQuery"

foreign import javascript unsafe "window[\"WebGLQuery\"]" gTypeWebGLQuery :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLRenderbuffer".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLRenderbuffer Mozilla WebGLRenderbuffer documentation>
newtype WebGLRenderbuffer = WebGLRenderbuffer { unWebGLRenderbuffer :: JSRef }

instance Eq (WebGLRenderbuffer) where
  (WebGLRenderbuffer a) == (WebGLRenderbuffer b) = js_eq a b

instance PToJSRef WebGLRenderbuffer where
  pToJSRef = unWebGLRenderbuffer
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLRenderbuffer where
  pFromJSRef = WebGLRenderbuffer
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLRenderbuffer where
  toJSRef = return . unWebGLRenderbuffer
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLRenderbuffer where
  fromJSRef = return . fmap WebGLRenderbuffer . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLRenderbuffer where
  toGObject = GObject . unWebGLRenderbuffer
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLRenderbuffer . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLRenderbuffer :: IsGObject obj => obj -> WebGLRenderbuffer
castToWebGLRenderbuffer = castTo gTypeWebGLRenderbuffer "WebGLRenderbuffer"

foreign import javascript unsafe "window[\"WebGLRenderbuffer\"]" gTypeWebGLRenderbuffer :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLRenderingContext".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.WebGLRenderingContextBase"
--     * "GHCJS.DOM.CanvasRenderingContext"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLRenderingContext Mozilla WebGLRenderingContext documentation>
newtype WebGLRenderingContext = WebGLRenderingContext { unWebGLRenderingContext :: JSRef }

instance Eq (WebGLRenderingContext) where
  (WebGLRenderingContext a) == (WebGLRenderingContext b) = js_eq a b

instance PToJSRef WebGLRenderingContext where
  pToJSRef = unWebGLRenderingContext
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLRenderingContext where
  pFromJSRef = WebGLRenderingContext
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLRenderingContext where
  toJSRef = return . unWebGLRenderingContext
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLRenderingContext where
  fromJSRef = return . fmap WebGLRenderingContext . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsWebGLRenderingContextBase WebGLRenderingContext
instance IsCanvasRenderingContext WebGLRenderingContext
instance IsGObject WebGLRenderingContext where
  toGObject = GObject . unWebGLRenderingContext
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLRenderingContext . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLRenderingContext :: IsGObject obj => obj -> WebGLRenderingContext
castToWebGLRenderingContext = castTo gTypeWebGLRenderingContext "WebGLRenderingContext"

foreign import javascript unsafe "window[\"WebGLRenderingContext\"]" gTypeWebGLRenderingContext :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLRenderingContextBase".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CanvasRenderingContext"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLRenderingContextBase Mozilla WebGLRenderingContextBase documentation>
newtype WebGLRenderingContextBase = WebGLRenderingContextBase { unWebGLRenderingContextBase :: JSRef }

instance Eq (WebGLRenderingContextBase) where
  (WebGLRenderingContextBase a) == (WebGLRenderingContextBase b) = js_eq a b

instance PToJSRef WebGLRenderingContextBase where
  pToJSRef = unWebGLRenderingContextBase
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLRenderingContextBase where
  pFromJSRef = WebGLRenderingContextBase
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLRenderingContextBase where
  toJSRef = return . unWebGLRenderingContextBase
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLRenderingContextBase where
  fromJSRef = return . fmap WebGLRenderingContextBase . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsCanvasRenderingContext o => IsWebGLRenderingContextBase o
toWebGLRenderingContextBase :: IsWebGLRenderingContextBase o => o -> WebGLRenderingContextBase
toWebGLRenderingContextBase = unsafeCastGObject . toGObject

instance IsWebGLRenderingContextBase WebGLRenderingContextBase
instance IsCanvasRenderingContext WebGLRenderingContextBase
instance IsGObject WebGLRenderingContextBase where
  toGObject = GObject . unWebGLRenderingContextBase
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLRenderingContextBase . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLRenderingContextBase :: IsGObject obj => obj -> WebGLRenderingContextBase
castToWebGLRenderingContextBase = castTo gTypeWebGLRenderingContextBase "WebGLRenderingContextBase"

foreign import javascript unsafe "window[\"WebGLRenderingContextBase\"]" gTypeWebGLRenderingContextBase :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLSampler".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLSampler Mozilla WebGLSampler documentation>
newtype WebGLSampler = WebGLSampler { unWebGLSampler :: JSRef }

instance Eq (WebGLSampler) where
  (WebGLSampler a) == (WebGLSampler b) = js_eq a b

instance PToJSRef WebGLSampler where
  pToJSRef = unWebGLSampler
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLSampler where
  pFromJSRef = WebGLSampler
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLSampler where
  toJSRef = return . unWebGLSampler
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLSampler where
  fromJSRef = return . fmap WebGLSampler . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLSampler where
  toGObject = GObject . unWebGLSampler
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLSampler . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLSampler :: IsGObject obj => obj -> WebGLSampler
castToWebGLSampler = castTo gTypeWebGLSampler "WebGLSampler"

foreign import javascript unsafe "window[\"WebGLSampler\"]" gTypeWebGLSampler :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLShader".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLShader Mozilla WebGLShader documentation>
newtype WebGLShader = WebGLShader { unWebGLShader :: JSRef }

instance Eq (WebGLShader) where
  (WebGLShader a) == (WebGLShader b) = js_eq a b

instance PToJSRef WebGLShader where
  pToJSRef = unWebGLShader
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLShader where
  pFromJSRef = WebGLShader
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLShader where
  toJSRef = return . unWebGLShader
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLShader where
  fromJSRef = return . fmap WebGLShader . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLShader where
  toGObject = GObject . unWebGLShader
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLShader . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLShader :: IsGObject obj => obj -> WebGLShader
castToWebGLShader = castTo gTypeWebGLShader "WebGLShader"

foreign import javascript unsafe "window[\"WebGLShader\"]" gTypeWebGLShader :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLShaderPrecisionFormat".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLShaderPrecisionFormat Mozilla WebGLShaderPrecisionFormat documentation>
newtype WebGLShaderPrecisionFormat = WebGLShaderPrecisionFormat { unWebGLShaderPrecisionFormat :: JSRef }

instance Eq (WebGLShaderPrecisionFormat) where
  (WebGLShaderPrecisionFormat a) == (WebGLShaderPrecisionFormat b) = js_eq a b

instance PToJSRef WebGLShaderPrecisionFormat where
  pToJSRef = unWebGLShaderPrecisionFormat
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLShaderPrecisionFormat where
  pFromJSRef = WebGLShaderPrecisionFormat
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLShaderPrecisionFormat where
  toJSRef = return . unWebGLShaderPrecisionFormat
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLShaderPrecisionFormat where
  fromJSRef = return . fmap WebGLShaderPrecisionFormat . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLShaderPrecisionFormat where
  toGObject = GObject . unWebGLShaderPrecisionFormat
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLShaderPrecisionFormat . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLShaderPrecisionFormat :: IsGObject obj => obj -> WebGLShaderPrecisionFormat
castToWebGLShaderPrecisionFormat = castTo gTypeWebGLShaderPrecisionFormat "WebGLShaderPrecisionFormat"

foreign import javascript unsafe "window[\"WebGLShaderPrecisionFormat\"]" gTypeWebGLShaderPrecisionFormat :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLSync".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLSync Mozilla WebGLSync documentation>
newtype WebGLSync = WebGLSync { unWebGLSync :: JSRef }

instance Eq (WebGLSync) where
  (WebGLSync a) == (WebGLSync b) = js_eq a b

instance PToJSRef WebGLSync where
  pToJSRef = unWebGLSync
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLSync where
  pFromJSRef = WebGLSync
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLSync where
  toJSRef = return . unWebGLSync
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLSync where
  fromJSRef = return . fmap WebGLSync . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLSync where
  toGObject = GObject . unWebGLSync
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLSync . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLSync :: IsGObject obj => obj -> WebGLSync
castToWebGLSync = castTo gTypeWebGLSync "WebGLSync"

foreign import javascript unsafe "window[\"WebGLSync\"]" gTypeWebGLSync :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLTexture".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLTexture Mozilla WebGLTexture documentation>
newtype WebGLTexture = WebGLTexture { unWebGLTexture :: JSRef }

instance Eq (WebGLTexture) where
  (WebGLTexture a) == (WebGLTexture b) = js_eq a b

instance PToJSRef WebGLTexture where
  pToJSRef = unWebGLTexture
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLTexture where
  pFromJSRef = WebGLTexture
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLTexture where
  toJSRef = return . unWebGLTexture
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLTexture where
  fromJSRef = return . fmap WebGLTexture . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLTexture where
  toGObject = GObject . unWebGLTexture
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLTexture . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLTexture :: IsGObject obj => obj -> WebGLTexture
castToWebGLTexture = castTo gTypeWebGLTexture "WebGLTexture"

foreign import javascript unsafe "window[\"WebGLTexture\"]" gTypeWebGLTexture :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLTransformFeedback".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLTransformFeedback Mozilla WebGLTransformFeedback documentation>
newtype WebGLTransformFeedback = WebGLTransformFeedback { unWebGLTransformFeedback :: JSRef }

instance Eq (WebGLTransformFeedback) where
  (WebGLTransformFeedback a) == (WebGLTransformFeedback b) = js_eq a b

instance PToJSRef WebGLTransformFeedback where
  pToJSRef = unWebGLTransformFeedback
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLTransformFeedback where
  pFromJSRef = WebGLTransformFeedback
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLTransformFeedback where
  toJSRef = return . unWebGLTransformFeedback
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLTransformFeedback where
  fromJSRef = return . fmap WebGLTransformFeedback . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLTransformFeedback where
  toGObject = GObject . unWebGLTransformFeedback
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLTransformFeedback . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLTransformFeedback :: IsGObject obj => obj -> WebGLTransformFeedback
castToWebGLTransformFeedback = castTo gTypeWebGLTransformFeedback "WebGLTransformFeedback"

foreign import javascript unsafe "window[\"WebGLTransformFeedback\"]" gTypeWebGLTransformFeedback :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLUniformLocation".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLUniformLocation Mozilla WebGLUniformLocation documentation>
newtype WebGLUniformLocation = WebGLUniformLocation { unWebGLUniformLocation :: JSRef }

instance Eq (WebGLUniformLocation) where
  (WebGLUniformLocation a) == (WebGLUniformLocation b) = js_eq a b

instance PToJSRef WebGLUniformLocation where
  pToJSRef = unWebGLUniformLocation
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLUniformLocation where
  pFromJSRef = WebGLUniformLocation
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLUniformLocation where
  toJSRef = return . unWebGLUniformLocation
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLUniformLocation where
  fromJSRef = return . fmap WebGLUniformLocation . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLUniformLocation where
  toGObject = GObject . unWebGLUniformLocation
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLUniformLocation . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLUniformLocation :: IsGObject obj => obj -> WebGLUniformLocation
castToWebGLUniformLocation = castTo gTypeWebGLUniformLocation "WebGLUniformLocation"

foreign import javascript unsafe "window[\"WebGLUniformLocation\"]" gTypeWebGLUniformLocation :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLVertexArrayObject".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLVertexArrayObject Mozilla WebGLVertexArrayObject documentation>
newtype WebGLVertexArrayObject = WebGLVertexArrayObject { unWebGLVertexArrayObject :: JSRef }

instance Eq (WebGLVertexArrayObject) where
  (WebGLVertexArrayObject a) == (WebGLVertexArrayObject b) = js_eq a b

instance PToJSRef WebGLVertexArrayObject where
  pToJSRef = unWebGLVertexArrayObject
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLVertexArrayObject where
  pFromJSRef = WebGLVertexArrayObject
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLVertexArrayObject where
  toJSRef = return . unWebGLVertexArrayObject
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLVertexArrayObject where
  fromJSRef = return . fmap WebGLVertexArrayObject . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLVertexArrayObject where
  toGObject = GObject . unWebGLVertexArrayObject
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLVertexArrayObject . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLVertexArrayObject :: IsGObject obj => obj -> WebGLVertexArrayObject
castToWebGLVertexArrayObject = castTo gTypeWebGLVertexArrayObject "WebGLVertexArrayObject"

foreign import javascript unsafe "window[\"WebGLVertexArrayObject\"]" gTypeWebGLVertexArrayObject :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebGLVertexArrayObjectOES".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebGLVertexArrayObjectOES Mozilla WebGLVertexArrayObjectOES documentation>
newtype WebGLVertexArrayObjectOES = WebGLVertexArrayObjectOES { unWebGLVertexArrayObjectOES :: JSRef }

instance Eq (WebGLVertexArrayObjectOES) where
  (WebGLVertexArrayObjectOES a) == (WebGLVertexArrayObjectOES b) = js_eq a b

instance PToJSRef WebGLVertexArrayObjectOES where
  pToJSRef = unWebGLVertexArrayObjectOES
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebGLVertexArrayObjectOES where
  pFromJSRef = WebGLVertexArrayObjectOES
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebGLVertexArrayObjectOES where
  toJSRef = return . unWebGLVertexArrayObjectOES
  {-# INLINE toJSRef #-}

instance FromJSRef WebGLVertexArrayObjectOES where
  fromJSRef = return . fmap WebGLVertexArrayObjectOES . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebGLVertexArrayObjectOES where
  toGObject = GObject . unWebGLVertexArrayObjectOES
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebGLVertexArrayObjectOES . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebGLVertexArrayObjectOES :: IsGObject obj => obj -> WebGLVertexArrayObjectOES
castToWebGLVertexArrayObjectOES = castTo gTypeWebGLVertexArrayObjectOES "WebGLVertexArrayObjectOES"

foreign import javascript unsafe "window[\"WebGLVertexArrayObjectOES\"]" gTypeWebGLVertexArrayObjectOES :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebKitAnimationEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitAnimationEvent Mozilla WebKitAnimationEvent documentation>
newtype WebKitAnimationEvent = WebKitAnimationEvent { unWebKitAnimationEvent :: JSRef }

instance Eq (WebKitAnimationEvent) where
  (WebKitAnimationEvent a) == (WebKitAnimationEvent b) = js_eq a b

instance PToJSRef WebKitAnimationEvent where
  pToJSRef = unWebKitAnimationEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebKitAnimationEvent where
  pFromJSRef = WebKitAnimationEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebKitAnimationEvent where
  toJSRef = return . unWebKitAnimationEvent
  {-# INLINE toJSRef #-}

instance FromJSRef WebKitAnimationEvent where
  fromJSRef = return . fmap WebKitAnimationEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent WebKitAnimationEvent
instance IsGObject WebKitAnimationEvent where
  toGObject = GObject . unWebKitAnimationEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebKitAnimationEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebKitAnimationEvent :: IsGObject obj => obj -> WebKitAnimationEvent
castToWebKitAnimationEvent = castTo gTypeWebKitAnimationEvent "WebKitAnimationEvent"

foreign import javascript unsafe "window[\"WebKitAnimationEvent\"]" gTypeWebKitAnimationEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebKitCSSFilterValue".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSValueList"
--     * "GHCJS.DOM.CSSValue"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitCSSFilterValue Mozilla WebKitCSSFilterValue documentation>
newtype WebKitCSSFilterValue = WebKitCSSFilterValue { unWebKitCSSFilterValue :: JSRef }

instance Eq (WebKitCSSFilterValue) where
  (WebKitCSSFilterValue a) == (WebKitCSSFilterValue b) = js_eq a b

instance PToJSRef WebKitCSSFilterValue where
  pToJSRef = unWebKitCSSFilterValue
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebKitCSSFilterValue where
  pFromJSRef = WebKitCSSFilterValue
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebKitCSSFilterValue where
  toJSRef = return . unWebKitCSSFilterValue
  {-# INLINE toJSRef #-}

instance FromJSRef WebKitCSSFilterValue where
  fromJSRef = return . fmap WebKitCSSFilterValue . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCSSValueList WebKitCSSFilterValue
instance IsCSSValue WebKitCSSFilterValue
instance IsGObject WebKitCSSFilterValue where
  toGObject = GObject . unWebKitCSSFilterValue
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebKitCSSFilterValue . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebKitCSSFilterValue :: IsGObject obj => obj -> WebKitCSSFilterValue
castToWebKitCSSFilterValue = castTo gTypeWebKitCSSFilterValue "WebKitCSSFilterValue"

foreign import javascript unsafe "window[\"WebKitCSSFilterValue\"]" gTypeWebKitCSSFilterValue :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebKitCSSMatrix".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitCSSMatrix Mozilla WebKitCSSMatrix documentation>
newtype WebKitCSSMatrix = WebKitCSSMatrix { unWebKitCSSMatrix :: JSRef }

instance Eq (WebKitCSSMatrix) where
  (WebKitCSSMatrix a) == (WebKitCSSMatrix b) = js_eq a b

instance PToJSRef WebKitCSSMatrix where
  pToJSRef = unWebKitCSSMatrix
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebKitCSSMatrix where
  pFromJSRef = WebKitCSSMatrix
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebKitCSSMatrix where
  toJSRef = return . unWebKitCSSMatrix
  {-# INLINE toJSRef #-}

instance FromJSRef WebKitCSSMatrix where
  fromJSRef = return . fmap WebKitCSSMatrix . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebKitCSSMatrix where
  toGObject = GObject . unWebKitCSSMatrix
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebKitCSSMatrix . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebKitCSSMatrix :: IsGObject obj => obj -> WebKitCSSMatrix
castToWebKitCSSMatrix = castTo gTypeWebKitCSSMatrix "WebKitCSSMatrix"

foreign import javascript unsafe "window[\"WebKitCSSMatrix\"]" gTypeWebKitCSSMatrix :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebKitCSSRegionRule".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSRule"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitCSSRegionRule Mozilla WebKitCSSRegionRule documentation>
newtype WebKitCSSRegionRule = WebKitCSSRegionRule { unWebKitCSSRegionRule :: JSRef }

instance Eq (WebKitCSSRegionRule) where
  (WebKitCSSRegionRule a) == (WebKitCSSRegionRule b) = js_eq a b

instance PToJSRef WebKitCSSRegionRule where
  pToJSRef = unWebKitCSSRegionRule
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebKitCSSRegionRule where
  pFromJSRef = WebKitCSSRegionRule
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebKitCSSRegionRule where
  toJSRef = return . unWebKitCSSRegionRule
  {-# INLINE toJSRef #-}

instance FromJSRef WebKitCSSRegionRule where
  fromJSRef = return . fmap WebKitCSSRegionRule . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCSSRule WebKitCSSRegionRule
instance IsGObject WebKitCSSRegionRule where
  toGObject = GObject . unWebKitCSSRegionRule
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebKitCSSRegionRule . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebKitCSSRegionRule :: IsGObject obj => obj -> WebKitCSSRegionRule
castToWebKitCSSRegionRule = castTo gTypeWebKitCSSRegionRule "WebKitCSSRegionRule"

foreign import javascript unsafe "window[\"WebKitCSSRegionRule\"]" gTypeWebKitCSSRegionRule :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebKitCSSTransformValue".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSValueList"
--     * "GHCJS.DOM.CSSValue"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitCSSTransformValue Mozilla WebKitCSSTransformValue documentation>
newtype WebKitCSSTransformValue = WebKitCSSTransformValue { unWebKitCSSTransformValue :: JSRef }

instance Eq (WebKitCSSTransformValue) where
  (WebKitCSSTransformValue a) == (WebKitCSSTransformValue b) = js_eq a b

instance PToJSRef WebKitCSSTransformValue where
  pToJSRef = unWebKitCSSTransformValue
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebKitCSSTransformValue where
  pFromJSRef = WebKitCSSTransformValue
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebKitCSSTransformValue where
  toJSRef = return . unWebKitCSSTransformValue
  {-# INLINE toJSRef #-}

instance FromJSRef WebKitCSSTransformValue where
  fromJSRef = return . fmap WebKitCSSTransformValue . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCSSValueList WebKitCSSTransformValue
instance IsCSSValue WebKitCSSTransformValue
instance IsGObject WebKitCSSTransformValue where
  toGObject = GObject . unWebKitCSSTransformValue
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebKitCSSTransformValue . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebKitCSSTransformValue :: IsGObject obj => obj -> WebKitCSSTransformValue
castToWebKitCSSTransformValue = castTo gTypeWebKitCSSTransformValue "WebKitCSSTransformValue"

foreign import javascript unsafe "window[\"WebKitCSSTransformValue\"]" gTypeWebKitCSSTransformValue :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebKitCSSViewportRule".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.CSSRule"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitCSSViewportRule Mozilla WebKitCSSViewportRule documentation>
newtype WebKitCSSViewportRule = WebKitCSSViewportRule { unWebKitCSSViewportRule :: JSRef }

instance Eq (WebKitCSSViewportRule) where
  (WebKitCSSViewportRule a) == (WebKitCSSViewportRule b) = js_eq a b

instance PToJSRef WebKitCSSViewportRule where
  pToJSRef = unWebKitCSSViewportRule
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebKitCSSViewportRule where
  pFromJSRef = WebKitCSSViewportRule
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebKitCSSViewportRule where
  toJSRef = return . unWebKitCSSViewportRule
  {-# INLINE toJSRef #-}

instance FromJSRef WebKitCSSViewportRule where
  fromJSRef = return . fmap WebKitCSSViewportRule . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsCSSRule WebKitCSSViewportRule
instance IsGObject WebKitCSSViewportRule where
  toGObject = GObject . unWebKitCSSViewportRule
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebKitCSSViewportRule . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebKitCSSViewportRule :: IsGObject obj => obj -> WebKitCSSViewportRule
castToWebKitCSSViewportRule = castTo gTypeWebKitCSSViewportRule "WebKitCSSViewportRule"

foreign import javascript unsafe "window[\"WebKitCSSViewportRule\"]" gTypeWebKitCSSViewportRule :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebKitNamedFlow".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitNamedFlow Mozilla WebKitNamedFlow documentation>
newtype WebKitNamedFlow = WebKitNamedFlow { unWebKitNamedFlow :: JSRef }

instance Eq (WebKitNamedFlow) where
  (WebKitNamedFlow a) == (WebKitNamedFlow b) = js_eq a b

instance PToJSRef WebKitNamedFlow where
  pToJSRef = unWebKitNamedFlow
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebKitNamedFlow where
  pFromJSRef = WebKitNamedFlow
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebKitNamedFlow where
  toJSRef = return . unWebKitNamedFlow
  {-# INLINE toJSRef #-}

instance FromJSRef WebKitNamedFlow where
  fromJSRef = return . fmap WebKitNamedFlow . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget WebKitNamedFlow
instance IsGObject WebKitNamedFlow where
  toGObject = GObject . unWebKitNamedFlow
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebKitNamedFlow . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebKitNamedFlow :: IsGObject obj => obj -> WebKitNamedFlow
castToWebKitNamedFlow = castTo gTypeWebKitNamedFlow "WebKitNamedFlow"

foreign import javascript unsafe "window[\"WebKitNamedFlow\"]" gTypeWebKitNamedFlow :: GType
#else
type IsWebKitNamedFlow o = WebKitNamedFlowClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebKitNamespace".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitNamespace Mozilla WebKitNamespace documentation>
newtype WebKitNamespace = WebKitNamespace { unWebKitNamespace :: JSRef }

instance Eq (WebKitNamespace) where
  (WebKitNamespace a) == (WebKitNamespace b) = js_eq a b

instance PToJSRef WebKitNamespace where
  pToJSRef = unWebKitNamespace
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebKitNamespace where
  pFromJSRef = WebKitNamespace
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebKitNamespace where
  toJSRef = return . unWebKitNamespace
  {-# INLINE toJSRef #-}

instance FromJSRef WebKitNamespace where
  fromJSRef = return . fmap WebKitNamespace . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebKitNamespace where
  toGObject = GObject . unWebKitNamespace
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebKitNamespace . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebKitNamespace :: IsGObject obj => obj -> WebKitNamespace
castToWebKitNamespace = castTo gTypeWebKitNamespace "WebKitNamespace"

foreign import javascript unsafe "window[\"WebKitNamespace\"]" gTypeWebKitNamespace :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebKitPlaybackTargetAvailabilityEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitPlaybackTargetAvailabilityEvent Mozilla WebKitPlaybackTargetAvailabilityEvent documentation>
newtype WebKitPlaybackTargetAvailabilityEvent = WebKitPlaybackTargetAvailabilityEvent { unWebKitPlaybackTargetAvailabilityEvent :: JSRef }

instance Eq (WebKitPlaybackTargetAvailabilityEvent) where
  (WebKitPlaybackTargetAvailabilityEvent a) == (WebKitPlaybackTargetAvailabilityEvent b) = js_eq a b

instance PToJSRef WebKitPlaybackTargetAvailabilityEvent where
  pToJSRef = unWebKitPlaybackTargetAvailabilityEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebKitPlaybackTargetAvailabilityEvent where
  pFromJSRef = WebKitPlaybackTargetAvailabilityEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebKitPlaybackTargetAvailabilityEvent where
  toJSRef = return . unWebKitPlaybackTargetAvailabilityEvent
  {-# INLINE toJSRef #-}

instance FromJSRef WebKitPlaybackTargetAvailabilityEvent where
  fromJSRef = return . fmap WebKitPlaybackTargetAvailabilityEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent WebKitPlaybackTargetAvailabilityEvent
instance IsGObject WebKitPlaybackTargetAvailabilityEvent where
  toGObject = GObject . unWebKitPlaybackTargetAvailabilityEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebKitPlaybackTargetAvailabilityEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebKitPlaybackTargetAvailabilityEvent :: IsGObject obj => obj -> WebKitPlaybackTargetAvailabilityEvent
castToWebKitPlaybackTargetAvailabilityEvent = castTo gTypeWebKitPlaybackTargetAvailabilityEvent "WebKitPlaybackTargetAvailabilityEvent"

foreign import javascript unsafe "window[\"WebKitPlaybackTargetAvailabilityEvent\"]" gTypeWebKitPlaybackTargetAvailabilityEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebKitPoint".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitPoint Mozilla WebKitPoint documentation>
newtype WebKitPoint = WebKitPoint { unWebKitPoint :: JSRef }

instance Eq (WebKitPoint) where
  (WebKitPoint a) == (WebKitPoint b) = js_eq a b

instance PToJSRef WebKitPoint where
  pToJSRef = unWebKitPoint
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebKitPoint where
  pFromJSRef = WebKitPoint
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebKitPoint where
  toJSRef = return . unWebKitPoint
  {-# INLINE toJSRef #-}

instance FromJSRef WebKitPoint where
  fromJSRef = return . fmap WebKitPoint . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WebKitPoint where
  toGObject = GObject . unWebKitPoint
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebKitPoint . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebKitPoint :: IsGObject obj => obj -> WebKitPoint
castToWebKitPoint = castTo gTypeWebKitPoint "WebKitPoint"

foreign import javascript unsafe "window[\"WebKitPoint\"]" gTypeWebKitPoint :: GType
#else
type IsWebKitPoint o = WebKitPointClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebKitTransitionEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebKitTransitionEvent Mozilla WebKitTransitionEvent documentation>
newtype WebKitTransitionEvent = WebKitTransitionEvent { unWebKitTransitionEvent :: JSRef }

instance Eq (WebKitTransitionEvent) where
  (WebKitTransitionEvent a) == (WebKitTransitionEvent b) = js_eq a b

instance PToJSRef WebKitTransitionEvent where
  pToJSRef = unWebKitTransitionEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebKitTransitionEvent where
  pFromJSRef = WebKitTransitionEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebKitTransitionEvent where
  toJSRef = return . unWebKitTransitionEvent
  {-# INLINE toJSRef #-}

instance FromJSRef WebKitTransitionEvent where
  fromJSRef = return . fmap WebKitTransitionEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEvent WebKitTransitionEvent
instance IsGObject WebKitTransitionEvent where
  toGObject = GObject . unWebKitTransitionEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebKitTransitionEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebKitTransitionEvent :: IsGObject obj => obj -> WebKitTransitionEvent
castToWebKitTransitionEvent = castTo gTypeWebKitTransitionEvent "WebKitTransitionEvent"

foreign import javascript unsafe "window[\"WebKitTransitionEvent\"]" gTypeWebKitTransitionEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WebSocket".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WebSocket Mozilla WebSocket documentation>
newtype WebSocket = WebSocket { unWebSocket :: JSRef }

instance Eq (WebSocket) where
  (WebSocket a) == (WebSocket b) = js_eq a b

instance PToJSRef WebSocket where
  pToJSRef = unWebSocket
  {-# INLINE pToJSRef #-}

instance PFromJSRef WebSocket where
  pFromJSRef = WebSocket
  {-# INLINE pFromJSRef #-}

instance ToJSRef WebSocket where
  toJSRef = return . unWebSocket
  {-# INLINE toJSRef #-}

instance FromJSRef WebSocket where
  fromJSRef = return . fmap WebSocket . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget WebSocket
instance IsGObject WebSocket where
  toGObject = GObject . unWebSocket
  {-# INLINE toGObject #-}
  unsafeCastGObject = WebSocket . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWebSocket :: IsGObject obj => obj -> WebSocket
castToWebSocket = castTo gTypeWebSocket "WebSocket"

foreign import javascript unsafe "window[\"WebSocket\"]" gTypeWebSocket :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WheelEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.MouseEvent"
--     * "GHCJS.DOM.UIEvent"
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WheelEvent Mozilla WheelEvent documentation>
newtype WheelEvent = WheelEvent { unWheelEvent :: JSRef }

instance Eq (WheelEvent) where
  (WheelEvent a) == (WheelEvent b) = js_eq a b

instance PToJSRef WheelEvent where
  pToJSRef = unWheelEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef WheelEvent where
  pFromJSRef = WheelEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef WheelEvent where
  toJSRef = return . unWheelEvent
  {-# INLINE toJSRef #-}

instance FromJSRef WheelEvent where
  fromJSRef = return . fmap WheelEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsMouseEvent WheelEvent
instance IsUIEvent WheelEvent
instance IsEvent WheelEvent
instance IsGObject WheelEvent where
  toGObject = GObject . unWheelEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = WheelEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWheelEvent :: IsGObject obj => obj -> WheelEvent
castToWheelEvent = castTo gTypeWheelEvent "WheelEvent"

foreign import javascript unsafe "window[\"WheelEvent\"]" gTypeWheelEvent :: GType
#else
#ifndef USE_OLD_WEBKIT
type IsWheelEvent o = WheelEventClass o
#endif
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Window".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Window Mozilla Window documentation>
newtype Window = Window { unWindow :: JSRef }

instance Eq (Window) where
  (Window a) == (Window b) = js_eq a b

instance PToJSRef Window where
  pToJSRef = unWindow
  {-# INLINE pToJSRef #-}

instance PFromJSRef Window where
  pFromJSRef = Window
  {-# INLINE pFromJSRef #-}

instance ToJSRef Window where
  toJSRef = return . unWindow
  {-# INLINE toJSRef #-}

instance FromJSRef Window where
  fromJSRef = return . fmap Window . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget Window
instance IsGObject Window where
  toGObject = GObject . unWindow
  {-# INLINE toGObject #-}
  unsafeCastGObject = Window . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWindow :: IsGObject obj => obj -> Window
castToWindow = castTo gTypeWindow "Window"

foreign import javascript unsafe "window[\"Window\"]" gTypeWindow :: GType
#else
type IsWindow o = WindowClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WindowBase64".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WindowBase64 Mozilla WindowBase64 documentation>
newtype WindowBase64 = WindowBase64 { unWindowBase64 :: JSRef }

instance Eq (WindowBase64) where
  (WindowBase64 a) == (WindowBase64 b) = js_eq a b

instance PToJSRef WindowBase64 where
  pToJSRef = unWindowBase64
  {-# INLINE pToJSRef #-}

instance PFromJSRef WindowBase64 where
  pFromJSRef = WindowBase64
  {-# INLINE pFromJSRef #-}

instance ToJSRef WindowBase64 where
  toJSRef = return . unWindowBase64
  {-# INLINE toJSRef #-}

instance FromJSRef WindowBase64 where
  fromJSRef = return . fmap WindowBase64 . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WindowBase64 where
  toGObject = GObject . unWindowBase64
  {-# INLINE toGObject #-}
  unsafeCastGObject = WindowBase64 . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWindowBase64 :: IsGObject obj => obj -> WindowBase64
castToWindowBase64 = castTo gTypeWindowBase64 "WindowBase64"

foreign import javascript unsafe "window[\"WindowBase64\"]" gTypeWindowBase64 :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WindowTimers".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WindowTimers Mozilla WindowTimers documentation>
newtype WindowTimers = WindowTimers { unWindowTimers :: JSRef }

instance Eq (WindowTimers) where
  (WindowTimers a) == (WindowTimers b) = js_eq a b

instance PToJSRef WindowTimers where
  pToJSRef = unWindowTimers
  {-# INLINE pToJSRef #-}

instance PFromJSRef WindowTimers where
  pFromJSRef = WindowTimers
  {-# INLINE pFromJSRef #-}

instance ToJSRef WindowTimers where
  toJSRef = return . unWindowTimers
  {-# INLINE toJSRef #-}

instance FromJSRef WindowTimers where
  fromJSRef = return . fmap WindowTimers . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WindowTimers where
  toGObject = GObject . unWindowTimers
  {-# INLINE toGObject #-}
  unsafeCastGObject = WindowTimers . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWindowTimers :: IsGObject obj => obj -> WindowTimers
castToWindowTimers = castTo gTypeWindowTimers "WindowTimers"

foreign import javascript unsafe "window[\"WindowTimers\"]" gTypeWindowTimers :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.Worker".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/Worker Mozilla Worker documentation>
newtype Worker = Worker { unWorker :: JSRef }

instance Eq (Worker) where
  (Worker a) == (Worker b) = js_eq a b

instance PToJSRef Worker where
  pToJSRef = unWorker
  {-# INLINE pToJSRef #-}

instance PFromJSRef Worker where
  pFromJSRef = Worker
  {-# INLINE pFromJSRef #-}

instance ToJSRef Worker where
  toJSRef = return . unWorker
  {-# INLINE toJSRef #-}

instance FromJSRef Worker where
  fromJSRef = return . fmap Worker . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget Worker
instance IsGObject Worker where
  toGObject = GObject . unWorker
  {-# INLINE toGObject #-}
  unsafeCastGObject = Worker . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWorker :: IsGObject obj => obj -> Worker
castToWorker = castTo gTypeWorker "Worker"

foreign import javascript unsafe "window[\"Worker\"]" gTypeWorker :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WorkerGlobalScope".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WorkerGlobalScope Mozilla WorkerGlobalScope documentation>
newtype WorkerGlobalScope = WorkerGlobalScope { unWorkerGlobalScope :: JSRef }

instance Eq (WorkerGlobalScope) where
  (WorkerGlobalScope a) == (WorkerGlobalScope b) = js_eq a b

instance PToJSRef WorkerGlobalScope where
  pToJSRef = unWorkerGlobalScope
  {-# INLINE pToJSRef #-}

instance PFromJSRef WorkerGlobalScope where
  pFromJSRef = WorkerGlobalScope
  {-# INLINE pFromJSRef #-}

instance ToJSRef WorkerGlobalScope where
  toJSRef = return . unWorkerGlobalScope
  {-# INLINE toJSRef #-}

instance FromJSRef WorkerGlobalScope where
  fromJSRef = return . fmap WorkerGlobalScope . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

class IsEventTarget o => IsWorkerGlobalScope o
toWorkerGlobalScope :: IsWorkerGlobalScope o => o -> WorkerGlobalScope
toWorkerGlobalScope = unsafeCastGObject . toGObject

instance IsWorkerGlobalScope WorkerGlobalScope
instance IsEventTarget WorkerGlobalScope
instance IsGObject WorkerGlobalScope where
  toGObject = GObject . unWorkerGlobalScope
  {-# INLINE toGObject #-}
  unsafeCastGObject = WorkerGlobalScope . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWorkerGlobalScope :: IsGObject obj => obj -> WorkerGlobalScope
castToWorkerGlobalScope = castTo gTypeWorkerGlobalScope "WorkerGlobalScope"

foreign import javascript unsafe "window[\"WorkerGlobalScope\"]" gTypeWorkerGlobalScope :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WorkerLocation".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WorkerLocation Mozilla WorkerLocation documentation>
newtype WorkerLocation = WorkerLocation { unWorkerLocation :: JSRef }

instance Eq (WorkerLocation) where
  (WorkerLocation a) == (WorkerLocation b) = js_eq a b

instance PToJSRef WorkerLocation where
  pToJSRef = unWorkerLocation
  {-# INLINE pToJSRef #-}

instance PFromJSRef WorkerLocation where
  pFromJSRef = WorkerLocation
  {-# INLINE pFromJSRef #-}

instance ToJSRef WorkerLocation where
  toJSRef = return . unWorkerLocation
  {-# INLINE toJSRef #-}

instance FromJSRef WorkerLocation where
  fromJSRef = return . fmap WorkerLocation . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WorkerLocation where
  toGObject = GObject . unWorkerLocation
  {-# INLINE toGObject #-}
  unsafeCastGObject = WorkerLocation . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWorkerLocation :: IsGObject obj => obj -> WorkerLocation
castToWorkerLocation = castTo gTypeWorkerLocation "WorkerLocation"

foreign import javascript unsafe "window[\"WorkerLocation\"]" gTypeWorkerLocation :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.WorkerNavigator".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/WorkerNavigator Mozilla WorkerNavigator documentation>
newtype WorkerNavigator = WorkerNavigator { unWorkerNavigator :: JSRef }

instance Eq (WorkerNavigator) where
  (WorkerNavigator a) == (WorkerNavigator b) = js_eq a b

instance PToJSRef WorkerNavigator where
  pToJSRef = unWorkerNavigator
  {-# INLINE pToJSRef #-}

instance PFromJSRef WorkerNavigator where
  pFromJSRef = WorkerNavigator
  {-# INLINE pFromJSRef #-}

instance ToJSRef WorkerNavigator where
  toJSRef = return . unWorkerNavigator
  {-# INLINE toJSRef #-}

instance FromJSRef WorkerNavigator where
  fromJSRef = return . fmap WorkerNavigator . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject WorkerNavigator where
  toGObject = GObject . unWorkerNavigator
  {-# INLINE toGObject #-}
  unsafeCastGObject = WorkerNavigator . unGObject
  {-# INLINE unsafeCastGObject #-}

castToWorkerNavigator :: IsGObject obj => obj -> WorkerNavigator
castToWorkerNavigator = castTo gTypeWorkerNavigator "WorkerNavigator"

foreign import javascript unsafe "window[\"WorkerNavigator\"]" gTypeWorkerNavigator :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.XMLHttpRequest".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest Mozilla XMLHttpRequest documentation>
newtype XMLHttpRequest = XMLHttpRequest { unXMLHttpRequest :: JSRef }

instance Eq (XMLHttpRequest) where
  (XMLHttpRequest a) == (XMLHttpRequest b) = js_eq a b

instance PToJSRef XMLHttpRequest where
  pToJSRef = unXMLHttpRequest
  {-# INLINE pToJSRef #-}

instance PFromJSRef XMLHttpRequest where
  pFromJSRef = XMLHttpRequest
  {-# INLINE pFromJSRef #-}

instance ToJSRef XMLHttpRequest where
  toJSRef = return . unXMLHttpRequest
  {-# INLINE toJSRef #-}

instance FromJSRef XMLHttpRequest where
  fromJSRef = return . fmap XMLHttpRequest . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget XMLHttpRequest
instance IsGObject XMLHttpRequest where
  toGObject = GObject . unXMLHttpRequest
  {-# INLINE toGObject #-}
  unsafeCastGObject = XMLHttpRequest . unGObject
  {-# INLINE unsafeCastGObject #-}

castToXMLHttpRequest :: IsGObject obj => obj -> XMLHttpRequest
castToXMLHttpRequest = castTo gTypeXMLHttpRequest "XMLHttpRequest"

foreign import javascript unsafe "window[\"XMLHttpRequest\"]" gTypeXMLHttpRequest :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.XMLHttpRequestProgressEvent".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.ProgressEvent"
--     * "GHCJS.DOM.Event"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequestProgressEvent Mozilla XMLHttpRequestProgressEvent documentation>
newtype XMLHttpRequestProgressEvent = XMLHttpRequestProgressEvent { unXMLHttpRequestProgressEvent :: JSRef }

instance Eq (XMLHttpRequestProgressEvent) where
  (XMLHttpRequestProgressEvent a) == (XMLHttpRequestProgressEvent b) = js_eq a b

instance PToJSRef XMLHttpRequestProgressEvent where
  pToJSRef = unXMLHttpRequestProgressEvent
  {-# INLINE pToJSRef #-}

instance PFromJSRef XMLHttpRequestProgressEvent where
  pFromJSRef = XMLHttpRequestProgressEvent
  {-# INLINE pFromJSRef #-}

instance ToJSRef XMLHttpRequestProgressEvent where
  toJSRef = return . unXMLHttpRequestProgressEvent
  {-# INLINE toJSRef #-}

instance FromJSRef XMLHttpRequestProgressEvent where
  fromJSRef = return . fmap XMLHttpRequestProgressEvent . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsProgressEvent XMLHttpRequestProgressEvent
instance IsEvent XMLHttpRequestProgressEvent
instance IsGObject XMLHttpRequestProgressEvent where
  toGObject = GObject . unXMLHttpRequestProgressEvent
  {-# INLINE toGObject #-}
  unsafeCastGObject = XMLHttpRequestProgressEvent . unGObject
  {-# INLINE unsafeCastGObject #-}

castToXMLHttpRequestProgressEvent :: IsGObject obj => obj -> XMLHttpRequestProgressEvent
castToXMLHttpRequestProgressEvent = castTo gTypeXMLHttpRequestProgressEvent "XMLHttpRequestProgressEvent"

foreign import javascript unsafe "window[\"XMLHttpRequestProgressEvent\"]" gTypeXMLHttpRequestProgressEvent :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.XMLHttpRequestUpload".
-- Base interface functions are in:
--
--     * "GHCJS.DOM.EventTarget"
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequestUpload Mozilla XMLHttpRequestUpload documentation>
newtype XMLHttpRequestUpload = XMLHttpRequestUpload { unXMLHttpRequestUpload :: JSRef }

instance Eq (XMLHttpRequestUpload) where
  (XMLHttpRequestUpload a) == (XMLHttpRequestUpload b) = js_eq a b

instance PToJSRef XMLHttpRequestUpload where
  pToJSRef = unXMLHttpRequestUpload
  {-# INLINE pToJSRef #-}

instance PFromJSRef XMLHttpRequestUpload where
  pFromJSRef = XMLHttpRequestUpload
  {-# INLINE pFromJSRef #-}

instance ToJSRef XMLHttpRequestUpload where
  toJSRef = return . unXMLHttpRequestUpload
  {-# INLINE toJSRef #-}

instance FromJSRef XMLHttpRequestUpload where
  fromJSRef = return . fmap XMLHttpRequestUpload . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsEventTarget XMLHttpRequestUpload
instance IsGObject XMLHttpRequestUpload where
  toGObject = GObject . unXMLHttpRequestUpload
  {-# INLINE toGObject #-}
  unsafeCastGObject = XMLHttpRequestUpload . unGObject
  {-# INLINE unsafeCastGObject #-}

castToXMLHttpRequestUpload :: IsGObject obj => obj -> XMLHttpRequestUpload
castToXMLHttpRequestUpload = castTo gTypeXMLHttpRequestUpload "XMLHttpRequestUpload"

foreign import javascript unsafe "window[\"XMLHttpRequestUpload\"]" gTypeXMLHttpRequestUpload :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.XMLSerializer".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/XMLSerializer Mozilla XMLSerializer documentation>
newtype XMLSerializer = XMLSerializer { unXMLSerializer :: JSRef }

instance Eq (XMLSerializer) where
  (XMLSerializer a) == (XMLSerializer b) = js_eq a b

instance PToJSRef XMLSerializer where
  pToJSRef = unXMLSerializer
  {-# INLINE pToJSRef #-}

instance PFromJSRef XMLSerializer where
  pFromJSRef = XMLSerializer
  {-# INLINE pFromJSRef #-}

instance ToJSRef XMLSerializer where
  toJSRef = return . unXMLSerializer
  {-# INLINE toJSRef #-}

instance FromJSRef XMLSerializer where
  fromJSRef = return . fmap XMLSerializer . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject XMLSerializer where
  toGObject = GObject . unXMLSerializer
  {-# INLINE toGObject #-}
  unsafeCastGObject = XMLSerializer . unGObject
  {-# INLINE unsafeCastGObject #-}

castToXMLSerializer :: IsGObject obj => obj -> XMLSerializer
castToXMLSerializer = castTo gTypeXMLSerializer "XMLSerializer"

foreign import javascript unsafe "window[\"XMLSerializer\"]" gTypeXMLSerializer :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.XPathEvaluator".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/XPathEvaluator Mozilla XPathEvaluator documentation>
newtype XPathEvaluator = XPathEvaluator { unXPathEvaluator :: JSRef }

instance Eq (XPathEvaluator) where
  (XPathEvaluator a) == (XPathEvaluator b) = js_eq a b

instance PToJSRef XPathEvaluator where
  pToJSRef = unXPathEvaluator
  {-# INLINE pToJSRef #-}

instance PFromJSRef XPathEvaluator where
  pFromJSRef = XPathEvaluator
  {-# INLINE pFromJSRef #-}

instance ToJSRef XPathEvaluator where
  toJSRef = return . unXPathEvaluator
  {-# INLINE toJSRef #-}

instance FromJSRef XPathEvaluator where
  fromJSRef = return . fmap XPathEvaluator . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject XPathEvaluator where
  toGObject = GObject . unXPathEvaluator
  {-# INLINE toGObject #-}
  unsafeCastGObject = XPathEvaluator . unGObject
  {-# INLINE unsafeCastGObject #-}

castToXPathEvaluator :: IsGObject obj => obj -> XPathEvaluator
castToXPathEvaluator = castTo gTypeXPathEvaluator "XPathEvaluator"

foreign import javascript unsafe "window[\"XPathEvaluator\"]" gTypeXPathEvaluator :: GType
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.XPathExpression".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/XPathExpression Mozilla XPathExpression documentation>
newtype XPathExpression = XPathExpression { unXPathExpression :: JSRef }

instance Eq (XPathExpression) where
  (XPathExpression a) == (XPathExpression b) = js_eq a b

instance PToJSRef XPathExpression where
  pToJSRef = unXPathExpression
  {-# INLINE pToJSRef #-}

instance PFromJSRef XPathExpression where
  pFromJSRef = XPathExpression
  {-# INLINE pFromJSRef #-}

instance ToJSRef XPathExpression where
  toJSRef = return . unXPathExpression
  {-# INLINE toJSRef #-}

instance FromJSRef XPathExpression where
  fromJSRef = return . fmap XPathExpression . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject XPathExpression where
  toGObject = GObject . unXPathExpression
  {-# INLINE toGObject #-}
  unsafeCastGObject = XPathExpression . unGObject
  {-# INLINE unsafeCastGObject #-}

castToXPathExpression :: IsGObject obj => obj -> XPathExpression
castToXPathExpression = castTo gTypeXPathExpression "XPathExpression"

foreign import javascript unsafe "window[\"XPathExpression\"]" gTypeXPathExpression :: GType
#else
type IsXPathExpression o = XPathExpressionClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.XPathNSResolver".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/XPathNSResolver Mozilla XPathNSResolver documentation>
newtype XPathNSResolver = XPathNSResolver { unXPathNSResolver :: JSRef }

instance Eq (XPathNSResolver) where
  (XPathNSResolver a) == (XPathNSResolver b) = js_eq a b

instance PToJSRef XPathNSResolver where
  pToJSRef = unXPathNSResolver
  {-# INLINE pToJSRef #-}

instance PFromJSRef XPathNSResolver where
  pFromJSRef = XPathNSResolver
  {-# INLINE pFromJSRef #-}

instance ToJSRef XPathNSResolver where
  toJSRef = return . unXPathNSResolver
  {-# INLINE toJSRef #-}

instance FromJSRef XPathNSResolver where
  fromJSRef = return . fmap XPathNSResolver . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject XPathNSResolver where
  toGObject = GObject . unXPathNSResolver
  {-# INLINE toGObject #-}
  unsafeCastGObject = XPathNSResolver . unGObject
  {-# INLINE unsafeCastGObject #-}

castToXPathNSResolver :: IsGObject obj => obj -> XPathNSResolver
castToXPathNSResolver = castTo gTypeXPathNSResolver "XPathNSResolver"

foreign import javascript unsafe "window[\"XPathNSResolver\"]" gTypeXPathNSResolver :: GType
#else
type IsXPathNSResolver o = XPathNSResolverClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.XPathResult".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/XPathResult Mozilla XPathResult documentation>
newtype XPathResult = XPathResult { unXPathResult :: JSRef }

instance Eq (XPathResult) where
  (XPathResult a) == (XPathResult b) = js_eq a b

instance PToJSRef XPathResult where
  pToJSRef = unXPathResult
  {-# INLINE pToJSRef #-}

instance PFromJSRef XPathResult where
  pFromJSRef = XPathResult
  {-# INLINE pFromJSRef #-}

instance ToJSRef XPathResult where
  toJSRef = return . unXPathResult
  {-# INLINE toJSRef #-}

instance FromJSRef XPathResult where
  fromJSRef = return . fmap XPathResult . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject XPathResult where
  toGObject = GObject . unXPathResult
  {-# INLINE toGObject #-}
  unsafeCastGObject = XPathResult . unGObject
  {-# INLINE unsafeCastGObject #-}

castToXPathResult :: IsGObject obj => obj -> XPathResult
castToXPathResult = castTo gTypeXPathResult "XPathResult"

foreign import javascript unsafe "window[\"XPathResult\"]" gTypeXPathResult :: GType
#else
type IsXPathResult o = XPathResultClass o
#endif


#if (defined(ghcjs_HOST_OS) && defined(USE_JAVASCRIPTFFI)) || !defined(USE_WEBKIT)
-- | Functions for this inteface are in "GHCJS.DOM.XSLTProcessor".
--
-- <https://developer.mozilla.org/en-US/docs/Web/API/XSLTProcessor Mozilla XSLTProcessor documentation>
newtype XSLTProcessor = XSLTProcessor { unXSLTProcessor :: JSRef }

instance Eq (XSLTProcessor) where
  (XSLTProcessor a) == (XSLTProcessor b) = js_eq a b

instance PToJSRef XSLTProcessor where
  pToJSRef = unXSLTProcessor
  {-# INLINE pToJSRef #-}

instance PFromJSRef XSLTProcessor where
  pFromJSRef = XSLTProcessor
  {-# INLINE pFromJSRef #-}

instance ToJSRef XSLTProcessor where
  toJSRef = return . unXSLTProcessor
  {-# INLINE toJSRef #-}

instance FromJSRef XSLTProcessor where
  fromJSRef = return . fmap XSLTProcessor . maybeJSNullOrUndefined
  {-# INLINE fromJSRef #-}

instance IsGObject XSLTProcessor where
  toGObject = GObject . unXSLTProcessor
  {-# INLINE toGObject #-}
  unsafeCastGObject = XSLTProcessor . unGObject
  {-# INLINE unsafeCastGObject #-}

castToXSLTProcessor :: IsGObject obj => obj -> XSLTProcessor
castToXSLTProcessor = castTo gTypeXSLTProcessor "XSLTProcessor"

foreign import javascript unsafe "window[\"XSLTProcessor\"]" gTypeXSLTProcessor :: GType
#endif


