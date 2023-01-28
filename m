Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C39D67FA0F
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Jan 2023 18:47:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2BDA944527
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Jan 2023 17:47:16 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 855D93ED56
	for <greybus-dev@lists.linaro.org>; Sat, 28 Jan 2023 17:47:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=FaA8BK6H;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 76074B806A0;
	Sat, 28 Jan 2023 17:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DBAC433EF;
	Sat, 28 Jan 2023 17:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674928029;
	bh=c3n0kLR7Zkg0nZae8x46dJDbuytPTt4re9xU6aLzm0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FaA8BK6HSqtWc5lOVwX+JzPNTQGiKe0xth8xnv77yDu9WUdgzvxaKMqTYFrBYxONl
	 IBKb05px0pZcZeL6YLK67/ZfW4S6PdSttOkujHjK5x0PUcKeAZwIrAuinReF+8WKcK
	 ej/xFp3uy3c1bFQBzfAH5UaFz5J0MB+4wItv3DgU=
Date: Sat, 28 Jan 2023 18:47:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tom Rix <trix@redhat.com>
Message-ID: <Y9VfmT3Umlo7LHN6@kroah.com>
References: <20230128155706.1243283-1-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230128155706.1243283-1-trix@redhat.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 855D93ED56
X-Spamd-Bar: ----------
X-Spamd-Result: default: False [-10.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_IN_DNSWL_HI(-1.00)[52.25.139.140:received,145.40.68.75:from];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.68.75];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
Message-ID-Hash: 444E7QYSCRSSLQ2CMTCRV6QTTZVPH6NV
X-Message-ID-Hash: 444E7QYSCRSSLQ2CMTCRV6QTTZVPH6NV
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: remove unused header variable in gb_operation_message_alloc()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/444E7QYSCRSSLQ2CMTCRV6QTTZVPH6NV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jan 28, 2023 at 07:57:06AM -0800, Tom Rix wrote:
> cppcheck reports
> drivers/greybus/operation.c:365:31: style: Variable 'header' is not assigned a value. [unassignedVariable]
>  struct gb_operation_msg_hdr *header;
>                               ^

That's not a real problem.

> header is only used to calculate the size of the messge.  This can be done without a variable
> but rather with calling sizeof() with the struct type.
> 
> Fixes: dc779229b538 ("greybus: introduce gb_operation_message_init()")

This is not a bug that is being fixed.

> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/greybus/operation.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
> index 8459e9bc0749..9d322fc6531b 100644
> --- a/drivers/greybus/operation.c
> +++ b/drivers/greybus/operation.c
> @@ -362,8 +362,7 @@ gb_operation_message_alloc(struct gb_host_device *hd, u8 type,
>  			   size_t payload_size, gfp_t gfp_flags)
>  {
>  	struct gb_message *message;
> -	struct gb_operation_msg_hdr *header;
> -	size_t message_size = payload_size + sizeof(*header);
> +	size_t message_size = payload_size + sizeof(struct gb_operation_msg_hdr);

The compiler does not use any extra room for header, so this should be
fine, it's not a real issue.

cppcheck almost never finds anything real, be careful...

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
