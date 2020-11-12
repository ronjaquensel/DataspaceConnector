package de.fraunhofer.isst.dataspaceconnector.services.communication;

import okhttp3.Response;

import java.io.IOException;

/**
 * <p>MessageService interface.</p>
 *
 * @author Julia Pampus
 * @version $Id: $Id
 */
public interface MessageService {
    /**
     * <p>sendLogMessage.</p>
     *
     * @return a {@link okhttp3.Response} object.
     * @throws java.io.IOException if any.
     */
    Response sendLogMessage() throws IOException;

    /**
     * <p>sendNotificationMessage.</p>
     *
     * @param recipient a {@link java.lang.String} object.
     * @return a {@link okhttp3.Response} object.
     * @throws java.io.IOException if any.
     */
    Response sendNotificationMessage(String recipient) throws IOException;
}
