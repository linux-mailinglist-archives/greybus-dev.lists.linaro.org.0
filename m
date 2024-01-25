Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B789083BABE
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jan 2024 08:37:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B73B443F6C
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jan 2024 07:37:04 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id DF8E23F0C8
	for <greybus-dev@lists.linaro.org>; Thu, 25 Jan 2024 07:36:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=udGMN9yU;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=johan@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 43F05CE323C;
	Thu, 25 Jan 2024 07:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7012AC433F1;
	Thu, 25 Jan 2024 07:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706168215;
	bh=Q0JfeFCfMgWrfWnzoium/IVe2Po+3kpp7VAaqloEz1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udGMN9yUHMrxmaVOhoVNPCuuuvuWNxMNgTYMLtmrJz/NohKEw40gPBGRhBk/o8z66
	 SunP1i24pgaoednuaG5F0URxtAEbFYmKrN7DQxL/d6lRtm2lJ73Tthj4pKgcfmHWi3
	 AdnAQPY1/9hH3bJlR/zHWLCX+L3FVD0dNnpDdW/SYjNEMPpDH90yd7ulOM3KkkpOq6
	 SE+jiunstsmfRYgX6YIB7AzVU0H9FoJ78OeMZwt21R/vpFuYIhv8uw988w0ER9Y5UK
	 BP7El39bEffgeKuj8WbQKV3dMX8XgshWr87G5PEh+J/T5P1vqAWS8Qp4MJVvujaz2A
	 fuQDuh1Cn24UA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rSuIL-000000005sx-1MRL;
	Thu, 25 Jan 2024 08:37:05 +0100
Date: Thu, 25 Jan 2024 08:37:05 +0100
From: Johan Hovold <johan@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Message-ID: <ZbIPoW2LKXJVz3oV@hovoldconsulting.com>
References: <20240122180551.34429-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240122180551.34429-1-francesco@dolcini.it>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DF8E23F0C8
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,toradex.com,gmail.com,redhat.com,google.com,davemloft.net,linaro.org,linux.intel.com,chromium.org,huawei.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[huawei.com:email];
	DKIM_TRACE(0.00)[kernel.org:+]
Message-ID-Hash: JPRXFU77AMWTOA4Q4OOKQNA26AM7ZFXY
X-Message-ID-Hash: JPRXFU77AMWTOA4Q4OOKQNA26AM7ZFXY
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Alex Elder <elder@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Rob Herring <robh@kernel.org>, Jonathan Cameron 
 <Jonathan.Cameron@huawei.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] treewide, serdev: change receive_buf() return type to size_t
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JPRXFU77AMWTOA4Q4OOKQNA26AM7ZFXY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 22, 2024 at 07:05:51PM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> receive_buf() is called from ttyport_receive_buf() that expects values
> ">= 0" from serdev_controller_receive_buf(), change its return type from
> ssize_t to size_t.
> 
> The need for this clean-up was noticed while fixing a warning, see
> commit 94d053942544 ("Bluetooth: btnxpuart: fix recv_buf() return value").
> Changing the callback prototype to return an unsigned seems the best way
> to document the API and ensure that is properly used.
> 
> GNSS drivers implementation of serdev receive_buf() callback return
> directly the return value of gnss_insert_raw(). gnss_insert_raw()
> returns a signed int, however this is not an issue since the value
> returned is always positive, because of the kfifo_in() implementation.
> gnss_insert_raw() could be changed to return also an unsigned, however
> this is not implemented here as request by the GNSS maintainer Johan
> Hovold.
> 
> Suggested-by: Jiri Slaby <jirislaby@kernel.org>
> Link: https://lore.kernel.org/all/087be419-ec6b-47ad-851a-5e1e3ea5cfcc@kernel.org/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for-iio
> ---
> v1:
>  - https://lore.kernel.org/all/20231214170146.641783-1-francesco@dolcini.it/
> v2:
>  - rebased on 6.8-rc1
>  - add acked-by Jonathan
>  - do not change gnss_insert_raw()
>  - do not change the code style of the gnss code
>  - commit message improvements, explain the reasons for doing only minimal
>    changes on the GNSS part

Looks good to me now:

Reviewed-by: Johan Hovold <johan@kernel.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
