# Welcome to PioLavorgna’s GitHub page! 🔥

[![Linkedin: Pio_Lavorgna](https://img.shields.io/badge/-Pio_Lavorgna-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/piolavorgna/)](https://www.linkedin.com/in/piolavorgna/)
[![GitHub Pio_Lavorgna](https://img.shields.io/github/followers/PioLavorgna?label=follow&style=social)](https://github.com/PioLavorgna)

# LWC Platform Event Spinner ⚡

A lightweight Lightning Web Component designed to display a dynamic spinner that reacts to Salesforce Platform Events. It offers real-time UI updates during asynchronous operations, with styling handled through customizable CSS for a smooth and responsive user experience.

## 🚀 Project Overview

This component listens to Platform Events and updates the interface accordingly, providing users with visual feedback on backend processes. It is ideal for scenarios where asynchronous work needs to be reflected immediately in the UI.

## 🖥️ How It Works

- The LWC subscribes to a Salesforce Platform Event channel.
- When an event is received, the spinner automatically shows, hides, or updates based on payload values.
- CSS rules manage animations, visibility, and overall look and feel.
- The component can be easily embedded into any Lightning page or custom flow.

## 🔧 Tech Stack

- Salesforce LWC  
- Platform Events  
- Javascript  
- HTML / CSS  

## 📦 Installation

1. Deploy the LWC folder into your Salesforce org.  
2. Ensure the related Platform Event is created and published by your backend logic.  
3. Add the component to a Lightning Page or App Builder layout.  
4. Customize CSS as needed to match your design requirements.

## 📝 Usage Notes

The component is built for flexibility: you can expand its behavior, add UI transitions, or integrate it with additional Salesforce services like Apex triggers or Flow events.

## ❓ FAQ

### How can I show or hide a spinner in LWC using Salesforce Platform Events?
A frequent question among Salesforce developers. This component solves it by subscribing to a Platform Event channel and updating the spinner automatically based on event payload data.

### How do I subscribe to Salesforce Platform Events inside an LWC?
Developers often look for ways to manage real-time updates without Apex polling. This LWC listens to Platform Events using the Lightning EMP API, enabling instant UI reactions to backend processes.

### What is the best way to handle real-time UI updates in Salesforce Lightning?
Searches often focus on performance and reliability. Platform Events combined with LWC provide a scalable approach to reflect asynchronous operations directly in the UI.

### How can I customize a spinner’s style in LWC?
Many users ask how to modify loaders without breaking SLDS. This component uses custom CSS, allowing you to adapt animations, colors, and visibility to your design system.

### How do I debug Platform Event subscriptions in LWC?
A recurring need for developers. You can use browser logs, check event delivery in Salesforce Setup, and validate channel permissions to ensure successful event streaming.
