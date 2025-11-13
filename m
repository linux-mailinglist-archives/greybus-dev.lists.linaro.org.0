Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A34A4C57C38
	for <lists+greybus-dev@lfdr.de>; Thu, 13 Nov 2025 14:46:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BBD0C3F80C
	for <lists+greybus-dev@lfdr.de>; Thu, 13 Nov 2025 13:46:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 1D9823F6C7
	for <greybus-dev@lists.linaro.org>; Thu, 13 Nov 2025 13:46:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=E89QRwJX;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 940216026C;
	Thu, 13 Nov 2025 13:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FD7C4CEF1;
	Thu, 13 Nov 2025 13:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763041564;
	bh=tbmShB58/A4V/gyp12BMzsTR5XfUTVWVtUcByvJPYIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E89QRwJXX642yqpxb+10seEAGu8mLzKzLQs7ffB5/lxZguXdBHZcpMj4HFjXWbcsp
	 XFFsTfbBKQUqNZd0qMYdBRSziFDWySHsS2qY1WTNYL4AOYeL22U5y2gLfxaGIHBaXd
	 f+gwIj3iL/6tkHeGGYbg+Itmk6G0q+XaA3s7i2M0=
Date: Thu, 13 Nov 2025 08:46:03 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: cjz_VM <guagua210311@qq.com>
Message-ID: <2025111307-deafness-uncrushed-ee56@gregkh>
References: <tencent_7710B04B6BEE52903BA2F56376DB9D18A907@qq.com>
 <2025111341-attendee-ferment-262b@gregkh>
 <tencent_27A546C0D8ACEF4B7DEE94D65FD805769809@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_27A546C0D8ACEF4B7DEE94D65FD805769809@qq.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1D9823F6C7
X-Spamd-Bar: ++
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,animalcreek.com,kernel.org,lists.linaro.org,vger.kernel.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Spam-Level: **
Message-ID-Hash: K6XBC2DVKVTLFCFNU6XNZTTV7BNAHZVP
X-Message-ID-Hash: K6XBC2DVKVTLFCFNU6XNZTTV7BNAHZVP
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio_manager_module: make envp array static const
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K6XBC2DVKVTLFCFNU6XNZTTV7BNAHZVP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 13, 2025 at 09:39:54PM +0800, cjz_VM wrote:
> Hi Greg,
> 
> Thanks for reviewing my patch!
> 
> For sending twice: I apologize for the duplicate. After the first send, I realized I had missed some greybus-specific maintainers, so I resent to include them all.

Then that should have been a v2 patch :)

> For the indentation: You're right to ask about it. When I changed the declaration from 'char *envp[]' to 'static const char * const envp[]', the opening bracket moved to the right due to the longer declaration. I added tabs to keep the array elements aligned with the opening bracket, following the kernel coding style rule that parameters should align with the opening parenthesis.
> 
> If this alignment approach is not preferred, I'm happy to adjust it to whatever style you recommend.

You did not document your change, and it had nothing really to do with
the const change, so I would not recommend doing this.

Also, please do not top-post, and be sure to properly wrap your lines in
your email client.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
