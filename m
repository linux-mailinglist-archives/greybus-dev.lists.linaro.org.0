Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Oj1xGTxJq2mzbwEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 06 Mar 2026 22:38:04 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E82EE2280C8
	for <lists+greybus-dev@lfdr.de>; Fri, 06 Mar 2026 22:38:03 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9422040155
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Mar 2026 21:38:02 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 083793F6B6
	for <greybus-dev@lists.linaro.org>; Fri,  6 Mar 2026 21:38:00 +0000 (UTC)
MIME-Version: 1.0
From: "Yacin Belmihoub-Martel" <yacin.belmihoub-martel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri, 06 Mar 2026 21:38:00 -0000
Message-ID: <177283308002.1371925.5630799198269313397@lists.linaro.org>
In-Reply-To: <20260210235622.79706-1-yacin.belmihoubmartel@gmail.com>
References: <20260210235622.79706-1-yacin.belmihoubmartel@gmail.com>
User-Agent: HyperKitty on http://lists.linaro.org/
Message-ID-Hash: U7I46LZZBSMO5OD2WP6YKG5Y4GPB7IAO
X-Message-ID-Hash: U7I46LZZBSMO5OD2WP6YKG5Y4GPB7IAO
X-MailFrom: yacin.belmihoub-martel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: match `GREYBUS_DEVICE` drivers to vendor class bundles
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/U7I46LZZBSMO5OD2WP6YKG5Y4GPB7IAO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E82EE2280C8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.49 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_RHS_MATCH_TO(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.241];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yacin.belmihoub-martel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:mid,lists.linaro.org:rdns,lists.linaro.org:helo,linaro.org:email]
X-Rspamd-Action: no action

Hi!

I'm wondering if I could get an update on this patch? We are currently using Greybus device drivers 
for testing and we're getting issues making the Device driver co-exist with the standard class drivers.

Thanks,
Yacin
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
