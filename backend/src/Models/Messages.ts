import {Conversations} from './Conversations'
import {Users} from './Users'

export type Messages = {
    id: number,
    guid: string,
    body: string,
    sentOn: Date,
    readOn: Date | null,
    conversationId: number,
    senderId: number,
    conversation: Conversations,
    sender: Users
}