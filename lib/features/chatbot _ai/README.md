# Chatbot AI Feature

This feature provides a complete implementation for a chatbot with text messaging, speech-to-text, and text-to-speech capabilities.

## Models

### ChatMessageModel

Handles chat messages between user and AI:

- `message`: User's message text
- `response`: AI's response text
- `timestamp`: When the message was sent
- `isUserMessage`: Whether the message is from user or AI

### SpeechToTextModel

Handles speech-to-text conversion:

- `transcription`: The transcribed text from audio
- `error`: Error message if conversion fails
- `isSuccess`: Helper getter to check if conversion was successful

### TextToSpeechModel

Handles text-to-speech conversion:

- `text`: Text to convert to speech
- `audioData`: Binary audio data (MP3 format)
- `error`: Error message if conversion fails
- `isSuccess`: Helper getter to check if conversion was successful

## Repository

### ChatbotRepo (Abstract)

Defines the interface for chatbot operations:

- `sendTextMessage(String message)`: Send text message and get AI response
- `speechToText(File audioFile)`: Convert audio file to text
- `textToSpeech(String text)`: Convert text to audio

### ChatbotRepoImpl (Implementation)

Implements the repository interface using the API endpoints:

- Uses the Hugging Face Spaces API base URL: `https://moodydev-evolva.hf.space/api/`
- No authentication required
- Supports multipart/form-data for audio uploads
- Returns binary audio data for text-to-speech

## Cubit

### ChatbotCubit

Manages the state and business logic:

- `sendTextMessage(String message)`: Send text message
- `convertSpeechToText(File audioFile)`: Convert speech to text
- `convertTextToSpeech(String text)`: Convert text to speech
- `clearMessages()`: Clear chat history
- `reset()`: Reset to initial state

### States

- `ChatbotInitial`: Initial state
- `ChatbotLoading`: Loading state during API calls
- `ChatbotMessagesUpdated`: When messages are updated
- `ChatbotTextToSpeechSuccess`: When text-to-speech succeeds
- `ChatbotError`: When an error occurs

## Usage Example

```dart
// Create the cubit
final chatbotCubit = ChatbotCubit(ChatbotRepoImpl());

// Send a text message
await chatbotCubit.sendTextMessage("Hello, how are you?");

// Convert speech to text
File audioFile = File('path/to/audio.mp3');
await chatbotCubit.convertSpeechToText(audioFile);

// Convert text to speech
await chatbotCubit.convertTextToSpeech("Hello, this is a test");

// Listen to state changes
BlocListener<ChatbotCubit, ChatbotState>(
  listener: (context, state) {
    if (state is ChatbotMessagesUpdated) {
      // Update UI with new messages
      print('Messages: ${state.messages}');
    } else if (state is ChatbotTextToSpeechSuccess) {
      // Play the audio
      print('Audio data received: ${state.audioData.length} bytes');
    } else if (state is ChatbotError) {
      // Show error message
      print('Error: ${state.message}');
    }
  },
  child: YourWidget(),
)
```

## API Endpoints

The implementation uses these API endpoints:

1. **POST /api/chat**

   - Send text message to get AI response
   - Request: `{"message": "Your message here"}`
   - Response: `{"message": "AI response text"}`

2. **POST /api/speech-to-text**

   - Convert audio to text
   - Request: Multipart form with audio file
   - Response: `{"transcription": "Transcribed text"}`

3. **POST /api/text-to-speech**
   - Convert text to audio
   - Request: `{"text": "Text to convert"}`
   - Response: Binary audio data (MP3)

## Error Handling

All endpoints may return error responses:

```json
{
  "detail": "Error message description"
}
```

The implementation handles these errors and provides appropriate error states in the cubit.
