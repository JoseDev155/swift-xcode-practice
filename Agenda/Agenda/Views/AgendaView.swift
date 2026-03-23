//
//  AgendaView.swift
//  Agenda
//
//  Created by Jose Ramos on 23/3/26.
//

import SwiftUI

struct AgendaView: View {
    // Estados para los campos de texto
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var address: String = ""
    
    // Lista de contactos guardados
    @State private var contacts: [Contact] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Nuevo Contacto")) {
                        TextField("Nombre completo", text: $name)
                        TextField("Teléfono", text: $phone)
                            .keyboardType(.phonePad)
                        TextField("Dirección", text: $address)
                    }
                    
                    Section {
                        Button(action: saveContact) {
                            HStack {
                                Spacer()
                                Text("Guardar en Agenda")
                                    .bold()
                                Spacer()
                            }
                        }
                        .disabled(name.isEmpty || phone.isEmpty)
                    }
                    
                    Section(header: Text("Contactos Guardados")) {
                        if contacts.isEmpty {
                            Text("No hay contactos aún")
                                .foregroundColor(.secondary)
                                .font(.footnote)
                        } else {
                            ForEach(contacts) { contact in
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(contact.name)
                                        .font(.headline)
                                    Text("📞 \(contact.phone)")
                                        .font(.subheadline)
                                        .foregroundColor(.blue)
                                    Text("🏠 \(contact.address)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.vertical, 4)
                            }
                            .onDelete(perform: deleteContact)
                        }
                    }
                }
            }
            .navigationTitle("Agenda Personal")
            .toolbar {
                EditButton() // Permite borrar contactos
            }
        }
    }
    
    private func saveContact() {
        let newContact = Contact(name: name, phone: phone, address: address)
        contacts.append(newContact)
        
        // Limpiar campos
        name = ""
        phone = ""
        address = ""
    }
    
    private func deleteContact(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }
}
