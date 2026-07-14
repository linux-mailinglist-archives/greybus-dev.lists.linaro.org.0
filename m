Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +ylNJID6VWo6xQAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Jul 2026 10:59:44 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D5A752A31
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Jul 2026 10:59:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linuxfoundation.org header.s=korg header.b=UicaHG+j;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linuxfoundation.org (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1D168405D2
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Jul 2026 08:51:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 28854401B9
	for <greybus-dev@lists.linaro.org>; Tue, 14 Jul 2026 08:51:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 79553601ED;
	Tue, 14 Jul 2026 07:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE24F1F000E9;
	Tue, 14 Jul 2026 07:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784014765;
	bh=AoVOJidFmWtN4CGApV3MiB3v3N7FZ12vnAjGAFZmxTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UicaHG+j+q7j95Yz56XaC8NbooVWTIhyzWhxSYY5FGEMFfGFVG9RKBASh/dEdaH+G
	 iUCwj5v7uz9ppC+8NBua/X1qLoK7VZih8HEpWsdaVX+ividT+mb/hum0Q0w9S2EV/O
	 v2ZMXWy5o8r3TZF3uSyr9/f73+LlfUYgERUerBds=
Date: Tue, 14 Jul 2026 09:39:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alfie Varghese <alfievarghese22@gmail.com>
Message-ID: <2026071408-growing-thespian-b521@gregkh>
References: <CAHp0ZPPbdc+5PgFUDVgamt_Ds8xAY=K_GgH3abx3ucpndGepFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp0ZPPbdc+5PgFUDVgamt_Ds8xAY=K_GgH3abx3ucpndGepFg@mail.gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: CM2UYRX7B5IWWRJBL2VFO4SOWYVBG7CL
X-Message-ID-Hash: CM2UYRX7B5IWWRJBL2VFO4SOWYVBG7CL
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: uart: return tty_alloc_driver() errors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CM2UYRX7B5IWWRJBL2VFO4SOWYVBG7CL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alfievarghese22@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:from_mime,linaro.org:email,lists.linaro.org:from_smtp,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10D5A752A31

On Tue, Jul 14, 2026 at 12:42:04PM +0530, Alfie Varghese wrote:
> gb_tty_init() maps any tty_alloc_driver() failure to -ENOMEM.
> tty_alloc_driver() currently always returns -ENOMEM on failure,
> so this does not change behavior in practice. However, returning
> PTR_ERR(gb_tty_driver) is more correct and consistent with kernel
> conventions, preserving any future error codes the function might
> return.
> 
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
> ---
> v2: updated commit message per Dan Carpenter's review to clarify
> that tty_alloc_driver() currently only returns -ENOMEM, making
> this a style fix rather than a behavioral change.
> 
> drivers/staging/greybus/uart.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 7d060b4cd33d..24b4dab069c3 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -951,7 +951,7 @@ static int gb_tty_init(void)
> if (IS_ERR(gb_tty_driver)) {
> pr_err("Can not allocate tty driver\n");
> - retval = -ENOMEM;
> + retval = PTR_ERR(gb_tty_driver);
> goto fail_unregister_dev;
> }

Something went really wrong with this patch, it is corrupted :(
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
