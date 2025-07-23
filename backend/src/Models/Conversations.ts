import {TradeRequests} from './TradeRequests'
import {Messages} from './Messages'

export type Conversations = {
    id: number,
    guid: string,
    createdOn: Date,
    tradeRequestId: number,
    tradeRequest: TradeRequests,
    messages: Messages[]
}
