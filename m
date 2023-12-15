Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC89814CD9
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Dec 2023 17:20:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7D85140D50
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Dec 2023 16:20:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 6B7763EFA7
	for <greybus-dev@lists.linaro.org>; Fri, 15 Dec 2023 16:20:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=eZdGiigm;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F303B626AC;
	Fri, 15 Dec 2023 16:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6BFC433C8;
	Fri, 15 Dec 2023 16:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702657223;
	bh=Cukggf5RuYjVp8uLz9Wr3r+uW+U+//IFSZh8tKw2rfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZdGiigm9hf8PGZmgjujy6TgqZShWc7sm9yEQ3b0Rz074zkJ4wsqA+iulU6FMlJjg
	 Nlayqgjgv/BzyS0xsJnfUFAspGZLMmZoVxVH+WRoCamW4YQtXw+HZRQKKvZpUXMmqr
	 7Rg4kssuffZvRvZsFv76vVY3BLwPvfsusjZYhBqs=
Date: Fri, 15 Dec 2023 17:20:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023121559-overfed-kisser-3923@gregkh>
References: <20231211065420.213664-1-ayushdevel1325@gmail.com>
 <20231211065420.213664-2-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231211065420.213664-2-ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: 6B7763EFA7
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 2JHJC6AXYNVVHAE4VZDOR26XA477XBZJ
X-Message-ID-Hash: 2JHJC6AXYNVVHAE4VZDOR26XA477XBZJ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, nm@ti.com, yujie.liu@intel.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH V2 1/1] greybus: gb-beagleplay: Remove use of pad bytes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2JHJC6AXYNVVHAE4VZDOR26XA477XBZJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 11, 2023 at 12:24:18PM +0530, Ayush Singh wrote:
> Make gb-beagleplay greybus spec compliant by moving cport information to
> transport layer instead of using `header->pad` bytes.
> 
> Greybus HDLC frame now has the following payload:
> 1. le16 cport
> 2. gb_operation_msg_hdr msg_header
> 3. u8 *msg_payload
> 
> Fixes: ec558bbfea67 ("greybus: Add BeaglePlay Linux Driver")
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
>  drivers/greybus/gb-beagleplay.c | 55 ++++++++++++++++++++++++---------
>  1 file changed, 41 insertions(+), 14 deletions(-)

This doesn't apply against my char-misc-next branch at all, what did you
generate it against?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
