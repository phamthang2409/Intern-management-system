/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.ConcurrentHashMap;

/**
 *
 * @author Tran Ngoc Phuoc
 */
public class TCPServer {
    private static final ConcurrentHashMap<String, PrintWriter> clients = new ConcurrentHashMap<>();

    public static void main(String[] args) {
        try (ServerSocket serverSocket = new ServerSocket(12345)) {
            System.out.println("Server is running...");

            while (true) {
                Socket clientSocket = serverSocket.accept();
                new ClientHandler(clientSocket).start();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    static class ClientHandler extends Thread {
        private final Socket socket;
        private PrintWriter out;
        private BufferedReader in;
        private String clientName;

        public ClientHandler(Socket socket) {
            this.socket = socket;
        }

        @Override
        public void run() {
            try {
                in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                out = new PrintWriter(socket.getOutputStream(), true);
                // Lấy tên client (user hoặc admin)
                clientName = in.readLine();
                clients.put(clientName, out);

                System.out.println(clientName + " connected.");

                // Lắng nghe và xử lý tin nhắn
                String message;
                while ((message = in.readLine()) != null) {
                    System.out.println(clientName + ": " + message);
                    broadcastMessage(clientName, message);
                }
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                try {
                    try (socket) {
                        if (clientName != null) {
                            clients.remove(clientName);
                            System.out.println(clientName + " disconnected.");
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        private void broadcastMessage(String sender, String message) {
            for (String client : clients.keySet()) {
                if (!client.equals(sender)) {
                    clients.get(client).println(sender + ": " + message);
                }
            }
        }
    }
}
