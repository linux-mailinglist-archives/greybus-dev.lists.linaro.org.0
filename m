Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D1998403992
	for <lists+greybus-dev@lfdr.de>; Wed,  8 Sep 2021 14:16:35 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3ED506341F
	for <lists+greybus-dev@lfdr.de>; Wed,  8 Sep 2021 12:16:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 758026102D; Wed,  8 Sep 2021 12:16:32 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CAC1661021;
	Wed,  8 Sep 2021 12:16:29 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6918B6057E
 for <greybus-dev@lists.linaro.org>; Wed,  8 Sep 2021 12:16:28 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 64CE260E15; Wed,  8 Sep 2021 12:16:28 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by lists.linaro.org (Postfix) with ESMTPS id 5B6B56057E
 for <greybus-dev@lists.linaro.org>; Wed,  8 Sep 2021 12:16:26 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id v16so2043323ilo.10
 for <greybus-dev@lists.linaro.org>; Wed, 08 Sep 2021 05:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+GtAWakd3pdV8HQ9F3sd52YrBJrg5R1xSo+M5bxbcpM=;
 b=gEictymgNG4qWkNdiHTk3Ai+MVxyUTVoFa+sTi9CD86hHkRokj6A90ykjKYM1y2CBr
 1iJ5gllin4eBbqHMagANOYi+/lpZATWOe6M6+QN8Z0Z1KtbulXLBv4sZbp4LNdPQXnWZ
 LfxyP2atZKmJNku7Tksle0Q85lylxvMIoh+qDJHRSAmvH8G/UQEhMSY3FHawrOTaUD1n
 kTSWCJEFcOO1VRfhqK26vpRcqHSBGRJUSZJ44MQ7tU+AfTHHzSacVdu6FnRq5pulT1ON
 +sADDGtmj43e6yE0VGO0rhqOyk8ZLIHCInqu3CZhbcJnSevF2NHTq31/Z4m+WQ4KLbid
 bfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+GtAWakd3pdV8HQ9F3sd52YrBJrg5R1xSo+M5bxbcpM=;
 b=vv44tWdCT/Wy5Vh6mOJlIOu+W0ShoS5fWzyTipVEkO28Qv+D04kJ8mQDkPOxlgLNQr
 2KiZtj7kZIiQ+NM/LDbGipff5qg7Ywg3MYZkWTL7cp3hRoHtiaaDbmu6ct8dn0fKKWWE
 h024YMvyT9DcLNxDvTTxkM2zQU5mGVlRjVvFfyNZQTnUjHII/sNW04HneE6y4Du8Skg5
 GIjagZu3EfU20W4kYECZCMbLRZH7lfe9MNFqGQwT7ruNBaha8ZkPxx1wsCxL+hPz1a0I
 QBfW9g4h/jmU+ih4BqYRgH4aDAA2FtQ4rvAET+YPubbsHQVhTK0LYjmXO3ofQersyEXz
 KDHw==
X-Gm-Message-State: AOAM533jdbclUJkJw/G0SB6BP73+33mz1nBKYaH5rw+wutVAHbaUnSZZ
 s7MMI7bhpWucTRJ9rl/5fTbyHA6B
X-Google-Smtp-Source: ABdhPJzRXh8bRGnBu/21Dpmv3vWUZkpgIUUYj6TIJhcmSYhtSmzslICbd3iPLxkRJv5ySd0sBBScmA==
X-Received: by 2002:a92:c5cf:: with SMTP id s15mr2710598ilt.62.1631103385661; 
 Wed, 08 Sep 2021 05:16:25 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id p15sm1070440iop.15.2021.09.08.05.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 05:16:25 -0700 (PDT)
To: Johan Hovold <johan@kernel.org>
References: <20210906124538.22358-1-johan@kernel.org>
 <56782caa-bd9d-b049-7ca6-c64e3fbe109a@linaro.org>
 <YThsyOlHqWmb5hsV@hovoldconsulting.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <1ec74bbe-2185-d287-09cf-a001d14a012c@linaro.org>
Date: Wed, 8 Sep 2021 07:16:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YThsyOlHqWmb5hsV@hovoldconsulting.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: uart: fix tty use after
 free
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: Alex Elder <elder@kernel.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 David Lin <dtwlin@gmail.com>, greybus-dev@lists.linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 9/8/21 2:56 AM, Johan Hovold wrote:
> On Tue, Sep 07, 2021 at 08:32:25AM -0500, Alex Elder wrote:
>> On 9/6/21 7:45 AM, Johan Hovold wrote:
>    
>>> +static void gb_tty_port_destruct(struct tty_port *port)
>>> +{
>>> +	struct gb_tty *gb_tty = container_of(port, struct gb_tty, port);
>>> +
>>
>> So the minor number is GB_NUM_MINORS until after both the buffer
>> and the kfifo have been allocated.
> 
> Yes, but more importantly until the minor number has been allocated.
> 
>> And kfifo_free() (similar to
>> kfree()) handles being provided a non-initialized kfifo, correct?
> 
> Correct, as long as it has been zeroed.

The original patch looks fine to me.  Thanks for the explanation.

Reviewed-by: Alex Elder <elder@linaro.org>

>>> +	if (gb_tty->minor != GB_NUM_MINORS)
>>> +		release_minor(gb_tty);
>>> +	kfifo_free(&gb_tty->write_fifo);
>>> +	kfree(gb_tty->buffer);
>>> +	kfree(gb_tty);
>>> +}
>>> +
>>>    static const struct tty_operations gb_ops = {
>>>    	.install =		gb_tty_install,
>>>    	.open =			gb_tty_open,
>>> @@ -786,6 +797,7 @@ static const struct tty_port_operations gb_port_ops = {
>>>    	.dtr_rts =		gb_tty_dtr_rts,
>>>    	.activate =		gb_tty_port_activate,
>>>    	.shutdown =		gb_tty_port_shutdown,
>>> +	.destruct =		gb_tty_port_destruct,
>>>    };
>>>    
>>>    static int gb_uart_probe(struct gbphy_device *gbphy_dev,
>>> @@ -798,17 +810,11 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
>>>    	int retval;
>>>    	int minor;
>>>    
>>> -	gb_tty = kzalloc(sizeof(*gb_tty), GFP_KERNEL);
>>> -	if (!gb_tty)
>>> -		return -ENOMEM;
>>> -
>>
>> Why do you reorder when you allocate the gb_tty structure?
>> I don't have a problem with it, but it seems like the order
>> doesn't matter.  Is it just so you can initialize it right
>> after it's allocated?  (If so, I like that reason.)
> 
> Yeah, and I wanted to keep the bits managed by the port reference count
> together.
> 
>>>    	connection = gb_connection_create(gbphy_dev->bundle,
>>>    					  le16_to_cpu(gbphy_dev->cport_desc->id),
>>>    					  gb_uart_request_handler);
>>> -	if (IS_ERR(connection)) {
>>> -		retval = PTR_ERR(connection);
>>> -		goto exit_tty_free;
>>> -	}
>>> +	if (IS_ERR(connection))
>>> +		return PTR_ERR(connection);
>>>    
>>>    	max_payload = gb_operation_get_payload_size_max(connection);
>>>    	if (max_payload < sizeof(struct gb_uart_send_data_request)) {
>>> @@ -816,13 +822,23 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
>>>    		goto exit_connection_destroy;
>>>    	}
>>>    
>>> +	gb_tty = kzalloc(sizeof(*gb_tty), GFP_KERNEL);
>>> +	if (!gb_tty) {
>>> +		retval = -ENOMEM;
>>> +		goto exit_connection_destroy;
>>> +	}
>>> +
>>> +	tty_port_init(&gb_tty->port);
>>> +	gb_tty->port.ops = &gb_port_ops;
>>> +	gb_tty->minor = GB_NUM_MINORS;
>>> +
>>>    	gb_tty->buffer_payload_max = max_payload -
>>>    			sizeof(struct gb_uart_send_data_request);
>>>    
>>>    	gb_tty->buffer = kzalloc(gb_tty->buffer_payload_max, GFP_KERNEL);
>>>    	if (!gb_tty->buffer) {
>>>    		retval = -ENOMEM;
>>> -		goto exit_connection_destroy;
>>> +		goto exit_put_port;
>>>    	}
>>>    
>>>    	INIT_WORK(&gb_tty->tx_work, gb_uart_tx_write_work);
>>> @@ -830,7 +846,7 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
>>>    	retval = kfifo_alloc(&gb_tty->write_fifo, GB_UART_WRITE_FIFO_SIZE,
>>>    			     GFP_KERNEL);
>>>    	if (retval)
>>> -		goto exit_buf_free;
>>> +		goto exit_put_port;
>>>    
>>>    	gb_tty->credits = GB_UART_FIRMWARE_CREDITS;
>>>    	init_completion(&gb_tty->credits_complete);
>>> @@ -844,7 +860,7 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
>>>    		} else {
>>>    			retval = minor;
>>>    		}
>>> -		goto exit_kfifo_free;
>>> +		goto exit_put_port;
>>>    	}
>>>    
>>>    	gb_tty->minor = minor;
>>> @@ -853,9 +869,6 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
>>>    	init_waitqueue_head(&gb_tty->wioctl);
>>>    	mutex_init(&gb_tty->mutex);
>>>    
>>> -	tty_port_init(&gb_tty->port);
>>> -	gb_tty->port.ops = &gb_port_ops;
>>> -
>>>    	gb_tty->connection = connection;
>>>    	gb_tty->gbphy_dev = gbphy_dev;
>>>    	gb_connection_set_data(connection, gb_tty);
>>> @@ -863,7 +876,7 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
>>>    
>>>    	retval = gb_connection_enable_tx(connection);
>>>    	if (retval)
>>> -		goto exit_release_minor;
>>> +		goto exit_put_port;
>>>    
>>>    	send_control(gb_tty, gb_tty->ctrlout);
>>>    
>>> @@ -890,16 +903,10 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
>>>    
>>>    exit_connection_disable:
>>>    	gb_connection_disable(connection);
>>> -exit_release_minor:
>>> -	release_minor(gb_tty);
>>> -exit_kfifo_free:
>>> -	kfifo_free(&gb_tty->write_fifo);
>>> -exit_buf_free:
>>> -	kfree(gb_tty->buffer);
>>> +exit_put_port:
>>> +	tty_port_put(&gb_tty->port);
>>>    exit_connection_destroy:
>>>    	gb_connection_destroy(connection);
>>> -exit_tty_free:
>>> -	kfree(gb_tty);
>>>    
>>>    	return retval;
>>>    }
>>> @@ -930,15 +937,10 @@ static void gb_uart_remove(struct gbphy_device *gbphy_dev)
>>>    	gb_connection_disable_rx(connection);
>>>    	tty_unregister_device(gb_tty_driver, gb_tty->minor);
>>>    
>>> -	/* FIXME - free transmit / receive buffers */
>>> -
>>>    	gb_connection_disable(connection);
>>> -	tty_port_destroy(&gb_tty->port);
>>>    	gb_connection_destroy(connection);
>>> -	release_minor(gb_tty);
>>> -	kfifo_free(&gb_tty->write_fifo);
>>> -	kfree(gb_tty->buffer);
>>> -	kfree(gb_tty);
>>> +
>>> +	tty_port_put(&gb_tty->port);
>>
>> In the error path above, you call tty_port_put()
>> before calling gb_connection_destroy(), which matches
>> (in reverse) the order in which they're created. I'm
>> accustomed to having the order of the calls here match
>> the error path.  Is this difference intentional?  (It
>> shouldn't really matter.)
> 
> I considered reordering (it stands out a bit in my eyes too) but decided
> to leave it in place to highlight the fact that the connection may be
> freed before the rest of the state either way (since a user may hold a
> reference to it).
> 
> [ A driver mustn't do I/O after remove() returns even if it might be
>    possible to keep the connection structure around. That would however be
>    complicated by the lack of reference counting on the bundle/interface
>    structures so I decided not to venture down that path. ]
> 
> Like you say, the order here doesn't really matter so I can move it up
> if you prefer.
> 
> Johan
> 

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
