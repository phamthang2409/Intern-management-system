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
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/**
 *
 * @author Tran Ngoc Phuoc
 */
public class TCPServer {
    private static List<ClientHandler> clientList = new ArrayList<>();

    public static void main(String[] args) {
        int port = 12345; // Cổng server
        try (ServerSocket serverSocket = new ServerSocket(port)) {
            System.out.println("Server is running on port " + port);

            while (true) {
                // Chấp nhận kết nối từ client
                Socket clientSocket = serverSocket.accept();
                System.out.println("New client connected: " + clientSocket.getInetAddress());

                // Tạo một ClientHandler để xử lý client
                ClientHandler clientHandler = new ClientHandler(clientSocket);
                clientList.add(clientHandler);
                new Thread(clientHandler).start();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Gửi tin nhắn đến tất cả các client
    public static void broadcast(String message, ClientHandler sender) {
        for (ClientHandler client : clientList) {
            if (client != sender) {
                client.sendMessage(message);
            }
        }
    }

    // Xóa client khỏi danh sách khi client ngắt kết nối
    public static void removeClient(ClientHandler client) {
        clientList.remove(client);
    }

    // Lớp xử lý client
    static class ClientHandler implements Runnable {
        private Socket socket;
        private PrintWriter out;
        private BufferedReader in;

        public ClientHandler(Socket socket) {
            this.socket = socket;
            try {
                out = new PrintWriter(socket.getOutputStream(), true);
                in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        @Override
        public void run() {
            try {
                String message;
                while ((message = in.readLine()) != null) {
                    System.out.println("Received: " + message);
                    TCPServer.broadcast(message, this);
                }
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                try {
                    socket.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                TCPServer.removeClient(this);
            }
        }

        public void sendMessage(String message) {
            out.println(message);
        }
    }
}
