Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7F7A87865
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Apr 2025 09:05:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2170844A18
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Apr 2025 07:05:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id A44CF40C96
	for <greybus-dev@lists.linaro.org>; Mon, 14 Apr 2025 07:05:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Q3NXFZWZ;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 075124507F;
	Mon, 14 Apr 2025 07:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A17C4CEEA;
	Mon, 14 Apr 2025 07:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744614328;
	bh=LFGH4G8URc3usfSiHyKn3cdRJqfpMIrM0YqzvbRMj4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3NXFZWZpbCMnUkMgJZv23DlHjwT+JxinguU6VMT9IZSO6/6a0YMReH4ST7K0hRbi
	 tEMcnt2VqRvp9phnhc0zZwgaLg6UTye6+xL7qcTGV1/Chz1ipQsUj5hnR9sGH3RMbE
	 Emd/1WG0apr3cH6PqumzS2Vh3qlMBimfGW09IhsBMhXkBOcJSG0N//t8pIjk+Bngzk
	 ssR0J+h188qkgInypYw9mEo8j6Lteu22WvHn3Q1iJRk2tR2t9mk+Zj8KpAvxBa8m6l
	 n5DfQ2OkOo7M9PLFxm+xJBE4cqqjeEN4MSZhUyjI9aKuvya/kuzeqOTLR/O0z9D3Go
	 jex4KUCvR2oYA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u4Dsi-000000001N8-31fv;
	Mon, 14 Apr 2025 09:05:24 +0200
Date: Mon, 14 Apr 2025 09:05:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Message-ID: <Z_yztGweLAfJgwXh@hovoldconsulting.com>
References: <20250413104802.49360-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250413104802.49360-2-thorsten.blum@linux.dev>
X-Rspamd-Queue-Id: A44CF40C96
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-9.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	RBL_SENDERSCORE_REPUT_9(-1.00)[172.234.252.31:from];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:20940, ipnet:172.232.0.0/13, country:NL];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: MMGPGTAZX2XSSEGZHREHAUUM4U6EIVGT
X-Message-ID-Hash: MMGPGTAZX2XSSEGZHREHAUUM4U6EIVGT
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Reformat code in gb_operation_sync_timeout()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MMGPGTAZX2XSSEGZHREHAUUM4U6EIVGT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Apr 13, 2025 at 12:48:03PM +0200, Thorsten Blum wrote:
> Remove any unnecessary curly braces and combine 'else' and 'if' to an
> 'else if' to improve the code's readability and reduce indentation.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/greybus/operation.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
> index 8459e9bc0749..ba26504ccac3 100644
> --- a/drivers/greybus/operation.c
> +++ b/drivers/greybus/operation.c
> @@ -1157,16 +1157,12 @@ int gb_operation_sync_timeout(struct gb_connection *connection, int type,
>  		memcpy(operation->request->payload, request, request_size);
>  
>  	ret = gb_operation_request_send_sync_timeout(operation, timeout);
> -	if (ret) {
> +	if (ret)
>  		dev_err(&connection->hd->dev,
>  			"%s: synchronous operation id 0x%04x of type 0x%02x failed: %d\n",
>  			connection->name, operation->id, type, ret);
> -	} else {
> -		if (response_size) {
> -			memcpy(response, operation->response->payload,
> -			       response_size);
> -		}
> -	}
> +	else if (response_size)
> +		memcpy(response, operation->response->payload, response_size);

NAK

This just makes the code *less* readable.

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
