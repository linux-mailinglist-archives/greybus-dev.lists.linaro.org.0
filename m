Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KgNJIclgWnsEQMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Feb 2026 23:30:31 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C98CD2268
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Feb 2026 23:30:31 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 05B823F833
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Feb 2026 22:30:30 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	by lists.linaro.org (Postfix) with ESMTPS id 0A09E3F750
	for <greybus-dev@lists.linaro.org>; Mon,  2 Feb 2026 22:22:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="ilV/fFRS";
	spf=pass (lists.linaro.org: domain of ethantidmore06@gmail.com designates 209.85.128.169 as permitted sender) smtp.mailfrom=ethantidmore06@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78fc4425b6bso43925757b3.1
        for <greybus-dev@lists.linaro.org>; Mon, 02 Feb 2026 14:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770070942; x=1770675742; darn=lists.linaro.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byuDbDXqsC+RTpprTwmnIg5GJlDhbXjIuCmiCm364zw=;
        b=ilV/fFRSTNUSKU5sDkFpvxI24XULbF4VzeQtVHI+oD1SFhLTxIo/jDkZhbOe5AEF/5
         HrcOA9CvjjI314ohxRIPWZqEwZW+0kgw/DOuJ7XrcJUNhx06ilmRfljw4ZbLhZSaeXuc
         IO7q0DxQDMO0LMvVQtp/jE1d8ts4MzMdvJf3Xu7Nc1NaS+0/WIsVmv6EGA8PSQrrxgCa
         5YKQu3ahP8re9DSX8DnuaM4gve6h0MgMpg1CRKQc5cwrnODO2RxpM7B/SU6dnDq2Yp3U
         /woCH25IdOW51V1lTEUyURUErM4MeAqUxItHbJYomHFZqNfB0XyTOf+ziGbNo+zhjIol
         JmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770070942; x=1770675742;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=byuDbDXqsC+RTpprTwmnIg5GJlDhbXjIuCmiCm364zw=;
        b=QIJTQzKdbVs4jt2eF+kxkuIFonaEXQr+jRDS08j46uHc1yT3Tyl65FHKfJWTX0mcwe
         fJH+Pv9iPR6iWsvDOCasK3tWkmwoXI5+FeSWyhxpSkGpOGwDUD1PM510GWjGDlB67rWn
         +pjPnUl0AOdf2NBVcCR4oEu8JjHd8jMK9OdJkEwjVATp9VCe35Fj2dm4af5253WJUnfK
         qNphmMQHoOz0pq5UB0nPvThkfxJ0EsQIHQibKXImrytBEhzjOhFzCkP+ggLthLjmD3zS
         B0PUN67a8MgdwwL36Hn9HHqqVSYy8cd4cm5Q1WaYxLkG2g1N7NCERN317cdKC0HPZHIm
         yHRw==
X-Forwarded-Encrypted: i=1; AJvYcCWOF/zxdJlMnkem03xiP4S47HEd6YFVX1A20M6rj4XMtalAdsRsJqH8WptGzVdPvhf8NFbTsvQMm+Zjnw==@lists.linaro.org
X-Gm-Message-State: AOJu0Yw2dPfZKjsstS2ef4SDGhLNMqMRiYOukzGPs/+vG1ezVY+KNWvY
	7bamTNu68Bvq5lSbuV6nvofxv0Pv2gQ66l0BujmJTNZB9S+JOzNlQhth
X-Gm-Gg: AZuq6aLQ2MZF0oeCIaivhpn7iXFy4d7nCXKwdkyt/0KbK6CKGmHJXQXDcbLsz+Dkyi9
	qXmtl/gJKhmMcSjSPgvwsR5Iw8rG04ZN8oDHMayN18ElLTYOHLQzGmfH7uNOxFfGalKhRf/lyPC
	Ax4+WXbL2r5RrNAKXioNP0k6gwgsPyGntRdphAY1dWr83j9GwwboxQK3QHqCibh9S8pijb7VZxv
	kDND2jelRyciWddzyBEKikfsitFwoHsdvFnysh28W2lVckcH0CJ0welPB+5gnHBWtBTBXLqw9D1
	drJ9shyNgTf42MJMyYL+b1cBiNBIKBFDmyXjSSC6fhzKAQO1a0djBjpxewhaxr9PcOqA9V85ixN
	zw0o2bBw3bmrLc4dxxLt7dY4EAaWePwCLWkgTSupjqZUsccURc5eju62DEDyg5Qcz3c01QqpKyh
	C8VpdcqzVUCp7r6gGNKTVNioeque54wfc=
X-Received: by 2002:a53:ac99:0:b0:649:6b11:78eb with SMTP id 956f58d0204a3-649a84ed9famr10328451d50.68.1770070942309;
        Mon, 02 Feb 2026 14:22:22 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649960642c6sm10280131d50.3.2026.02.02.14.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 14:22:22 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 02 Feb 2026 16:22:07 -0600
Message-Id: <DG4TRYCISMJS.9GAR9YLQ0CNU@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Rachit Dhar" <rchtdhr@gmail.com>, "Viresh Kumar" <vireshk@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260202202643.160199-1-rchtdhr@gmail.com>
In-Reply-To: <20260202202643.160199-1-rchtdhr@gmail.com>
X-Spamd-Bar: ---
X-MailFrom: ethantidmore06@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UL5XBZU5TZUQI3O7WDERKZL7UN2M5OKO
X-Message-ID-Hash: UL5XBZU5TZUQI3O7WDERKZL7UN2M5OKO
X-Mailman-Approved-At: Mon, 02 Feb 2026 22:30:28 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/3] staging: greybus: resolved checkpatch checks for fw-management.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UL5XBZU5TZUQI3O7WDERKZL7UN2M5OKO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.09 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 1C98CD2268
X-Rspamd-Action: no action

On Mon Feb 2, 2026 at 2:26 PM CST, Rachit Dhar wrote:
>  		ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
> -				intf_load.load_method, intf_load.firmware_tag);
> +							  intf_load.load_method,
> +							  intf_load.firmware_tag);
>  		if (ret)
>  			return ret;
>  

This should be it's own style patch. Please keep one logical change per patch.

ET
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
